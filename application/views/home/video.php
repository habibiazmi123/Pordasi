<section class="bg-upcoming-events">
<div class="container">
<div class="row">
<div class="upcoming-events">
<div class="section-header">
    <h2>Event terbaru</h2>
</div>
<!-- .section-header -->
<div class="row">
      <?php foreach($agenda as $agenda) { ?>
      <div class="col-md-4 rel text-center">
            <div class="agendaku">
                <a href="<?php echo base_url('agenda/detail/'.$agenda->id_agenda) ?>">
          <div class="tanggal">
          <?php echo date('d',strtotime($agenda->mulai)) ?>
                  </div>
                  <div class="tahun">
                  <?php echo date('M Y',strtotime($agenda->mulai)) ?>
                  </div>
                  </a>
              </div>

        <h4 class="title judul" data-appear-animation="bounceInLeft">
        <a href="<?php echo base_url('agenda/detail/'.$agenda->id_agenda) ?>">
        <?php echo $agenda->nama ?> <sup><i class="fa fa-eye"></i></sup></a></h4>
        <div class="text-small" data-appear-animation="bounceInLeft">
          <?php echo character_limiter($agenda->ringkasan,200) ?>
          <div class="clearfix"></div><br>
        </div>
      </div>
      <?php } ?>
  </div>

      <div class="clearfix"></div>
          <div class="col-md-12 text-center pagination pagin">
          <div class="clearfix"></div>
          <?php if(isset($pagin)) { echo $pagin; }  ?>
          <div class="clearfix"></div>
          </div>

   </div><!-- End .row -->
  </div><!-- End .container -->

  <div class="mb20"></div><!-- space -->

  </div><!-- End #content -->
</div>
<!-- .row -->
</div>
<!-- .upcoming-events -->
</div>
<!-- .row -->
</div>
<!-- .container -->
</section>
<!-- End campaian video Section -->
