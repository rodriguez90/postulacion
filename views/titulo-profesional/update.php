<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\TituloProfesional */

$this->title = 'Modificar Titulo Profesional: ' . $model->nombre;
$this->params['breadcrumbs'][] = ['label' => 'Título Profesional', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Modificar';
?>
<div class="titulo-profesional-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
