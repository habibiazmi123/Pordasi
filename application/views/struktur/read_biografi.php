<!-- Start Contact us Section -->
<section class="bg-contact-us">
    <div class="container">

        <div class="single-event-img" style="display: flex;justify-content:center;margin-bottom: 2rem">
            <div style="width: 200px">
                <img src="<?php echo $this->website->logo() ?>" alt="single-event-img-1" class="img-responsive">
            </div>
        </div>
        <div class="row">
            <div class="contact-us">
                <h3 class="contact-title"><?php echo $biografi->nama ?> <small>(<?php echo $biografi->jabatan ?>)</small></h3>
                <hr>
                <div class="content">
                    <div class="row">
                        <div class="col-md-2">
                            <div style="padding: 1rem">
                                <img src="<?php echo base_url('assets/upload/image/thumbs/' . $biografi->profil_picture) ?>" alt="">
                            </div>
                        </div>
                        <div class="col-md-10">
                            <?php echo $biografi->deskripsi ?>
                        </div>
                    </div>
                </div>
                <!-- .row -->
            </div>
            <!-- .contact-us -->
        </div>
        <!-- .row -->
    </div>
    <!-- .container -->
</section>
<!-- End Contact us Section -->