<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Destination;

/**
 * DestinationSearch represents the model behind the search form of `backend\models\Destination`.
 */
class DestinationSearch extends Destination
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_destination', 'cost'], 'integer'],
            [['destination_name'], 'safe'],
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
        $query = Destination::find();

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
            'id_destination' => $this->id_destination,
            'cost' => $this->cost,
        ]);

        $query->andFilterWhere(['like', 'destination_name', $this->destination_name]);

        return $dataProvider;
    }
}
