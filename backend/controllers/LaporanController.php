<?php

namespace backend\controllers;

use Yii;
use backend\models\KategoriPelanggan;
use backend\models\KategoriPelangganSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * KategoriPelangganController implements the CRUD actions for KategoriPelanggan model.
 */
class LaporanController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
        $tanggal_awal = Yii::$app->request->post('tanggal_awal');
        $tanggal_akhir = Yii::$app->request->post('tanggal_akhir');
        $sales = Yii::$app->request->post('sales');
        $status = Yii::$app->request->post('status');

        return $this->render('index', [
            'tanggal_awal' => $tanggal_awal,
            'tanggal_akhir' => $tanggal_akhir,
            'sales' => $sales,
            'status' => $status,
        ]);
    }

    public function actionLaporanPemesanan()
    {
        $tanggal_awal = Yii::$app->request->post('tanggal_awal');
        $tanggal_akhir = Yii::$app->request->post('tanggal_akhir');
        $sales = Yii::$app->request->post('sales');
        $status = Yii::$app->request->post('status');

        return $this->render('laporan_pemesanan', [
            'tanggal_awal' => $tanggal_awal,
            'tanggal_akhir' => $tanggal_akhir,
            'sales' => $sales,
            'status' => $status,
        ]);
    }

    public function actionLaporanPemesananPrint($tanggal_awal,  $tanggal_akhir)
    {
        $sales = Yii::$app->request->post('sales');
        $status = Yii::$app->request->post('status');
        return $this->renderPartial('laporan_pemesanan_print', [
            'tanggal_awal' => $tanggal_awal,
            'tanggal_akhir' => $tanggal_akhir,
            'sales' => $sales,
            'status' => $status,
        ]);
    }

    public function actionLaporanPenjualan()
    {
        $tanggal_awal = Yii::$app->request->post('tanggal_awal');
        $tanggal_akhir = Yii::$app->request->post('tanggal_akhir');
        $sales = Yii::$app->request->post('sales');
        $status = Yii::$app->request->post('status');

        return $this->render('laporan_penjualan', [
            'tanggal_awal' => $tanggal_awal,
            'tanggal_akhir' => $tanggal_akhir,
            'sales' => $sales,
            'status' => $status,
        ]);
    }


    public function actionLaporanAngsuran()
    {
        $tanggal_awal = Yii::$app->request->post('tanggal_awal');
        $tanggal_akhir = Yii::$app->request->post('tanggal_akhir');
        $sales = Yii::$app->request->post('sales');
        $status = Yii::$app->request->post('status');

        return $this->render('laporan_angsuran', [
            'tanggal_awal' => $tanggal_awal,
            'tanggal_akhir' => $tanggal_akhir,
            'sales' => $sales,
            'status' => $status,
        ]);
    }

    public function actionLaporanAngsuranPrint($tanggal_awal,  $tanggal_akhir)
    {
        $sales = Yii::$app->request->post('sales');
        $status = Yii::$app->request->post('status');

        return $this->renderPartial('laporan_angsuran_print', [
            'tanggal_awal' => $tanggal_awal,
            'tanggal_akhir' => $tanggal_akhir,
            'sales' => $sales,
            'status' => $status,
        ]);
    }
}
