<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "pelanggan".
 *
 * @property int $id_pelanggan
 * @property string $nama_pelanggan
 * @property string $alamat
 * @property string $tlp
 */
class Pelanggan extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pelanggan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_pelanggan', 'alamat', 'tlp'], 'required'],
            [['alamat'], 'string'],
            [['nama_pelanggan'], 'string', 'max' => 50],
            [['tlp'], 'string', 'max' => 13],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_pelanggan' => 'Id Pelanggan',
            'nama_pelanggan' => 'Nama Pelanggan',
            'alamat' => 'Alamat',
            'tlp' => 'Tlp',
        ];
    }
}
