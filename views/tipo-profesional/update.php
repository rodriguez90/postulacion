<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\TituloProfesional */

$this->title = 'Update Titulo Profesional: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Titulo Profesionals', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="titulo-profesional-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
