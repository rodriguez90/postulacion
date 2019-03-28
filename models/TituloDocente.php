<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "titulodocente".
 *
 * @property int $id No.
 * @property int $titulo_id Titulo Profesional.
 * @property int $docente_id Docente
 *
 * @property Docente $docente
 * @property Tituloprofesional $titulo
 */
class TituloDocente extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'titulodocente';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['titulo_id', 'docente_id'], 'required'],
            [['titulo_id', 'docente_id'], 'integer'],
            [['docente_id'], 'exist', 'skipOnError' => true, 'targetClass' => Docente::className(), 'targetAttribute' => ['docente_id' => 'usuario_id']],
            [['titulo_id'], 'exist', 'skipOnError' => true, 'targetClass' => Tituloprofesional::className(), 'targetAttribute' => ['titulo_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'No.',
            'titulo_id' => 'Titulo Profesional.',
            'docente_id' => 'Docente',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocente()
    {
        return $this->hasOne(Docente::className(), ['usuario_id' => 'docente_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTitulo()
    {
        return $this->hasOne(Tituloprofesional::className(), ['id' => 'titulo_id']);
    }
}
