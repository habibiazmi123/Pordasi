<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Asosiasi extends CI_Controller
{

    // Database
    public function __construct()
    {
        parent::__construct();
        $this->load->model('asosiasi_model');
    }

    public function index()
    {
        $site             = $this->konfigurasi_model->listing();
        $asosiasi     = $this->asosiasi_model->listing();


        $data = array(
            'title'        => 'Asosiasi Provinsi ' . $site->namaweb . ' | ' . $site->tagline,
            'deskripsi'    => 'Asosiasi Provinsi ' . $site->namaweb . ' | ' . $site->tagline . ' ' . $site->tentang,
            'keywords'    => 'Asosiasi Provinsi ' . $site->namaweb . ' | ' . $site->tagline . ' ' . $site->keywords,
            'site'        => $site,
            'asosiasi'    => $asosiasi,
            'isi'        => 'asosiasi/list'
        );

        $this->load->view('layout/wrapper', $data, FALSE);
    }

    // Read asosiasi detail
    public function read($id)
    {
        $site         = $this->konfigurasi_model->listing();
        $asosiasi     = $this->asosiasi_model->read($id);

        if (count(array($asosiasi)) < 1) {
            redirect(base_url('oops'), 'refresh');
        }

        $data = array(
            'title'        => 'Asosiasi ' . $asosiasi->provinsi,
            'deskripsi'    => 'Asosiasi ' . $asosiasi->provinsi,
            'keywords'    => 'Asosiasi ' . $asosiasi->provinsi,
            'site'        => $site,
            'asosiasi'    => $asosiasi,
            'isi'        => 'asosiasi/read'
        );
        $this->load->view('layout/wrapper', $data, FALSE);
    }
}
