<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "barang".
 *
 * @property int $id_barang
 * @property string $nama_barang
 * @property int $harga
 * @property string $jenis_barang
 */
class Barang extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'barang';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_barang', 'harga', 'jenis_harga'], 'required'],
            [['nama_barang'], 'string', 'max' => 50],
            [['jenis_harga', 'jenis_pembayaran'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_barang' => 'Id Barang',
            'nama_barang' => 'Nama Barang',
            'harga' => 'Harga',
            'jenis_harga' => 'Jenis Harga',
            'jenis_pembayaran' => 'Jenis Pembayaran',
        ];
    }
}
