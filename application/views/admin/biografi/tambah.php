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
echo form_open_multipart(base_url('admin/biografi/tambah'));
?>
<div class="row">
    <div class="col-md-2">
        <div class="form-group form-group-lg">
            <label>Jabatan</label>
            <select name="jabatan_id" class="form-control">
                <?php foreach ($jabatan as $item) { ?>
                    <option value="<?php echo $item->id; ?>"><?php echo $item->nama; ?></option> <?php } ?> </select> </div>
    </div>
    <div class="col-md-4">
        <div class="form-group form-group-lg">
            <label>Nama</label>
            <input type="text" name="nama" class="form-control" placeholder="Nama" value="<?php echo set_value('nama') ?>">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-group-lg">
            <label>Biografi</label>
            <textarea name="deskripsi" id="isi" class="form-control" cols="30" rows="40"><?php echo set_value('deskripsi') ?></textarea>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <div class="form-group">
            <label>Upload gambar</label>
            <input type="file" name="gambar" class="form-control" required="required" placeholder="Upload gambar">
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