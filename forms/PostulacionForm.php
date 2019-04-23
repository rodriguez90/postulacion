<?php
/**
 * Created by PhpStorm.
 * User: pedro
 * Date: 30/03/2019
 * Time: 12:34
 */

namespace app\forms;

use app\models\Docente;
use app\models\Documento;
use app\models\Postulacion;
use app\models\TipoDocumento;
use Yii;
use yii\base\Model;
use yii\web\UploadedFile;

/**
 * Class PostulacionForm
 * @package app\forms
 * @property Docente $docente
 * @property Postulacion $postulacion
 * @property Documentos $documentos
 */

class PostulacionForm extends Model
{
    private $_docente;
    private $_postulacion = [];
    private $_documentos = [];
    private $id = null;
    public  $ficheros = [];

    private $reglasDinamica = [];

    public function __construct(array $config = [])
    {
        $this->id = $config['id'];
        unset($config['id']);
        parent::__construct($config);
    }

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub

        $this->_docente =  Docente::findOne(['usuario_id'=>Yii::$app->user->getId()]);

        if ($this->id && $this->_docente == null)
        {
            $this->_postulacion = Postulacion::findOne(['id'=> $this->id]);
            $this->_docente = $this->postulacion->docente;
        }
        else if($this->_docente) {
            $this->_postulacion = Postulacion::findOne(['docente_id'=>Yii::$app->user->getId()]);
        }

        $tiposDocumentos = TipoDocumento::find()->all();

        $this->_documentos = [];

        if($this->_postulacion == null )
        {
            $this->_postulacion = new Postulacion();
            $this->postulacion->estado = true;
            $this->_postulacion->docente_id = Yii::$app->user->getId();

            foreach ($tiposDocumentos as $tiposDocumento)
            {
                $documento = new Documento();
                $documento->tipo_documento_id = $tiposDocumento->id;
                array_push($this->_documentos, $documento);
            }
        }
        else {
            foreach ($tiposDocumentos as $tiposDocumento)
            {
                $documento = Documento::find()
                    ->where(['postulacion_id'=>$this->_postulacion->id])
                    ->andWhere(['tipo_documento_id'=>$tiposDocumento->id])
                    ->one();
                if ($documento == null)
                {
                    $documento = new Documento();
                    $documento->tipo_documento_id = $tiposDocumento->id;
                    $documento->postulacion_id = $this->_postulacion->id;
                }

//                $_FILES['ficheros'][$tiposDocumento->id] = $documento->nombre;
//                $_FILES['ficheros']['tmp_name'] = $documento->contenido;
                array_push($this->_documentos, $documento);
            }
        }

        array_push($this->reglasDinamica,   [['ficheros'], 'file', 'maxFiles' => count($tiposDocumentos)]);

    }

    public function rules()
    {
        $rules = [
            [['docente_id', 'puntuacion'], 'required'],
            [['docente_id'], 'integer'],
            [['puntuacion'], 'number'],
            [['estado'], 'integer'],
            [['Documentos'], 'safe'],
            [['ficheros'], 'file', 'maxFiles' => count($this->_documentos)]
        ];

//        return array_merge($rules, $this->reglaDinamica);
        return $rules;

    }

    public function  save() {
        if (!$this->validate()) {
            return false;
        }

        $transaction = Yii::$app->db->beginTransaction();
        if (!$this->postulacion->save()) {
            $this->addError('error', 'Ah ocurrido un error al salvar la postulación');
            $transaction->rollBack();
            return false;
        }

        if (!$this->saveDocumentos()) {
            $this->addError('error', 'Ah ocurrido un error al salvar los documentos');
            $transaction->rollBack();
            return false;
        }

        $transaction->commit();
        return true;
    }

    private function saveDocumentos() {

        foreach ($this->_documentos as  $index => $documento) {
            $fichero = $this->ficheros[$index];
            if($fichero)
            {
                $nombreDocumento = 'documentos/' . $fichero->baseName . '.' . $fichero->extension;

                if(!$fichero->saveAs($nombreDocumento)) {
//                    var_dump($nombreDocumento);
//                    var_dump($fichero->error);
//                    die('Error salvando');
                    return false;
                }
                $documento->nombre = $fichero->baseName . '.' . $fichero->extension;
                $documento->contenido = $nombreDocumento;
                $documento->postulacion_id = $this->getPostulacion_Id();
                if(!$documento->save()) {
//                    var_dump($nombreDocumento);
//                    die('Error guardando doc');
                    return false;
                }
            }
        }

        return true;
    }

    public function validate($attributeNames = null, $clearErrors = true)
    {
        return parent::validate($attributeNames, $clearErrors); // TODO: Change the autogenerated stub
    }

    public function getDocente() {
        return $this->_docente;
    }

    public function setDocente($docente) {
        if ($docente instanceof Docente) {
            $this->_docente = $docente;
        } else if (is_array($docente)) {
            $this->_docente->setAttributes($docente);
        }
    }

    public function getPostulacion() {
        return $this->_postulacion;
    }

    public function setPostulacion($postulacion) {

        if (is_array($postulacion)) {
            $this->_postulacion->loadDefaultValues();
            $this->_postulacion->setAttributes($postulacion);
        } elseif ($postulacion instanceof Postulacion) {
            $this->_postulacion = $postulacion;
        }
    }

    public function getDocumentos() {
        return $this->_documentos;
    }

    public function setDocumentos($documentos) {
        foreach ($documentos as $key => $documento) {
            if (is_array($documento)) {
                $tipo = $documento['tipo_documento_id'];
                $this->_documentos[$tipo] = new Documento();
                $this->_documentos[$tipo]->loadDefaultValues();
                $this->_documentos[$tipo]->setAttributes($documento);
            } elseif ($documento instanceof Documento) {
                if($documento->isNewRecord)
                {
                    $this->_documentos[$documento->tipo_documento_id] = $documento;
                }
                else {
                    $this->_documentos[$documento->id] = $documento;
                }
            }
        }
    }

    private $_docente_id;
    public function getDocente_Id() {
        return $this->_docente->usuario_id;
    }

    public function setDocente_Id($docenteId) {
        $this->_docente->usuario_id = $docenteId;
    }

    private $_puntuacion;
    public function getPuntuacion() {
        return $this->_postulacion->puntuacion;
    }

    public function setPuntuacion($puntuacion) {
        $this->_postulacion->puntuacion = $puntuacion;
    }

    private $_postulacion_id;
    public function getPostulacion_Id() {
        return $this->_postulacion->id;
    }

    private $_estado;
    public function getEstado() {
        return $this->_postulacion->estado;
    }

    public function setEstado($estado) {
        $this->_postulacion->estado = $estado;
    }

    private $_isNewRecord;
    public function getIsNewRecord() {
        return $this->postulacion->isNewRecord;
    }

    public function setAttributes($data) {

        $this->postulacion = $data['Postulacion'];
        $this->ficheros = UploadedFile::getInstances($this, 'ficheros');
//        var_dump($data['PostulacionForm']['ficheros']);
//        var_dump($this->ficheros);die;
    }
}