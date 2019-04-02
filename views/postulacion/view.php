<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Postulacion */

$nombreDocente = $model->docente->primer_nombre . ' ' . $model->docente->segundo_apellido;
$this->title = 'Postulación: ' . $nombreDocente;
$this->params['breadcrumbs'][] = ['label' => 'Postulacions', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="postulacion-view">

    <p>
        <?= Html::a('Modificar', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Eliminar', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Está seguro que desea eliminar el elemento?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                    'attribute' => 'docente_id',
                    'value' => $nombreDocente

            ],
            'puntuacion',
            'fecha_creacion',
            [
                'attribute' =>  'estado',
                'value' => \app\models\Postulacion::ESTADO_LABEL[$model->estado]
            ]
        ],
    ]) ?>

</div>
