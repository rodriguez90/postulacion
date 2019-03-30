<?php

namespace app\models;

use Yii;
use Da\User\Model\User;

/**
 * This is the model class for table "docente".
 *
 * @property int $usuario_id Usuario
 * @property string $primer_nombre Primer Nombre
 * @property string $segundo_nombre Segundo Nombre
 * @property string $primer_apellido Primer Apellido
 * @property string $segundo_apellido Segundo Apellido
 * @property string $cedula Cédula
 * @property string $telefono Teléfono
 * @property string $email Email
 * @property string $fecha_creacion
 *
 * @property User $usuario
 * @property Postulacion[] $postulacions
 * @property Reclamacion[] $reclamacions
 * @property Titulodocente[] $titulodocentes
 */
class Docente extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'docente';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['primer_nombre', 'primer_apellido', 'cedula', 'telefono', 'email'], 'required'],
            [['fecha_creacion'], 'safe'],
            [['primer_nombre', 'segundo_nombre', 'primer_apellido', 'segundo_apellido', 'cedula', 'telefono', 'email'], 'string', 'max' => 255],
            [['usuario_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['usuario_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'usuario_id' => 'Usuario',
            'primer_nombre' => 'Primer Nombre',
            'segundo_nombre' => 'Segundo Nombre',
            'primer_apellido' => 'Primer Apellido',
            'segundo_apellido' => 'Segundo Apellido',
            'cedula' => 'Cédula',
            'telefono' => 'Teléfono',
            'email' => 'Email',
            'fecha_creacion' => 'Fecha Creacion',
            'titulodocentes' => 'Títulos',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsuario()
    {
        return $this->hasOne(User::className(), ['id' => 'usuario_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPostulacions()
    {
        return $this->hasMany(Postulacion::className(), ['docente_id' => 'usuario_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getReclamacions()
    {
        return $this->hasMany(Reclamacion::className(), ['docente_id' => 'usuario_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTitulodocentes()
    {
        return $this->hasMany(Titulodocente::className(), ['docente_id' => 'usuario_id']);
    }
}
