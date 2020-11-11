<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "sales".
 *
 * @property int $id_sales
 * @property string $nama_sales
 * @property string $alamat
 * @property string $telp
 */
class Sales extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'sales';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_sales', 'alamat', 'telp'], 'required'],
            [['alamat'], 'string'],
            [['nama_sales'], 'string', 'max' => 50],
            [['telp'], 'string', 'max' => 13],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_sales' => 'Id Sales',
            'nama_sales' => 'Nama Sales',
            'alamat' => 'Alamat',
            'telp' => 'Telp',
        ];
    }
}
