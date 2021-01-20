<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "kolektor".
 *
 * @property int $id_kolektor
 * @property string $nama_kolektor
 * @property string $alamat
 * @property int $tlp
 */
class Kolektor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'kolektor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama_kolektor', 'alamat', 'tlp'], 'required'],
            [['alamat'], 'string'],
            [['nama_kolektor'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_kolektor' => 'Id Kolektor',
            'nama_kolektor' => 'Nama Kolektor',
            'alamat' => 'Alamat',
            'tlp' => 'Tlp',
        ];
    }
}
