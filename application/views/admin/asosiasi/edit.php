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
echo form_open_multipart(base_url('admin/asosiasi/edit/' . $asosiasi->id));
?>
<div class="row">
    <div class="col-md-2">
        <div class="form-group form-group-lg">
            <label>Provinsi</label>
            <select name="provinsi_id" class="form-control">
                <?php foreach ($provinsi as $item) { ?>
                    <option value="<?php echo $item->id; ?>" <?php echo ($item->id == $asosiasi->provinsi_id) ? 'selected' : '' ?>><?php echo $item->nama; ?></option> <?php } ?> </select> </div>
    </div>
    <div class="col-md-4">
        <div class="form-group form-group-lg">
            <label>Alamat</label>
            <input type="text" name="alamat" class="form-control" placeholder="Nama Cabang" value="<?php echo $asosiasi->alamat ?>">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-group-lg">
            <label>Kontak</label>
            <input type="text" name="kontak" class="form-control" placeholder="Nama Atlit" value="<?php echo $asosiasi->kontak ?>">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-group-lg">
            <label>Deskripsi</label>
            <textarea name="deskripsi" id="isi" class="form-control" cols="30" rows="40"><?php echo $asosiasi->deskripsi ?></textarea>
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