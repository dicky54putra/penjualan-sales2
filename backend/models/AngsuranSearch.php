<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Angsuran;

/**
 * AngsuranSearch represents the model behind the search form of `backend\models\Angsuran`.
 */
class AngsuranSearch extends Angsuran
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_angsuran', 'total_angsuran', 'id_kolektor', 'id_pemesanan'], 'integer'],
            [['tanggal_angsuran'], 'safe'],
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
        $query = Angsuran::find();

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
            'id_angsuran' => $this->id_angsuran,
            'tanggal_angsuran' => $this->tanggal_angsuran,
            'total_angsuran' => $this->total_angsuran,
            'id_kolektor' => $this->id_kolektor,
            'id_pemesanan' => $this->id_pemesanan,
        ]);

        return $dataProvider;
    }
}
