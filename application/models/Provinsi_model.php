<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Provinsi_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function listing()
    {
        $this->db->select('*');
        $this->db->from('provinsi');
        // End join
        $this->db->order_by('nama', 'asc');
        $query = $this->db->get();
        if ($query) {
            return $query->result();
        } else {
            return false;
        }
    }
}
