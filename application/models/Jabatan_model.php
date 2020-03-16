<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Jabatan_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function listing()
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

    public function read($id)
    {
        $this->db->select('*');
        $this->db->from('jabatan');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function parent()
    {
        $this->db->select('*');
        $this->db->from('jabatan');
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function findParent($id)
    {
        $this->db->select('*');
        $this->db->from('jabatan');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function tambah($data)
    {
        $this->db->insert('jabatan', $data);
    }

    // Edit
    public function edit($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->update('jabatan', $data);
    }

    public function delete($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->delete('jabatan', $data);
    }
}
