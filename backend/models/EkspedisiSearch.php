<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Ekspedisi;

/**
 * EkspedisiSearch represents the model behind the search form of `backend\models\Ekspedisi`.
 */
class EkspedisiSearch extends Ekspedisi
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_ekspedisi', 'type', 'id_destination', 'product', 'total_biaya', 'status', 'id_login'], 'integer'],
            [['tanggal', 'note', 'recipient_name', 'recipient_company', 'recipient_address', 'recipient_zip_code', 'recipient_phone', 'recipient_email', 'shipper_name', 'shipper_company', 'shipper_address', 'shipper_zip_code', 'shipper_phone', 'shipper_email'], 'safe'],
            [['long', 'wide', 'high'], 'number'],
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
        $query = Ekspedisi::find();
        $query->joinWith("destination");
        $query->joinWith("login");

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
            'id_ekspedisi' => $this->id_ekspedisi,
            'tanggal' => $this->tanggal,
            'type' => $this->type,
            // 'id_destination' => $this->id_destination,
            'product' => $this->product,
            'long' => $this->long,
            'wide' => $this->wide,
            'high' => $this->high,
            'total_biaya' => $this->total_biaya,
            'status' => $this->status,
            // 'id_login' => $this->id_login,
        ]);

        $query->andFilterWhere(['like', 'destination.destination_name', $this->id_destination])
            ->andFilterWhere(['like', 'note', $this->note])
            ->andFilterWhere(['like', 'recipient_name', $this->recipient_name])
            ->andFilterWhere(['like', 'recipient_company', $this->recipient_company])
            ->andFilterWhere(['like', 'recipient_address', $this->recipient_address])
            ->andFilterWhere(['like', 'recipient_zip_code', $this->recipient_zip_code])
            ->andFilterWhere(['like', 'recipient_phone', $this->recipient_phone])
            ->andFilterWhere(['like', 'recipient_email', $this->recipient_email])
            ->andFilterWhere(['like', 'shipper_name', $this->shipper_name])
            ->andFilterWhere(['like', 'shipper_company', $this->shipper_company])
            ->andFilterWhere(['like', 'shipper_address', $this->shipper_address])
            ->andFilterWhere(['like', 'shipper_zip_code', $this->shipper_zip_code])
            ->andFilterWhere(['like', 'shipper_phone', $this->shipper_phone])
            ->andFilterWhere(['like', 'shipper_email', $this->shipper_email])
            ->andFilterWhere(['like', 'login.nama', $this->id_login]);

        return $dataProvider;
    }
}
