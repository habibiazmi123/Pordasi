<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Struktur extends CI_Controller
{

    // Database
    public function __construct()
    {
        parent::__construct();
        $this->load->model('struktur_model');
        $this->load->model('biografi_model');
    }

    public function index()
    {
        $site             = $this->konfigurasi_model->listing();
        $list_struktur    = $this->struktur_model->list_struktur();

        $list_struktur = json_decode(json_encode($list_struktur), true);

        foreach ($list_struktur as $key => $value) {
            $parent = $this->struktur_model->childPersons($value['id']);
            $parent = json_decode(json_encode($parent), true);

            $list_struktur[$key]["childPersons"] = $parent;
        }

        $data = array(
            'title'        => 'Struktur Organisasi ' . $site->namaweb . ' | ' . $site->tagline,
            'deskripsi'    => 'Struktur Organisasi ' . $site->namaweb . ' | ' . $site->tagline . ' ' . $site->tentang,
            'keywords'     => 'Struktur Organisasi ' . $site->namaweb . ' | ' . $site->tagline . ' ' . $site->keywords,
            'site'         => $site,
            'list_struktur' => $list_struktur,
            'isi'          => 'struktur/index'
        );

        $this->load->view('layout/wrapper', $data, FALSE);
    }

    // Read biografi detail
    public function read($id)
    {
        $site         = $this->konfigurasi_model->listing();
        $biografi     = $this->biografi_model->read($id);

        if (count(array($biografi)) < 1) {
            redirect(base_url('oops'), 'refresh');
        }

        $data = array(
            'title'        => 'Biografi | ' . $biografi->nama,
            'deskripsi'    => 'Biografi | ' . $biografi->nama,
            'keywords'    => 'Biografi | ' . $biografi->nama,
            'site'        => $site,
            'biografi'    => $biografi,
            'isi'        => 'struktur/read_biografi'
        );
        $this->load->view('layout/wrapper', $data, FALSE);
    }
}
