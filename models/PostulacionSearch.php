<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Postulacion;

/**
 * PostulacionSearch represents the model behind the search form of `app\models\Postulacion`.
 */
class PostulacionSearch extends Postulacion
{
    public $docente;

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'docente_id', 'estado'], 'integer'],
            [['puntuacion'], 'number'],
            [['fecha_creacion', 'docente'], 'safe'],
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

        $query = Postulacion::find();

        $query->joinWith(['docente']);
        $query->orderBy(['postulacion.id'=>SORT_DESC]);

        if($isHHRR == null && $isAdmin == null) {
            $query->where(['postulacion.docente_id'=>$user->getId()]);
        }

        // add conditions that should always apply here

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
            'estado' => $this->estado,
        ]);

        $query->andFilterWhere([ '>=', 'puntuacion', $this->puntuacion ]);
        $query->andFilterWhere(['DATE_FORMAT(postulacion.fecha_creacion, "%d-%m-%Y")' => $this->fecha_creacion]);
        $query->orFilterWhere(['like', 'docente.primer_nombre', $this->docente]);
        $query->orFilterWhere(['like', 'docente.segundo_nombre', $this->docente]);
        $query->orFilterWhere(['like', 'docente.primer_apellido', $this->docente]);
        $query->orFilterWhere(['like', 'docente.segundo_apellido', $this->docente]);

        return $dataProvider;
    }
}
