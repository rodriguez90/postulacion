<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Reclamacion;

/**
 * ReclamacionSearch represents the model behind the search form of `app\models\Reclamacion`.
 */
class ReclamacionSearch extends Reclamacion
{
    public $docente;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'docente_id', 'procede'], 'integer'],
            [['descripcion', 'fecha_creacion', 'docente'], 'safe'],
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

        $user = Yii::$app->user;
        $isHHRR = null;
        $isAdmin = null;
        if($user) {
            $isHHRR = Yii::$app->authManager->getAssignment('HHRR', $user->getId());
            $isAdmin = Yii::$app->authManager->getAssignment('Administrador', $user->getId());
        }

        $query = Reclamacion::find();

        // add conditions that should always apply here

        $query->joinWith(['docente']);
        $query->orderBy(['reclamacion.id'=>SORT_DESC]);

        if($isHHRR == null && $isAdmin == null) {
            $query->where(['reclamacion.docente_id'=>$user->getId()]);
        }

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $dataProvider->sort->attributes['docente'] = [
            'asc'=>['docente.primer_nombre' => SORT_ASC],
            'desc'=>['docente.primer_nombre'=> SORT_DESC] ,
        ];

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'procede' => $this->procede,
        ]);

        $query->andFilterWhere(['DATE_FORMAT(reclamacion.fecha_creacion, "%d-%m-%Y")' => $this->fecha_creacion]);
        $query->andFilterWhere(['like', 'reclamacion.descripcion', $this->descripcion]);
        $query->orFilterWhere(['like', 'docente.primer_nombre', $this->docente]);
        $query->orFilterWhere(['like', 'docente.segundo_nombre', $this->docente]);
        $query->orFilterWhere(['like', 'docente.primer_apellido', $this->docente]);
        $query->orFilterWhere(['like', 'docente.segundo_apellido', $this->docente]);

        return $dataProvider;
    }
}
