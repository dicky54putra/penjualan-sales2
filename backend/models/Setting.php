<?php

namespace backend\models;

use Yii;
use yii\web\UploadedFile;

/**
 * This is the model class for table "setting".
 *
 * @property int $id_setting
 * @property string $nama
 * @property string $email
 * @property string $alamat
 * @property string $telepon
 * @property int $nomor_rekening
 * @property string $foto
 */
class Setting extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'setting';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nama', 'email', 'alamat', 'telepon', 'nama_bank', 'nomor_rekening'], 'required'],
            [['alamat'], 'string'],
            [['nomor_rekening'], 'integer'],
            [['nama', 'email', 'telepon', 'nama_bank'], 'string', 'max' => 100],
            [['foto'], 'file', 'skipOnEmpty' => true, 'extensions' => 'png, jpg'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_setting' => 'Id Setting',
            'nama' => 'Nama',
            'email' => 'Email',
            'alamat' => 'Alamat',
            'telepon' => 'Telepon',
            'nama_bank' => 'Nama Bank',
            'nomor_rekening' => 'Nomor Rekening',
            'foto' => 'Foto',
        ];
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {

            if ($this->foto) {
                if (!empty($this->foto->baseName)) {
                    $filename = time() . "_" . str_replace(" ", "_", $this->foto->baseName) . '.' . $this->foto->extension;
                    $this->foto->saveAs('upload/' . $filename);
                    $this->foto = $filename;
                }
            } else {
                $foto = Setting::findOne(1);
                if (!empty($foto->foto)) {
                    $this->foto = $foto->foto;
                } else {
                    $this->foto = "avatar5.png";
                }
            }
            return true;
        }
    }
}
