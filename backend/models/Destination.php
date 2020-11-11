<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "destination".
 *
 * @property int $id_destination
 * @property string $destination_name
 * @property int $cost
 */
class Destination extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'destination';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['destination_name', 'cost'], 'required'],
            [['cost'], 'integer'],
            [['destination_name'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_destination' => 'Id Destination',
            'destination_name' => 'Destination Name',
            'cost' => 'Cost',
        ];
    }
}
