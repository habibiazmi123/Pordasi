<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Hasil_pertandingan extends CI_Controller
{

    // Load database
    public function __construct()
    {
        parent::__construct();
        $this->load->model('hasil_pertandingan_model');
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
        $hasil_pertandingan = $this->hasil_pertandingan_model->listing();

        $data = array(
            'title'         => 'Hasil Pertandingan',
            'hasil_pertandingan'        => $hasil_pertandingan,
            'isi'           => 'admin/hasil_pertandingan/list'
        );
        $this->load->view('admin/layout/wrapper', $data, FALSE);
    }

    public function proses()
    {
        // PROSES HAPUS MULTIPLE
        if (isset($_POST['hapus'])) {
            $inp                 = $this->input;
            $id_hasil_pertandingannya        = $inp->post('id');

            for ($i = 0; $i < sizeof($id_hasil_pertandingannya); $i++) {
                $data = array('id'    => $id_hasil_pertandingannya[$i]);
                $this->hasil_pertandingan_model->delete($data);
            }

            $this->session->set_flashdata('sukses', 'Data telah dihapus');
            redirect(base_url('admin/hasil_pertandingan'), 'refresh');
            // PROSES SETTING DRAFT
        }
    }

    // Tambah
    public function tambah()
    {
        $cabang = $this->cabang_model->listing();
        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'no_urut',
            'Nomor Urut',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'nama_cabang',
            'Nama Cabang',
            'required',
            array(
                'required'        => '%s harus diisi',
            )
        );

        $validasi->set_rules(
            'nama_atlit',
            'Nama Atlit',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'nama_kuda',
            'Nama Kuda',
            'required',
            array('required'        => '%s harus diisi')
        );

        if ($validasi->run() === FALSE) {
            // End validasi

            $data = array(
                'title'        => 'Tambah Hasil Pertandingan',
                'cabang' => $cabang,
                'isi'        => 'admin/hasil_pertandingan/tambah'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'no_urut'        => $inp->post('no_urut'),
                'cabang_id'        => $inp->post('nama_cabang'),
                'nama_atlit'            => $inp->post('nama_atlit'),
                'nama_kuda'        => $inp->post('nama_kuda')
            );

            $this->hasil_pertandingan_model->tambah($data);
            $this->session->set_flashdata('sukses', 'Data telah ditambahkan');
            redirect(base_url('admin/hasil_pertandingan'), 'refresh');
        }
        // End masuk database
    }

    // Edit
    public function edit($id)
    {
        $cabang = $this->cabang_model->listing();
        $hasil_pertandingan = $this->hasil_pertandingan_model->detail($id);

        // Validasi
        $validasi     = $this->form_validation;

        $validasi->set_rules(
            'no_urut',
            'Nomor Urut',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'nama_cabang',
            'Nama Cabang',
            'required',
            array(
                'required'        => '%s harus diisi',
            )
        );

        $validasi->set_rules(
            'nama_atlit',
            'Nama Atlit',
            'required',
            array('required'        => '%s harus diisi')
        );

        $validasi->set_rules(
            'nama_kuda',
            'Nama Kuda',
            'required',
            array('required'        => '%s harus diisi')
        );

        if ($validasi->run() === FALSE) {
            // End validasi

            $data = array(
                'title'        => 'Ubah Hasil Pertandingan',
                'hasil_pertandingan'        => $hasil_pertandingan,
                'cabang' => $cabang,
                'isi'        => 'admin/hasil_pertandingan/edit'
            );
            $this->load->view('admin/layout/wrapper', $data, FALSE);
            // Masuk ke database
        } else {
            $inp = $this->input;

            $data = array(
                'id'             => $id,
                'no_urut'        => $inp->post('no_urut'),
                'cabang_id'    => $inp->post('nama_cabang'),
                'nama_atlit'     => $inp->post('nama_atlit'),
                'nama_kuda'      => $inp->post('nama_kuda')
            );

            $this->hasil_pertandingan_model->edit($data);
            $this->session->set_flashdata('sukses', 'Data telah diedit');
            redirect(base_url('admin/hasil_pertandingan'), 'refresh');
        }
        // End masuk database
        $data = array(
            'title'              => 'Edit Galeri',
            'hasil_pertandingan'        => $hasil_pertandingan,
            'cabang' => $cabang,
            'isi'                => 'admin/hasil_pertandingan/edit'
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

        $this->hasil_pertandingan_model->delete($data);
        $this->session->set_flashdata('sukses', 'Data telah dihapus');
        redirect(base_url('admin/hasil_pertandingan'), 'refresh');
    }
}
