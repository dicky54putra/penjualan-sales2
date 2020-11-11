<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "ekspedisi".
 *
 * @property int $id_ekspedisi
 * @property string $tanggal
 * @property int $type
 * @property int $id_destination
 * @property int $product
 * @property double $long
 * @property double $wide
 * @property double $high
 * @property string $note
 * @property string $recipient_name
 * @property string $recipient_company
 * @property string $recipient_address
 * @property string $recipient_zip_code
 * @property string $recipient_phone
 * @property string $recipient_email
 * @property string $shipper_name
 * @property string $shipper_company
 * @property string $shipper_address
 * @property string $shipper_zip_code
 * @property string $shipper_phone
 * @property string $shipper_email
 * @property int $status
 * @property int $id_login
 */
class Ekspedisi extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ekspedisi';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['tanggal', 'type', 'id_destination', 'product', 'long', 'wide', 'high', 'total_biaya', 'recipient_name', 'recipient_address', 'recipient_phone', 'shipper_name', 'shipper_address', 'shipper_phone', 'status', 'id_login'], 'required'],
            [['tanggal'], 'safe'],
            [['type', 'id_destination', 'product', 'status', 'id_login'], 'integer'],
            [['long', 'wide', 'high'], 'number'],
            [['note', 'recipient_address', 'shipper_address'], 'string'],
            [['recipient_name', 'recipient_company', 'recipient_email', 'shipper_name', 'shipper_company', 'shipper_email'], 'string', 'max' => 100],
            [['recipient_zip_code', 'shipper_zip_code'], 'string', 'max' => 10],
            [['recipient_phone', 'shipper_phone'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_ekspedisi' => 'Id Ekspedisi',
            'tanggal' => 'Tanggal',
            'type' => 'Type',
            'id_destination' => 'Id Destination',
            'product' => 'Product',
            'long' => 'Long',
            'wide' => 'Wide',
            'high' => 'High',
            'total_biaya' => 'Total Biaya',
            'note' => 'Note',
            'recipient_name' => 'Recipient Name',
            'recipient_company' => 'Recipient Company',
            'recipient_address' => 'Recipient Address',
            'recipient_zip_code' => 'Recipient Zip Code',
            'recipient_phone' => 'Recipient Phone',
            'recipient_email' => 'Recipient Email',
            'shipper_name' => 'Shipper Name',
            'shipper_company' => 'Shipper Company',
            'shipper_address' => 'Shipper Address',
            'shipper_zip_code' => 'Shipper Zip Code',
            'shipper_phone' => 'Shipper Phone',
            'shipper_email' => 'Shipper Email',
            'status' => 'Status',
            'id_login' => 'Id Login',
        ];
    }

    public function getdestination()
    {
        return $this->hasOne(Destination::className(), ['id_destination' => 'id_destination']);
    }

    public function getlogin()
    {
        return $this->hasOne(Login::className(), ['id_login' => 'id_login']);
    }
}
