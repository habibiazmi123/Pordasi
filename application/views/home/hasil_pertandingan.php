<!-- Start Upcoming Events Section -->


<section class="bg-upcoming-events">
    <div class="container">
        <div class="row">
            <div class="upcoming-events">
                <div class="section-header">
                    <h2>Hasil Pertandingan</h2>
                    <span>Lomba Horse Jumping</span>
                </div>

                <div class="hasil-pertandingan__slick">
                    <?php foreach ($hasil_pertandingan as $value) { ?>
                        <div class="item-pertandingan__box">
                            <div class="our-services-items">
                                <i class=" fa-5x" style="color:#337ab7; margin-bottom: 20px;"></i>
                                <div class="our-services-content">
                                    <h4>Juara <?php echo $value->no_urut ?></h4>
                                    <div class="nama-perserta__text">
                                    <?php echo $value->nama_atlit ?>
                                    </div>
                                    <div class="name-kuda__text">
                                    <?php echo $value->nama_kuda ?>
                                    </div>
                                </div>
                                <!-- .our-services-content -->
                            </div>
                            <!-- .our-services-items -->
                        </div>
                    <?php } ?>
                </div>
            </div>
            <!-- .upcoming-events -->
        </div>
        <!-- .row -->
    </div>
    <!-- .container -->
</section>


<!-- End Upcoming Events Section -->