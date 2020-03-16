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
echo form_open_multipart(base_url('admin/jabatan/edit/' . $jabatan->id));
?>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-group-lg">
            <label>Nama Jabatan</label>
            <input type="text" name="nama" class="form-control" placeholder="Nama Jabatan" value="<?php echo $jabatan->nama ?>">
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="form-group form-group-lg">
            <label>Parent Id</label>
            <select name="parent_id" class="form-control">
                <option value="">-Pilih Parent-</option>
                <?php foreach ($parents as $parent) { ?>
                    <option value="<?php echo $parent->id; ?>" <?php echo ($parent->id == $jabatan->parent_id) ? 'selected' : '' ?>><?php echo $parent->nama; ?></option>
                <?php } ?>
            </select>
        </div>
    </div>
</div>
<div class="row">
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