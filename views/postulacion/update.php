<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\forms\PostulacionForm */

$this->title = 'Modificar Postulación: ' . $model->docente->primer_nombre . ' ' . $model->docente->segundo_apellido;
$this->params['breadcrumbs'][] = ['label' => 'Postulaciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->getPostulacion_Id(), 'url' => ['view', 'id' => $model->getPostulacion_Id()]];
$this->params['breadcrumbs'][] = 'Modificar';
?>
<div class="postulacion-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
