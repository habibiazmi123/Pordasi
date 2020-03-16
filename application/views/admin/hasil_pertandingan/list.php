<?php
echo form_open(base_url('admin/hasil_pertandingan/proses'));
?>
<p class="btn-group">
    <a href="<?php echo base_url('admin/hasil_pertandingan/tambah') ?>" class="btn btn-success btn-lg">
        <i class="fa fa-plus"></i> Tambah hasil_pertandingan</a>

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
                <th>Peringkat</th>
                <th>Cabang</th>
                <th>Nama Atlit</th>
                <th>Nama Kuda</th>
                <th width="15%">Action</th>
            </tr>
        </thead>
        <tbody>

            <?php $i = 1;
            foreach ($hasil_pertandingan as $result) { ?>

                <tr class="odd gradeX">
                    <td>
                        <div class="mailbox-star text-center">
                            <div class="text-center">
                                <input type="checkbox" class="icheckbox_flat-blue " name="id[]" value="<?php echo $result->id ?>">
                                <span class="checkmark"></span>
                            </div>
                    </td>
                    <td>
                        <?php echo $result->no_urut ?>
                    </td>
                    <td><?php echo $result->nama_atlit ?></td>
                    <td><?php echo $result->nama_cabang ?></td>
                    <td><?php echo $result->nama_kuda ?></td>
                    <td>
                        <div class="btn-group">
                            <!-- <a href="<?php echo base_url('hasil_pertandingan/read/' . $result->id) ?>" class="btn btn-success btn-xs" target="_blank"><i class="fa fa-eye"></i></a> -->

                            <a href="<?php echo base_url('admin/hasil_pertandingan/edit/' . $result->id) ?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i></a>

                            <a href="<?php echo base_url('admin/hasil_pertandingan/delete/' . $result->id) ?>" class="btn btn-danger btn-xs " onclick="confirmation(event)"><i class="fa fa-trash-o"></i></a>
                        </div>
                    </td>
                </tr>

            <?php $i++;
            } ?>

        </tbody>
    </table>