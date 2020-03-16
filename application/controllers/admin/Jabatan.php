<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Jabatan extends CI_Controller
{

    // Load database
    public function __construct()
    {
        parent::__construct();
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
        $jabatan = $this->jabatan_model->listing();

        $jabatan = json_decode(json_encode($jabatan), true);

        foreach ($jabatan as $key => $value) {
            if (!empty($value['parent_id'])) {
                $parent = $this->jabatan_model->findParent($value['parent_id']);
                $parent = json_decode(json_encode($parent), true);

                $jabatan[$key]["parent"] = $parent['nama'];
            } else {
                $jabatan[$key]["parent"] = null;
            }
        }

        $data = array(
            'title'         => 'Jabatan',
            'jabatan'        => $jabatan,
            'isi'           => 'admin/jabatan/list'
        );
        $this->load->view('admin/layout/wrapper', $data, FALSE);
    }

    public function proses()
    {
        // PROSES HAPUS MULTIPLE
        if (isset($_POST['hapus'])) {
            $inp                 = $this->input;
            $id_jabatannya        = $inp->post('id');

            for ($i = 0; $i < sizeof($id_jabatannya); $i++) {
                $data = array('id'    => $id_jabatannya[$i]);
                $this->jabatan_model->delete($data);
            }

            $this->session->set_flashdata('sukses', 'Data telah dihapus');
            redirect(base_url('admin/jabatan'), 'refresh');
            // PROSES SETTING DRAFT
        }
    }

    // Tambah
    public function tambah()
    {
        $parents = $this->jabatan_model->parent();

        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'nama',
            'Nama',
            'required',
            array('required'        => '%s harus diisi')
        );

        if ($validasi->run() === FALSE) {
            // End validasi

            $data = array(
                'title'        => 'Tambah Jabatan',
                'parents' => $parents,
                'isi'        => 'admin/jabatan/tambah'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'nama'        => $inp->post('nama'),
                'parent_id'        => $inp->post('parent_id')
            );

            $this->jabatan_model->tambah($data);
            $this->session->set_flashdata('sukses', 'Data telah ditambahkan');
            redirect(base_url('admin/jabatan'), 'refresh');
        }
        // End masuk database
    }

    // Edit
    public function edit($id)
    {
        $jabatan = $this->jabatan_model->read($id);
        $parents = $this->jabatan_model->parent();

        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'nama',
            'Nama',
            'required',
            array('required'        => '%s harus diisi')
        );

        if ($validasi->run() === FALSE) {
            // End validasi

            $data = array(
                'title'        => 'Ubah Jabatan',
                'jabatan'        => $jabatan,
                'parents' => $parents,
                'isi'        => 'admin/jabatan/edit'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'id'             => $id,
                'nama'        => $inp->post('nama'),
                'parent_id'        => $inp->post('parent_id')
            );

            $this->jabatan_model->edit($data);
            $this->session->set_flashdata('sukses', 'Data telah diedit');
            redirect(base_url('admin/jabatan'), 'refresh');
        }
        // End masuk database
        $data = array(
            'title'              => 'Edit Jabatan',
            'jabatan'        => $jabatan,
            'parents' => $parents,
            'isi'                => 'admin/jabatan/edit'
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

        $this->jabatan_model->delete($data);
        $this->session->set_flashdata('sukses', 'Data telah dihapus');
        redirect(base_url('admin/jabatan'), 'refresh');
    }
}
