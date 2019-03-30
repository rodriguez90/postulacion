<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\TipoDocumento */

$this->title = 'Nuevo Tipo de Documento';
$this->params['breadcrumbs'][] = ['label' => 'Tipo Documentos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tipo-documento-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
