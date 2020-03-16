<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Asosiasi_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function listing()
    {
        $this->db->select('asosiasi.*, provinsi.nama as provinsi');
        $this->db->from('asosiasi');
        $this->db->join('provinsi', 'provinsi.id = asosiasi.provinsi_id', 'LEFT');
        // End join
        $this->db->order_by('provinsi.nama', 'asc');
        $query = $this->db->get();
        if ($query) {
            return $query->result();
        } else {
            return false;
        }
    }

    public function read($id)
    {
        $this->db->select('asosiasi.*, provinsi.nama as provinsi');
        $this->db->from('asosiasi');
        $this->db->join('provinsi', 'provinsi.id = asosiasi.provinsi_id', 'LEFT');
        $this->db->where('asosiasi.id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    // Detail data
    public function detail($id)
    {
        $this->db->select('asosiasi.*, provinsi.nama as provinsi');
        $this->db->from('asosiasi');
        $this->db->join('provinsi', 'provinsi.id = asosiasi.provinsi_id', 'LEFT');
        $this->db->where('asosiasi.id', $id);
        $this->db->order_by('id', 'DESC');
        $query = $this->db->get();
        return $query->row();
    }

    public function tambah($data)
    {
        $this->db->insert('asosiasi', $data);
    }

    // Edit
    public function edit($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->update('asosiasi', $data);
    }

    public function delete($data)
    {
        $this->db->where('id', $data['id']);
        $this->db->delete('asosiasi', $data);
    }
}
