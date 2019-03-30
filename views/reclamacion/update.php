<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Reclamacion */

$this->title = 'Modificar Reclamación: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Reclamaciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Modificar';
?>
<div class="reclamacion-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
