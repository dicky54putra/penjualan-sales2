<?php

use yii\helpers\Html;
// use yii\grid\GridView;
use kartik\grid\GridView;
use kartik\daterange\DateRangePicker;
use yii\widgets\ActiveForm;
use yii\jui\AutoComplete;
use yii\web\JsExpression;
use backend\models\Userrole;
use backend\models\Penjualan;
use backend\models\PenjualanDetail;
use backend\models\Login;


/* @var $this yii\web\View */
/* @var $searchModel backend\models\PurchaseOrderSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Laporan Penjualan';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="purchase-order-index">

<div class="invoice-view">

    <h4><?= Html::encode($this->title) ?></h4>

<div class="box">
    <div class="box-header">
        <div class="col-md-12" style="padding: 0;">
            <div class="box-body">
            <div>
                <?= Html::beginForm(['', array('class'=>'form-inline')]) ?>

                <table border="0" width="100%">
                    <tr>
                        <td width="10%">
                            <div class="form-group">Dari Tanggal</div>
                        </td>
                        <td align="center" width="5%">
                            <div class="form-group">:</div>
                        </td>
                        <td width="30%">
                            <div class="form-group">
                                <input type="date" name="tanggal_awal" class="form-control" required>
                            </div>
                        </td>
                        <td width="5%"></td>
                        <td width="10%">
                            <div class="form-group">Sales</div>
                        </td>
                        <td align="center" width="5%">
                            <div class="form-group">:</div>
                        </td>
                        <td width="30%">
                            <div class="form-group">
                            	<select class="form-control" name="sales">
	                            	<option value="">Pilih Sales</option>
	                                <?php
	                                $query_sales = Userrole::find()->joinWith("login")->where(["id_system_role" => 23])->orderBy("login.nama")->all();
	                                foreach ($query_sales as $key => $data) {
	                                	# code...
	                                ?>
                                	<option value="<?= $data->login->id_login ?>"><?= $data->login->nama ?></option>
		                            <?php } ?>
                            	</select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="10%">
                            <div class="form-group">Sampai Tanggal</div>
                        </td>
                        <td align="center" width="5%">
                            <div class="form-group">:</div>
                        </td>
                        <td width="30%">
                            <div class="form-group">
                                <input type="date" name="tanggal_akhir" class="form-control" required>
                            </div>
                        </td>
                        <td width="5%"></td>
                        <td width="10%">
                            <div class="form-group">Status</div>
                        </td>
                        <td align="center" width="5%">
                            <div class="form-group">:</div>
                        </td>
                        <td width="30%">
                            <div class="form-group">
                                <select class="form-control" name="status">
                                	<option value="">Pilih Status</option>
                                	<option value="1">Order</option>
                                	<option value="2">Penjualan</option>
                                	<option value="3">Pembayaran</option>
                                	<option value="4">Selesai</option>
                                	<option value="5">Canceled</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="form-group">
                                <?= Html::submitButton('Submit', ['class' => 'btn btn-success']) ?>
                            </div>
                        </td>
                    </tr>
                </table>

                <?= Html::endForm() ?>
            </div>
            </div>
            </div>
            </div>
            </div>

            <?php
            if ($tanggal_awal != '' && $tanggal_akhir != '') {
            	# code...
            ?>
            	<p style="font-family: 'Times New Roman'">
            		<h4>
            			<?= $this->title ?> Pertanggal : <?= date('d/m/Y', strtotime($tanggal_awal))?> s/d <?= date('d/m/Y', strtotime($tanggal_akhir)) ?>
	            		<?= Html::a('Cetak Laporan', ['cetak-laporan', 'tanggal_awal' => $tanggal_awal, 'tanggal_akhir' => $tanggal_akhir, 'sales' => $sales, 'status' => $status], ['class' => 'btn btn-primary', 'target' => '_blank', 'method' => 'post']) ?>
	                    <?= Html::a('Export Laporan', ['export-laporan', 'tanggal_awal' => $tanggal_awal, 'tanggal_akhir' => $tanggal_akhir, 'sales' => $sales, 'status' => $status], ['class' => 'btn btn-success', 'target' => '_blank', 'method' => 'post']) ?>
	                    <br>
	                    <?php
            			$sales_penjualan = Login::findOne($sales);
            			if (!empty($sales_penjualan->nama)) {
            				# code...
            				echo 'Sales : '.$sales_penjualan->nama;
            			}
            			?>
            			<br>
            			<?php
            			if (!empty($status)) {
            				# code...
            				if ($status == 1) {
            					# code...
            					echo "Status : Order";
            				} elseif ($status == 2) {
            					# code...
            					echo "Status : Penjualan";
            				} elseif ($status == 3) {
            					# code...
            					echo "Status : Pembayaran";
            				} elseif ($status == 4) {
            					# code...
            					echo "Status : Selesai";
            				} elseif ($status == 5) {
            					# code...
            					echo "Status : Canceled";
            				}
            			}
            			?>
            		</h4>
            	</p>
            	<div class="box">
		        <div class="box-header">
		        <div class="col-md-12" style="padding: 0;">
		        <div class="box-body">

                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nama Sales</th>
                            <th>Jumlah SP</th>
                            <th>KOM</th>
                            <th>REG</th>
                            <th>Value Kompor</th>
                            <th>Value Regulator</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $filter_sales = "";
                        if (!empty($sales)) {
                        	# code...
                        	$filter_sales = ' AND id_login = '.$sales.'';
                        }

                        $filter_status = "";
                        if (!empty($status)) {
                        	# code...
                        	$filter_status = ' AND status = '.$status.'';
                        }

                        $no = 1;
                        $totalan_total_sum = 0;
                        $query_penjualan = Yii::$app->db->createCommand("
                            SELECT *
                            FROM penjualan
                            WHERE tanggal_penjualan BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
                            $filter_sales
                            $filter_status
                            GROUP BY id_login
                            ")->query();
                        // $query_penjualan = Penjualan::find()->where('tanggal_penjualan BETWEEN '.$tanggal_awal.' AND '.$tanggal_akhir.' '.$filter_sales.'')->groupBy("id_login")->all();
                        foreach ($query_penjualan as $key => $data) {
                        	# code...
                        	$sales_penjualan = Login::findOne($data['id_login']);

                        	$count_penjualan_per_sales = Yii::$app->db->createCommand("
	                            SELECT COUNT(*)
	                            FROM penjualan
	                            WHERE tanggal_penjualan BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
	                            AND id_login = '$data[id_login]'
	                            $filter_sales
	                            $filter_status	
	                            ")->queryScalar();
                        	// $count_penjualan_per_sales = Penjualan::find()->where(['BETWEEN', 'tanggal_penjualan', $tanggal_awal, $tanggal_akhir])->andWhere(['id_login' => $data['id_login']])->andWhere(['status' => $data['status']])->count();

                        	$count_penjualan_per_sales_kom = Yii::$app->db->createCommand("
	                            SELECT COUNT(*)
	                            FROM penjualan
	                            LEFT JOIN penjualan_detail ON penjualan_detail.id_penjualan = penjualan.id_penjualan
	                            WHERE tanggal_penjualan BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
	                            AND id_login = '$data[id_login]'
	                            AND id_barang = 1
	                            $filter_sales
	                            $filter_status	
	                            ")->queryScalar();
                        	// $count_penjualan_per_sales_kom = Penjualan::find()->leftJoin("penjualan_detail", "penjualan_detail.id_penjualan = penjualan.id_penjualan")->where(['BETWEEN', 'tanggal_penjualan', $tanggal_awal, $tanggal_akhir])->andWhere(['id_login' => $data['id_login']])->andWhere(["id_barang" => 1])->andWhere(['status' => $data['status']])->count();

                        	$count_penjualan_per_sales_reg = Yii::$app->db->createCommand("
	                            SELECT COUNT(*)
	                            FROM penjualan
	                            LEFT JOIN penjualan_detail ON penjualan_detail.id_penjualan = penjualan.id_penjualan
	                            WHERE tanggal_penjualan BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
	                            AND id_login = '$data[id_login]'
	                            AND id_barang = 2
	                            $filter_sales
	                            $filter_status	
	                            ")->queryScalar();
                        	// $count_penjualan_per_sales_reg = Penjualan::find()->leftJoin("penjualan_detail", "penjualan_detail.id_penjualan = penjualan.id_penjualan")->where(['BETWEEN', 'tanggal_penjualan', $tanggal_awal, $tanggal_akhir])->andWhere(['id_login' => $data['id_login']])->andWhere(["id_barang" => 2])->andWhere(['status' => $data['status']])->count();

                        	# query untuk mencari array id penjualan
                        	$array_penjualan = Yii::$app->db->createCommand("
	                            SELECT *
	                            FROM penjualan
	                            WHERE tanggal_penjualan BETWEEN '$tanggal_awal' AND '$tanggal_akhir'
	                            AND id_login = '$data[id_login]'
	                            $filter_sales
	                            $filter_status
	                            ")->query();
                        	// $array_penjualan = Penjualan::find()->where(['BETWEEN', 'tanggal_penjualan', $tanggal_awal, $tanggal_akhir])->andWhere(['id_login' => $data['id_login']])->all();
                        	$id_penjualan = array();
                        	foreach ($array_penjualan as $key => $value) {
                        		# code...
                        		$id_penjualan[] = $value['id_penjualan'];
                        	}
                        	$array_id_penjualan = implode(', ', $id_penjualan);

                        	# untuk kom
                        	$query = (new \yii\db\Query())->from('penjualan_detail')->where("id_penjualan IN ($array_id_penjualan)")->andWhere(['id_barang' => 1]);
					        $sum_sub_total_kom = $query->sum('sub_total');

					        # untuk reg
                        	$query = (new \yii\db\Query())->from('penjualan_detail')->where("id_penjualan IN ($array_id_penjualan)")->andWhere(['id_barang' => 2]);
					        $sum_sub_total_reg = $query->sum('sub_total');

					        $total_sum = $sum_sub_total_kom + $sum_sub_total_reg;
					        $totalan_total_sum += $total_sum;
                        ?>
	                        <tr>
	                        	<td><?= $no++.'.' ?></td>
	                        	<td><?= $sales_penjualan->nama ?></td>
	                        	<td><?= $count_penjualan_per_sales ?></td>
	                        	<td><?= $count_penjualan_per_sales_kom ?></td>
	                        	<td><?= $count_penjualan_per_sales_reg ?></td>
	                        	<td style="text-align: right;"><?= ribuan($sum_sub_total_kom) ?></td>
	                        	<td style="text-align: right;"><?= ribuan($sum_sub_total_reg) ?></td>
	                        	<td style="text-align: right;"><?= ribuan($total_sum) ?></td>
	                        </tr>
	                    <?php } ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="7">Total</th>
                            <th style="text-align: right;"><?= ribuan($totalan_total_sum) ?></th>
                        </tr>
                    </tfoot>
                </table>

	            </div>
	            </div>
	            </div>
	            </div>
            <?php
            }
            ?>
            
        </div>
    </div>
</div>
