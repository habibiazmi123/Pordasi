<?php
echo form_open(base_url('admin/biografi/proses'));
?>
<p class="btn-group">
    <a href="<?php echo base_url('admin/biografi/tambah') ?>" class="btn btn-success btn-lg">
        <i class="fa fa-plus"></i> Tambah Biografi</a>

    <button class="btn btn-danger" type="submit" name="hapus" onClick="check();">
        <i class="fa fa-trash-o"></i> Hapus
    </button>

</p>


<div class="table-responsive mailbox-messages">
    <table id="example1" class="display table table-bordered table-hover" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>
                    <div class="mailbox-controls">
                        <!-- Check all button -->
                        <button type="button" class="btn btn-default btn-xs checkbox-toggle"><i class="fa fa-square-o"></i>
                        </button>
                    </div>
                </th>
                <th></th>
                <th>Nama</th>
                <th>Jabatan</th>
                <th width="15%">Action</th>
            </tr>
        </thead>
        <tbody>

            <?php $i = 1;
            foreach ($biografi as $result) { ?>

                <tr class="odd gradeX">
                    <td>
                        <div class="mailbox-star text-center">
                            <div class="text-center">
                                <input type="checkbox" class="icheckbox_flat-blue " name="id[]" value="<?php echo $result->id ?>">
                                <span class="checkmark"></span>
                            </div>
                    </td>
                    <td>
                        <img src="<?php echo base_url('assets/upload/image/' . $result->profil_picture) ?>" alt="" style="width: 60px">
                    </td>
                    <td><?php echo $result->nama ?></td>
                    <td><?php echo $result->jabatan ?></td>
                    <td>
                        <div class="btn-group">
                            <!-- <a href="<?php echo base_url('biografi/read/' . $result->id) ?>" class="btn btn-success btn-xs" target="_blank"><i class="fa fa-eye"></i></a> -->

                            <a href="<?php echo base_url('admin/biografi/edit/' . $result->id) ?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i></a>

                            <a href="<?php echo base_url('admin/biografi/delete/' . $result->id) ?>" class="btn btn-danger btn-xs " onclick="confirmation(event)"><i class="fa fa-trash-o"></i></a>
                        </div>
                    </td>
                </tr>

            <?php $i++;
            } ?>

        </tbody>
    </table>