<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "angsuran".
 *
 * @property int $id_angsuran
 * @property string $tanggal_angsuran
 * @property int $total_angsuran
 * @property int $id_kolektor
 * @property int $id_pemesanan
 */
class Angsuran extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'angsuran';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tanggal_angsuran', 'total_angsuran', 'id_kolektor', 'id_pemesanan'], 'required'],
            [['tanggal_angsuran'], 'safe'],
            [['total_angsuran', 'id_kolektor', 'id_pemesanan'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_angsuran' => 'Id Angsuran',
            'tanggal_angsuran' => 'Tanggal Angsuran',
            'total_angsuran' => 'Total Angsuran',
            'id_kolektor' => 'Id Kolektor',
            'id_pemesanan' => 'Id Pemesanan',
        ];
    }
}
