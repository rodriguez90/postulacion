<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "postulacion".
 *
 * @property int $id No.
 * @property int $docente_id Docente
 * @property int $documento_id Documento
 * @property double $puntuacion Puntuación
 * @property string $fecha_creacion
 *
 * @property Docente $docente
 * @property Documento $documento
 */
class Postulacion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'postulacion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['docente_id', 'documento_id'], 'required'],
            [['docente_id', 'documento_id'], 'integer'],
            [['puntuacion'], 'number'],
            [['fecha_creacion'], 'safe'],
            [['docente_id'], 'exist', 'skipOnError' => true, 'targetClass' => Docente::className(), 'targetAttribute' => ['docente_id' => 'usuario_id']],
            [['documento_id'], 'exist', 'skipOnError' => true, 'targetClass' => Documento::className(), 'targetAttribute' => ['documento_id' => 'id']],
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
            'documento_id' => 'Documento',
            'puntuacion' => 'Puntuación',
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumento()
    {
        return $this->hasOne(Documento::className(), ['id' => 'documento_id']);
    }
}
