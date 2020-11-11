<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Pelanggan;

/**
 * PelangganSearch represents the model behind the search form of `backend\models\Pelanggan`.
 */
class PelangganSearch extends Pelanggan
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_pelanggan'], 'integer'],
            [['nama_pelanggan', 'alamat', 'tlp'], 'safe'],
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
        $query = Pelanggan::find();

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
            'id_pelanggan' => $this->id_pelanggan,
        ]);

        $query->andFilterWhere(['like', 'nama_pelanggan', $this->nama_pelanggan])
            ->andFilterWhere(['like', 'alamat', $this->alamat])
            ->andFilterWhere(['like', 'tlp', $this->tlp]);

        return $dataProvider;
    }
}
