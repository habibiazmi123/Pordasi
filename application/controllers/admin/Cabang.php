<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cabang extends CI_Controller
{

    // Load database
    public function __construct()
    {
        parent::__construct();
        $this->load->model('cabang_model');
        $this->log_user->add_log();
        // Tambahkan proteksi halaman
        $url_pengalihan = str_replace('index.php/', '', current_url());
        $pengalihan     = $this->session->set_userdata('pengalihan', $url_pengalihan);
        // Ambil check login dari simple_login
        $this->simple_login->check_login($pengalihan);
    }

    public function index()
    {
        $cabang = $this->cabang_model->listing();

        $data = array(
            'title'         => 'cabang',
            'cabang'        => $cabang,
            'isi'           => 'admin/cabang/list'
        );
        $this->load->view('admin/layout/wrapper', $data, FALSE);
    }

    public function proses()
    {
        // PROSES HAPUS MULTIPLE
        if (isset($_POST['hapus'])) {
            $inp                 = $this->input;
            $id_cabangnya        = $inp->post('id');

            for ($i = 0; $i < sizeof($id_cabangnya); $i++) {
                $data = array('id'    => $id_cabangnya[$i]);
                $this->cabang_model->delete($data);
            }

            $this->session->set_flashdata('sukses', 'Data telah dihapus');
            redirect(base_url('admin/cabang'), 'refresh');
            // PROSES SETTING DRAFT
        }
    }

    // Tambah
    public function tambah()
    {
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
                'title'        => 'Tambah Cabang',
                'isi'        => 'admin/cabang/tambah'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'nama'        => $inp->post('nama')
            );

            $this->cabang_model->tambah($data);
            $this->session->set_flashdata('sukses', 'Data telah ditambahkan');
            redirect(base_url('admin/cabang'), 'refresh');
        }
        // End masuk database
    }

    // Edit
    public function edit($id)
    {
        $cabang = $this->cabang_model->read($id);

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
                'title'        => 'Ubah cabang',
                'cabang'        => $cabang,
                'isi'        => 'admin/cabang/edit'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'id'             => $id,
                'nama'        => $inp->post('nama')
            );

            $this->cabang_model->edit($data);
            $this->session->set_flashdata('sukses', 'Data telah diedit');
            redirect(base_url('admin/cabang'), 'refresh');
        }
        // End masuk database
        $data = array(
            'title'              => 'Edit cabang',
            'cabang'        => $cabang,
            'isi'                => 'admin/cabang/edit'
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

        $this->cabang_model->delete($data);
        $this->session->set_flashdata('sukses', 'Data telah dihapus');
        redirect(base_url('admin/cabang'), 'refresh');
    }
}
