<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "documento".
 *
 * @property int $id No.
 * @property string $nombre Nombre Documento
 * @property resource $contenido Contenido
 * @property int $tipo_documento_id Tipo Documento
 * @property string $fecha_creacion
 *
 * @property Tipodocumento $tipoDocumento
 * @property Postulacion[] $postulacions
 */
class Documento extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'documento';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'contenido', 'tipo_documento_id'], 'required'],
            [['contenido'], 'string'],
            [['tipo_documento_id'], 'integer'],
            [['fecha_creacion'], 'safe'],
            [['nombre'], 'string', 'max' => 255],
            [['tipo_documento_id'], 'exist', 'skipOnError' => true, 'targetClass' => Tipodocumento::className(), 'targetAttribute' => ['tipo_documento_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'No.',
            'nombre' => 'Nombre Documento',
            'contenido' => 'Contenido',
            'tipo_documento_id' => 'Tipo Documento',
            'fecha_creacion' => 'Fecha Creacion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTipoDocumento()
    {
        return $this->hasOne(Tipodocumento::className(), ['id' => 'tipo_documento_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPostulacions()
    {
        return $this->hasMany(Postulacion::className(), ['documento_id' => 'id']);
    }
}
