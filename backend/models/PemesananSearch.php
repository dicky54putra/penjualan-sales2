<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Pemesanan;
use Yii;

/**
 * PemesananSearch represents the model behind the search form of `backend\models\Pemesanan`.
 */
class PemesananSearch extends Pemesanan
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_pemesanan', 'jumlah_pemesanan', 'id_sales', 'id_pelanggan', 'id_barang'], 'integer'],
            [['tanggal_pemesanan', 'paket_pemesanan'], 'safe'],
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
        $query = Pemesanan::find();

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
            'id_pemesanan' => $this->id_pemesanan,
            'tanggal_pemesanan' => $this->tanggal_pemesanan,
            'jumlah_pemesanan' => $this->jumlah_pemesanan,
            'id_sales' => $this->id_sales,
            'id_pelanggan' => $this->id_pelanggan,
            'id_barang' => $this->id_barang,
        ]);

        $query->andFilterWhere(['like', 'paket_pemesanan', $this->paket_pemesanan]);

        return $dataProvider;
    }

    public function search_sales($params)
    {
        $login = Login::findOne(['id_login' => Yii::$app->user->id]);
        $tlp = preg_replace("/[^0-9]/", "", $login->username);
        $query = Pemesanan::find()
            ->leftJoin('sales', 'sales.id_sales = pemesanan.id_sales')
            ->where(['sales.nama_sales' => $login->nama])
            ->andWhere(['sales.telp' => $tlp]);

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
            'id_pemesanan' => $this->id_pemesanan,
            'tanggal_pemesanan' => $this->tanggal_pemesanan,
            'jumlah_pemesanan' => $this->jumlah_pemesanan,
            'id_sales' => $this->id_sales,
            'id_pelanggan' => $this->id_pelanggan,
            'id_barang' => $this->id_barang,
        ]);

        $query->andFilterWhere(['like', 'paket_pemesanan', $this->paket_pemesanan]);

        return $dataProvider;
    }
}
