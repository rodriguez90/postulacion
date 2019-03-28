<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "reclamacion".
 *
 * @property int $id No.
 * @property int $docente_id Docente
 * @property string $descripcion Contenido
 * @property int $procede Procede
 * @property string $fecha_creacion
 *
 * @property Docente $docente
 */
class Reclamacion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'reclamacion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['docente_id', 'descripcion'], 'required'],
            [['docente_id', 'procede'], 'integer'],
            [['descripcion'], 'string'],
            [['fecha_creacion'], 'safe'],
            [['docente_id'], 'exist', 'skipOnError' => true, 'targetClass' => Docente::className(), 'targetAttribute' => ['docente_id' => 'usuario_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'No.',
            'docente_id' => 'Docente',
            'descripcion' => 'Contenido',
            'procede' => 'Procede',
            'fecha_creacion' => 'Fecha Creacion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocente()
    {
        return $this->hasOne(Docente::className(), ['usuario_id' => 'docente_id']);
    }
}
