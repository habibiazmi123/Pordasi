<?php
// Validasi error
echo validation_errors('<div class="alert alert-warning">', '</div>');

// Error upload
if (isset($error)) {
    echo '<div class="alert alert-warning">';
    echo $error;
    echo '</div>';
}

// Form open
echo form_open_multipart(base_url('admin/hasil_pertandingan/tambah'));
?>
<div class="row">
    <div class="col-md-2">
        <div class="form-group form-group-lg">
            <label>Peringkat</label>
            <select name="no_urut" class="form-control">
                <?php for ($i = 1; $i <= 3; $i++) { ?>
                    <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                <?php } ?>
            </select>
        </div>
    </div>

    <div class="col-md-4">
        <div class="form-group form-group-lg">
            <label>Cabang</label>
            <select name="nama_cabang" class="form-control">
                <?php foreach ($cabang as $item) { ?>
                    <option value="<?php echo $item->id; ?>"><?php echo $item->nama; ?></option>
                <?php } ?>
            </select>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-group-lg">
            <label>Nama Atlit</label>
            <input type="text" name="nama_atlit" class="form-control" placeholder="Nama Atlit" value="<?php echo set_value('nama_atlit') ?>">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-group-lg">
            <label>Nama Kuda</label>
            <input type="text" name="nama_kuda" class="form-control" placeholder="Nama Kuda" value="<?php echo set_value('nama_kuda') ?>">
        </div>
    </div>

    <div class="col-md-12">

        <div class="form-group">
            <input type="submit" name="submit" class="btn btn-success btn-lg" value="Simpan Data">
            <input type="reset" name="reset" class="btn btn-default btn-lg" value="Reset">
        </div>

    </div>
</div>
<?php
// Form close
echo form_close();
?>