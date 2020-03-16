<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Biografi_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function listing()
    {
        $this->db->select('biografi.*, jabatan.nama as jabatan');
        $this->db->from('biografi');
        $this->db->join('jabatan', 'jabatan.id = biografi.jabatan_id', 'LEFT');
        $query = $this->db->get();
        if ($query) {
            return $query->result();
        } else {
            return false;
        }
    }

    public function read($id)
    {
        $this->db->select('biografi.*, jabatan.nama as jabatan');
        $this->db->from('biografi');
        $this->db->join('jabatan', 'jabatan.id = biografi.jabatan_id', 'LEFT');
        $this->db->where('biografi.id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    // Detail data
    public function detail($id)
    {
        $this->db->select('*');
        $this->db->from('biografi');
        $this->db->where('id', $id);
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();
        return $query->row();
    }

    public function tambah($data)
    {
        $this->db->insert('biografi', $data);
    }

    // Edit
    public function edit($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->update('biografi', $data);
    }

    public function delete($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->delete('biografi', $data);
    }
}
