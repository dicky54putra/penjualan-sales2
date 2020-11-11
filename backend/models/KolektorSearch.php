<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Kolektor;

/**
 * KolektorSearch represents the model behind the search form of `backend\models\Kolektor`.
 */
class KolektorSearch extends Kolektor
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_kolektor'], 'integer'],
            [['nama_kolektor', 'alamat'], 'safe'],
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
        $query = Kolektor::find();

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
            'id_kolektor' => $this->id_kolektor,
            'tlp' => $this->tlp,
        ]);

        $query->andFilterWhere(['like', 'nama_kolektor', $this->nama_kolektor])
            ->andFilterWhere(['like', 'alamat', $this->alamat]);

        return $dataProvider;
    }
}
