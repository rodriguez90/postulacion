<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ReclamacionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Reclamaciones';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row">
    <div class="col-md-12">
        <div class="box box-info">
            <div class="box-header">

                <p>
                    <?= Html::a('Nueva Reclamación', ['create'], ['class' => 'btn btn-success']) ?>
                </p>
            </div>
            <?php Pjax::begin(); ?>
            <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    'id',
                    [
                        'attribute'=>'docente',
                        'format' => 'raw',
                        'value' => function(\app\models\Reclamacion $model) {
                            return $model->docente->primer_nombre . ' '.  $model->docente->primer_apellido ;
                        }
                    ],
                    'descripcion:ntext',
                    [
                        'attribute'=>'procede',
                        'format' => 'raw',
                        'value' => function(\app\models\Reclamacion $model) {
                                return $model->procede ? 'Si' : 'No';
                        },
                        'filter' => [
                                1 => 'Si',
                                0 => 'No'
                        ]
                    ],
                    'fecha_creacion:date',

                    ['class' => 'yii\grid\ActionColumn'],
                ],
            ]); ?>
            <?php Pjax::end(); ?>
        </div>
    </div>
</div>
</div>