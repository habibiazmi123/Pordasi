<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Asosiasi extends CI_Controller
{

    // Load database
    public function __construct()
    {
        parent::__construct();
        $this->load->model('asosiasi_model');
        $this->load->model('provinsi_model');
        $this->log_user->add_log();
        // Tambahkan proteksi halaman
        $url_pengalihan = str_replace('index.php/', '', current_url());
        $pengalihan     = $this->session->set_userdata('pengalihan', $url_pengalihan);
        // Ambil check login dari simple_login
        $this->simple_login->check_login($pengalihan);
    }

    public function index()
    {
        $asosiasi = $this->asosiasi_model->listing();

        $data = array(
            'title'         => 'Asosiasi',
            'asosiasi'        => $asosiasi,
            'isi'           => 'admin/asosiasi/list'
        );
        $this->load->view('admin/layout/wrapper', $data, FALSE);
    }

    public function proses()
    {
        // PROSES HAPUS MULTIPLE
        if (isset($_POST['hapus'])) {
            $inp                 = $this->input;
            $id_asosiasinya        = $inp->post('id');

            for ($i = 0; $i < sizeof($id_asosiasinya); $i++) {
                $data = array('id'    => $id_asosiasinya[$i]);
                $this->asosiasi_model->delete($data);
            }

            $this->session->set_flashdata('sukses', 'Data telah dihapus');
            redirect(base_url('admin/asosiasi'), 'refresh');
            // PROSES SETTING DRAFT
        }
    }

    // Tambah
    public function tambah()
    {
        $provinsi = $this->provinsi_model->listing();

        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'provinsi_id',
            'Provinsi',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'alamat',
            'Alamat',
            'required',
            array(
                'required'        => '%s harus diisi',
            )
        );

        $validasi->set_rules(
            'kontak',
            'Kontak',
            'required',
            array('required'        => '%s harus diisi')
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
                'title'        => 'Tambah Asosiasi',
                'provinsi' => $provinsi,
                'isi'        => 'admin/asosiasi/tambah'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'provinsi_id'        => $inp->post('provinsi_id'),
                'alamat'        => $inp->post('alamat'),
                'kontak'            => $inp->post('kontak'),
                'deskripsi'        => $inp->post('deskripsi')
            );

            $this->asosiasi_model->tambah($data);
            $this->session->set_flashdata('sukses', 'Data telah ditambahkan');
            redirect(base_url('admin/asosiasi'), 'refresh');
        }
        // End masuk database
    }

    // Edit
    public function edit($id)
    {
        $asosiasi = $this->asosiasi_model->detail($id);
        $provinsi = $this->provinsi_model->listing();

        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'provinsi_id',
            'Provinsi',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'alamat',
            'Alamat',
            'required',
            array(
                'required'        => '%s harus diisi',
            )
        );

        $validasi->set_rules(
            'kontak',
            'Kontak',
            'required',
            array('required'        => '%s harus diisi')
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
                'title'        => 'Ubah Asosiasis',
                'asosiasi'        => $asosiasi,
                'provinsi' => $provinsi,
                'isi'        => 'admin/asosiasi/edit'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'id'             => $id,
                'provinsi_id'        => $inp->post('provinsi_id'),
                'alamat'    => $inp->post('alamat'),
                'kontak'     => $inp->post('kontak'),
                'deskripsi'      => $inp->post('deskripsi')
            );

            $this->asosiasi_model->edit($data);
            $this->session->set_flashdata('sukses', 'Data telah diedit');
            redirect(base_url('admin/asosiasi'), 'refresh');
        }
        // End masuk database
        $data = array(
            'title'              => 'Edit Asosiasi',
            'asosiasi'        => $asosiasi,
            'provinsi' => $provinsi,
            'isi'                => 'admin/asosiasi/edit'
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

        $data = array('id' => $id);

        $this->asosiasi_model->delete($data);
        $this->session->set_flashdata('sukses', 'Data telah dihapus');
        redirect(base_url('admin/asosiasi'), 'refresh');
    }
}
