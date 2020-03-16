<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Hasil_pertandingan_model extends CI_Model
{

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function listing()
	{
		$this->db->select('id, no_urut, nama_cabang, nama_atlit, nama_kuda');
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

	// Detail data
	public function detail($id)
	{
		$this->db->select('*');
		$this->db->from('hasil_pertandingan');
		$this->db->where('id', $id);
		$this->db->order_by('id', 'DESC');
		$query = $this->db->get();
		return $query->row();
	}

	public function tambah($data)
	{
		$this->db->insert('hasil_pertandingan', $data);
	}

	// Edit
	public function edit($data)
	{
		$this->db->where('id', $data['id']);
		$this->db->update('hasil_pertandingan', $data);
	}

	public function delete($data)
	{
		$this->db->where('id', $data['id']);
		$this->db->delete('hasil_pertandingan', $data);
	}
}
