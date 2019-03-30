<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Reclamacion */

$this->title = 'Nuevo Reclamación';
$this->params['breadcrumbs'][] = ['label' => 'Reclamaciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reclamacion-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
