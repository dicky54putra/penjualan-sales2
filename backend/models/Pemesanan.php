<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "pemesanan".
 *
 * @property int $id_pemesanan
 * @property string $tanggal_pemesanan
 * @property string $paket_pemesanan
 * @property int $jumlah_pemesanan
 * @property int $id_sales
 * @property int $id_pelanggan
 * @property int $id_barang
 */
class Pemesanan extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pemesanan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tanggal_pemesanan', 'paket_pemesanan', 'jumlah_pemesanan', 'id_sales', 'id_pelanggan', 'id_barang'], 'required'],
            [['tanggal_pemesanan'], 'safe'],
            [['jumlah_pemesanan', 'id_sales', 'id_pelanggan', 'id_barang'], 'integer'],
            [['paket_pemesanan'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_pemesanan' => 'Id Pemesanan',
            'tanggal_pemesanan' => 'Tanggal Pemesanan',
            'paket_pemesanan' => 'Paket Pemesanan',
            'jumlah_pemesanan' => 'Jumlah Pemesanan',
            'id_sales' => 'Id Sales',
            'id_pelanggan' => 'Id Pelanggan',
            'id_barang' => 'Id Barang',
        ];
    }
}
