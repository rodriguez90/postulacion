<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\TipoDocumento */

$this->title = $model->nombre;
$this->params['breadcrumbs'][] = ['label' => 'Tipos de Documentos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tipo-documento-view">

    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header">

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
                </div>
                <div class="box-body">
                    <div class="col col-md-6">
                        <?= DetailView::widget([
                            'model' => $model,
                            'attributes' => [
                                'id',
                                'nombre',
                                'descripcion',
                            ],
                        ]) ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
