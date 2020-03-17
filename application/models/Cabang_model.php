<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Cabang_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function listing()
    {
        $this->db->select('*');
        $this->db->from('cabang');
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
        $this->db->from('cabang');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function parent()
    {
        $this->db->select('*');
        $this->db->from('cabang');
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();
        return $query->result();
    }

    public function findParent($id)
    {
        $this->db->select('*');
        $this->db->from('cabang');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function tambah($data)
    {
        $this->db->insert('cabang', $data);
    }

    // Edit
    public function edit($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->update('cabang', $data);
    }

    public function delete($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->delete('cabang', $data);
    }
}
