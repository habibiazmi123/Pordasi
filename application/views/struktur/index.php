<section class="bg-single-events">
    <div class="container">
        <div class="row">
            <div class="single-events">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <div class="single-event-item">
                            <div class="single-event-img" style="display: flex;justify-content:center;margin-bottom: 6rem">
                                <div style="width: 200px">
                                    <img src="<?php echo $this->website->logo() ?>" alt="single-event-img-1" class="img-responsive">
                                </div>
                            </div>
                            <!-- .single-event-img -->
                            <div class="single-event-content">
                                <h3>Stukrur Organisasi</h3>
                                <hr>
                                <?php foreach ($list_struktur as $item) { ?>
                                    <div>
                                        <b><?php echo $item['nama'] ?></b>

                                        <?php if ($item['childPersons']) { ?>
                                            <?php foreach ($item['childPersons'] as $v) { ?>
                                                <div style="margin-left: 10px;"><a href="<?php echo base_url('struktur/read/' . $v['id']) ?>" style="color: #0099cc"><?php echo $v['nama'] ?></a></div>
                                            <?php } ?>
                                        <?php } ?>
                                    </div>
                                <?php } ?>
                            </div>
                            <!-- .single-event-content -->
                        </div>
                        <!-- .single-event-item -->
                    </div>
                    <!-- .col-md-12 -->
                </div>
                <!-- .row -->
            </div>
            <!-- .single-events -->
        </div>
        <!-- .row -->
    </div>
    <!-- .container -->
</section>