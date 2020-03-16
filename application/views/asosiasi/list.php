<!-- Start Contact us Section -->
<section class="bg-contact-us">
    <div class="container">
        <div class="row">
            <div class="contact-us">
                <h3 class="contact-title">Asosiasi Provinsi</h3>
                <div class="row">
                    <?php foreach ($asosiasi as $value) { ?>
                        <div class="col-md-12">
                            <div class="card-content__item">
                                <div class="content__item">
                                    <div class="row">
                                        <div class="col-md-4"><a href="<?php echo base_url('asosiasi/read/' . $value->id); ?>"><?php echo $value->provinsi ?></a></div>
                                        <div class="col-md-4"><?php echo $value->alamat ?></div>
                                        <div class="col-md-4 text-center"><?php echo $value->kontak ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <!-- .col-md-4 -->
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

<style>
    .card-content__item {
        border: 1px solid #f0f0f0;
        padding: 1.5rem 2rem;
        margin-bottom: 10px;
    }

    .content__item a {
        color: #0099cc;
    }
</style>