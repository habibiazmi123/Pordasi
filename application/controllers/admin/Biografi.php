<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Biografi extends CI_Controller
{

    // Load database
    public function __construct()
    {
        parent::__construct();
        $this->load->model('biografi_model');
        $this->load->model('jabatan_model');
        $this->log_user->add_log();
        // Tambahkan proteksi halaman
        $url_pengalihan = str_replace('index.php/', '', current_url());
        $pengalihan     = $this->session->set_userdata('pengalihan', $url_pengalihan);
        // Ambil check login dari simple_login
        $this->simple_login->check_login($pengalihan);
    }

    public function index()
    {
        $biografi = $this->biografi_model->listing();

        $data = array(
            'title'         => 'Biografi',
            'biografi'        => $biografi,
            'isi'           => 'admin/biografi/list'
        );
        $this->load->view('admin/layout/wrapper', $data, FALSE);
    }

    public function proses()
    {
        // PROSES HAPUS MULTIPLE
        if (isset($_POST['hapus'])) {
            $inp                 = $this->input;
            $id_biografinya        = $inp->post('id');

            for ($i = 0; $i < sizeof($id_biografinya); $i++) {
                $biografi     = $this->biografi_model->detail($id_biografinya[$i]);
                if ($biografi->profil_picture != '') {
                    unlink('./assets/upload/image/' . $biografi->profil_picture);
                    unlink('./assets/upload/thumbs/' . $biografi->profil_picture);
                }
                $data = array('id'    => $id_biografinya[$i]);
                $this->biografi_model->delete($data);
            }

            $this->session->set_flashdata('sukses', 'Data telah dihapus');
            redirect(base_url('admin/biografi'), 'refresh');
            // PROSES SETTING DRAFT
        }
    }

    // Tambah
    public function tambah()
    {
        $jabatan = $this->jabatan_model->listing();

        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'jabatan_id',
            'Jabatan',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'nama',
            'Nama',
            'required',
            array(
                'required'        => '%s harus diisi',
            )
        );

        $validasi->set_rules(
            'deskripsi',
            'Deskripsi',
            'required',
            array('required'        => '%s harus diisi')
        );

        if ($validasi->run() === FALSE) {
            // End validasi

            $data = array(
                'title'        => 'Tambah Biografi',
                'jabatan' => $jabatan,
                'isi'        => 'admin/biografi/tambah'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {

            $config['upload_path']   = './assets/upload/image/';
            $config['allowed_types'] = 'gif|jpg|png|svg|jpeg';
            $config['max_size']      = '12000'; // KB  
            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('gambar')) {
                // End validasi

                $data = array(
                    'title'                => 'Tambah Biografi',
                    'error'                => $this->upload->display_errors(),
                    'isi'                => 'admin/biografi/tambah'
                );
                $this->load->view('admin/layout/wrapper', $data, FALSE);
                // Masuk database
            } else {
                $upload_data                = array('uploads' => $this->upload->data());
                // Image Editor
                $config['image_library']      = 'gd2';
                $config['source_image']       = './assets/upload/image/' . $upload_data['uploads']['file_name'];
                $config['new_image']         = './assets/upload/image/thumbs/';
                $config['create_thumb']       = TRUE;
                $config['quality']           = "100%";
                $config['maintain_ratio']   = TRUE;
                $config['width']               = 500; // Pixel
                $config['height']           = 500; // Pixel
                $config['x_axis']           = 0;
                $config['y_axis']           = 0;
                $config['thumb_marker']       = '';
                $this->load->library('image_lib', $config);
                $this->image_lib->resize();

                $inp = $this->input;

                $data = array(
                    'jabatan_id'        => $inp->post('jabatan_id'),
                    'nama'        => $inp->post('nama'),
                    'deskripsi'            => $inp->post('deskripsi'),
                    'profil_picture'        => $upload_data['uploads']['file_name']
                );

                $this->biografi_model->tambah($data);
                $this->session->set_flashdata('sukses', 'Data telah ditambahkan');
                redirect(base_url('admin/biografi'), 'refresh');
            }
        }
        // End masuk database

        $data = array(
            'title'        => 'Tambah Biografi',
            'jabatan' => $jabatan,
            'isi'        => 'admin/biografi/tambah'
        );
        $this->load->view('admin/layout/wrapper', $data, FALSE);
    }

    // Edit
    public function edit($id)
    {
        $biografi = $this->biografi_model->detail($id);
        $jabatan = $this->jabatan_model->listing();

        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'jabatan_id',
            'Jabatan',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'nama',
            'Nama',
            'required',
            array(
                'required'        => '%s harus diisi',
            )
        );

        $validasi->set_rules(
            'deskripsi',
            'Deskripsi',
            'required',
            array('required'        => '%s harus diisi')
        );

        if ($validasi->run() === FALSE) {
            // End validasi

            $data = array(
                'title'        => 'Edit Biografi',
                'biografi'        => $biografi,
                'jabatan' => $jabatan,
                'isi'        => 'admin/biografi/edit'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {

            if (!empty($_FILES['gambar']['name'])) {
                $config['upload_path']   = './assets/upload/image/';
                $config['allowed_types'] = 'gif|jpg|png|svg|jpeg';
                $config['max_size']      = '12000'; // KB  
                $this->load->library('upload', $config);

                if (!$this->upload->do_upload('gambar')) {
                    // End validasi

                    $data = array(
                        'title'                => 'Edit Biografi',
                        'error'                => $this->upload->display_errors(),
                        'isi'                => 'admin/biografi/tambah'
                    );
                    $this->load->view('admin/layout/wrapper', $data, FALSE);
                    // Masuk database
                } else {
                    $upload_data                = array('uploads' => $this->upload->data());
                    // Image Editor
                    $config['image_library']      = 'gd2';
                    $config['source_image']       = './assets/upload/image/' . $upload_data['uploads']['file_name'];
                    $config['new_image']         = './assets/upload/image/thumbs/';
                    $config['create_thumb']       = TRUE;
                    $config['quality']           = "100%";
                    $config['maintain_ratio']   = TRUE;
                    $config['width']               = 500; // Pixel
                    $config['height']           = 500; // Pixel
                    $config['x_axis']           = 0;
                    $config['y_axis']           = 0;
                    $config['thumb_marker']       = '';
                    $this->load->library('image_lib', $config);
                    $this->image_lib->resize();

                    //Hapus gambar
                    if ($biografi->profil_picture != "") {
                        unlink('./assets/upload/image/' . $biografi->profil_picture);
                        unlink('./assets/upload/image/thumbs/' . $biografi->profil_picture);
                    }
                    // End hapus

                    $inp = $this->input;

                    $data = array(
                        'id'             => $id,
                        'jabatan_id'        => $inp->post('jabatan_id'),
                        'nama'        => $inp->post('nama'),
                        'deskripsi'            => $inp->post('deskripsi'),
                        'profil_picture'        => $upload_data['uploads']['file_name']
                    );

                    $this->biografi_model->edit($data);
                    $this->session->set_flashdata('sukses', 'Data telah diedit');
                    redirect(base_url('admin/biografi'), 'refresh');
                }
            } else {
                $inp = $this->input;

                $data = array(
                    'id'             => $id,
                    'jabatan_id'        => $inp->post('jabatan_id'),
                    'nama'        => $inp->post('nama'),
                    'deskripsi'            => $inp->post('deskripsi')
                );

                $this->biografi_model->edit($data);
                $this->session->set_flashdata('sukses', 'Data telah diedit');
                redirect(base_url('admin/biografi'), 'refresh');
            }
        }
        // End masuk database
        $data = array(
            'title'              => 'Edit Biografi',
            'biografi'        => $biografi,
            'jabatan' => $jabatan,
            'isi'                => 'admin/biografi/edit'
        );
        $this->load->view('admin/layout/wrapper', $data, FALSE);
    }

    // Delete
    public function delete($id)
    {
        // Tambahkan proteksi halaman
        $url_pengalihan = str_replace('index.php/', '', current_url());
        $pengalihan     = $this->session->set_userdata('pengalihan', $url_pengalihan);
        // Ambil check login dari simple_login
        $this->simple_login->check_login($pengalihan);

        $biografi = $this->biografi_model->detail($id);
        // Proses hapus gambar
        if ($biografi->profil_picture != "") {
            unlink('./assets/upload/image/' . $biografi->profil_picture);
            unlink('./assets/upload/image/thumbs/' . $biografi->profil_picture);
        }

        $data = array('id' => $id);

        $this->biografi_model->delete($data);
        $this->session->set_flashdata('sukses', 'Data telah dihapus');
        redirect(base_url('admin/biografi'), 'refresh');
    }
}
