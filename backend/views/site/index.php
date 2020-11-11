<?php

/* @var $this yii\web\View */
use practically\chartjs\Chart;
// use dosamigos\chartjs\ChartJs;

if (Yii::$app->user->isGuest) { 
   header("Location: index.php");
   exit;
}
$this->title = 'My Yii Application';

?> 	

<div class="site-index">
<div class="box">
<div class="box-header">
<div class="col-md-12" style="padding: 0;">
<div class="box-body">
    <div class="jumbotron">
        <h3>Welcome, <?= Yii::$app->user->identity->nama?>!</h3>
        <!-- <img src="/jurnal/backend/web/images/logo.png" height="200" width="15%"><br><br> -->
        <!-- <div class="panel-body">
           	 <div class="col-lg-3 col-xs-6">
              	<div class="small-box bg-info">
	                <div class="inner">
	                  	<p>TOTAL DATA USER</p>
	                </div>
	                <div class="icon">
	                  	<i class="fas fa-users"></i>
	                </div>
	                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              	</div>
            </div>
            <div class="col-lg-3 col-xs-6">
              	<div class="small-box bg-red">
	                <div class="inner">
	                  	<p>TOTAL DATA PUBLIKASI</p>
	                </div>
	                <div class="icon">
	                  	<i class="fas fa-globe"></i>
	                </div>
	                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              	</div>
            </div>
            <div class="col-lg-3 col-xs-6">
              	<div class="small-box bg-gray">
	                <div class="inner">
	                  	<p>TOTAL DATA PENELITIAN</p>
	                </div>
	                <div class="icon">
	                  	<i class="fas fa-flask"></i>
	                </div>
	                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              	</div>
            </div>
            <div class="col-lg-3 col-xs-6">
              	<div class="small-box bg-yellow">
	                <div class="inner">
	                  	<p>TOTAL DATA PENGABDIAN</p>
	                </div>
	                <div class="icon">
	                  	<i class="fab fa-trade-federation"></i>
	                </div>
	                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              	</div>
            </div>
            <div class="col-lg-3 col-xs-6">
              	<div class="small-box bg-green">
	                <div class="inner">
	                  	<p>TOTAL DATA BUKU AJAR</p>
	                </div>
	                <div class="icon">
	                  	<i class="fas fa-book"></i>
	                </div>
	                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              	</div>
            </div>
            <div class="col-lg-3 col-xs-6">
              	<div class="small-box bg-blue">
	                <div class="inner">
	                  	<p>TOTAL DATA KERJASAMA</p>
	                </div>
	                <div class="icon">
	                  	<i class="fas fa-people-carry"></i>
	                </div>
	                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              	</div>
            </div> -->
        </div>
    </div>
</div>