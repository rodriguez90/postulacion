<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Reclamacion */

$this->title = 'Create Reclamacion';
$this->params['breadcrumbs'][] = ['label' => 'Reclamacions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="reclamacion-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
