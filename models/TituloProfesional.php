<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tituloprofesional".
 *
 * @property int $id No.
 * @property string $nombre Nombre
 * @property string $descripcion Descripción
 *
 * @property Titulodocente[] $titulodocentes
 */
class TituloProfesional extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tituloprofesional';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'descripcion'], 'required'],
            [['nombre', 'descripcion'], 'string', 'max' => 255],
            [['nombre'], 'unique'],
            [['descripcion'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'No.',
            'nombre' => 'Nombre',
            'descripcion' => 'Descripción',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTitulodocentes()
    {
        return $this->hasMany(Titulodocente::className(), ['titulo_id' => 'id']);
    }
}
