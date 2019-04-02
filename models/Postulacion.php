<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "postulacion".
 *
 * @property int $id No.
 * @property int $docente_id Docente
 * @property double $puntuacion Puntuación
 * @property string $fecha_creacion
 * @property int $estado Estado
 *
 * @property Documento[] $documentos
 * @property Docente $docente
 */
class Postulacion extends \yii\db\ActiveRecord
{

    const ESTADO_CERRADA = 0;
    const ESTADO_ABIERTA = 1;

    const ESTADO_LABEL = [
        0 => 'Cerrada',
        1 => 'Abierta',
    ];

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
            [['docente_id'], 'required'],
            [['docente_id', 'estado'], 'integer'],
            [['puntuacion'], 'number'],
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
            'puntuacion' => 'Puntuación',
            'fecha_creacion' => 'Fecha',
            'estado' => 'Estado',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocumentos()
    {
        return $this->hasMany(Documento::className(), ['postulacion_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDocente()
    {
        return $this->hasOne(Docente::className(), ['usuario_id' => 'docente_id']);
    }
}
