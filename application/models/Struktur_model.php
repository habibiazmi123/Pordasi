<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Struktur_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function listing()
    {
        $this->db->select('*');
        $this->db->from('hasil_pertandingan');
        // End join
        $this->db->order_by('no_urut', 'asc');
        $query = $this->db->get();
        if ($query) {
            return $query->result();
        } else {
            return false;
        }
    }

    public function list_struktur()
    {
        $this->db->select('*');
        $this->db->from('jabatan');
        // End join
        $this->db->order_by('id', 'asc');
        $query = $this->db->get();
        if ($query) {
            return $query->result();
        } else {
            return false;
        }
    }

    public function childPersons($id)
    {
        $this->db->select('*');
        $this->db->from('biografi');
        $this->db->where('jabatan_id', $id);
        $query = $this->db->get();
        if ($query) {
            return $query->result();
        } else {
            return false;
        }
    }
}
