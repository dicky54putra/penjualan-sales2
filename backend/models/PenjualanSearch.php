<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Penjualan;
use Yii;

/**
 * PenjualanSearch represents the model behind the search form of `backend\models\Penjualan`.
 */
class PenjualanSearch extends Penjualan
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_penjualan', 'total_penjualan', 'id_kolektor', 'id_pemesanan'], 'integer'],
            [['tanggal_penjualan'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Penjualan::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_penjualan' => $this->id_penjualan,
            'tanggal_penjualan' => $this->tanggal_penjualan,
            'total_penjualan' => $this->total_penjualan,
            'id_kolektor' => $this->id_kolektor,
            'id_pemesanan' => $this->id_pemesanan,
        ]);

        return $dataProvider;
    }

    public function search_kolektor($params)
    {
        $login = Login::findOne(['id_login' => Yii::$app->user->id]);
        $tlp = preg_replace("/[^0-9]/", "", $login->username);
        $query = Penjualan::find()
            ->leftJoin('kolektor', 'kolektor.id_kolektor = penjualan.id_kolektor')
            ->where(['kolektor.nama_kolektor' => $login->nama])
            ->andWhere(['kolektor.tlp' => $tlp]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id_penjualan' => $this->id_penjualan,
            'tanggal_penjualan' => $this->tanggal_penjualan,
            'total_penjualan' => $this->total_penjualan,
            'id_kolektor' => $this->id_kolektor,
            'id_pemesanan' => $this->id_pemesanan,
        ]);

        return $dataProvider;
    }
}
