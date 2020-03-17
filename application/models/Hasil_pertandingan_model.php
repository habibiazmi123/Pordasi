<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Hasil_pertandingan_model extends CI_Model
{

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function listPertandingan()
	{
		$this->db->select('hasil_pertandingan.id, hasil_pertandingan.no_urut, hasil_pertandingan.id, cabang.nama as nama_cabang, hasil_pertandingan.nama_atlit, hasil_pertandingan.nama_kuda');
		$this->db->from('hasil_pertandingan');
		$this->db->join('cabang', 'cabang.id = hasil_pertandingan.cabang_id', 'LEFT');
		// End join
		$this->db->order_by('hasil_pertandingan.id', 'asc');
		$query = $this->db->get();
		if ($query) {
			return $query->result();
		} else {
			return false;
		}
	}

	public function listing()
	{
		$this->db->select('hasil_pertandingan.id, hasil_pertandingan.no_urut, cabang.nama as nama_cabang, hasil_pertandingan.nama_atlit, hasil_pertandingan.nama_kuda');
		$this->db->from('hasil_pertandingan');
		$this->db->join('cabang', 'cabang.id = hasil_pertandingan.cabang_id', 'LEFT');
		// End join
		$this->db->order_by('id', 'asc');
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
		$this->db->select('hasil_pertandingan.id, hasil_pertandingan.no_urut, hasil_pertandingan.cabang_id, cabang.nama as nama_cabang, hasil_pertandingan.nama_atlit, hasil_pertandingan.nama_kuda');
		$this->db->from('hasil_pertandingan');
		$this->db->join('cabang', 'cabang.id = hasil_pertandingan.cabang_id', 'LEFT');
		$this->db->where('hasil_pertandingan.id', $id);
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
