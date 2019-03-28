<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\TituloProfesional */

$this->title = 'Create Titulo Profesional';
$this->params['breadcrumbs'][] = ['label' => 'Titulo Profesionals', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="titulo-profesional-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
