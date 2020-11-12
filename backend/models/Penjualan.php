<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "penjualan".
 *
 * @property int $id_penjualan
 * @property string $tanggal_penjualan
 * @property int $total_penjualan
 * @property int $id_kolektor
 * @property int $id_pemesanan
 */
class Penjualan extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'penjualan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tanggal_penjualan', 'total_penjualan', 'id_kolektor', 'id_pemesanan'], 'required'],
            [['tanggal_penjualan'], 'safe'],
            [['total_penjualan', 'id_kolektor', 'id_pemesanan'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_penjualan' => 'Id Penjualan',
            'tanggal_penjualan' => 'Tanggal Penjualan',
            'total_penjualan' => 'Total Penjualan',
            'id_kolektor' => 'Id Kolektor',
            'id_pemesanan' => 'Id Pemesanan',
        ];
    }
}
