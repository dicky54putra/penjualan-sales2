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
						<h3>Welcome, <?= Yii::$app->user->identity->nama ?>!</h3>
						<img src="images/logo2.png" height="200"><br><br>
						<p>Jln. Sinar Sejahtera I NO.588-Kedungmundu-Tembalang</p><br>
						<p style="margin-top: -20px;">No.Telp : 024-6703909</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>