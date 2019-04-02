<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use \kartik\export\ExportMenu;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PostulacionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Postulaciones';
$this->params['breadcrumbs'][] = $this->title;

$gridColumns = [
    ['class' => 'yii\grid\SerialColumn'],

    'id',
    [
        'attribute' => 'docente',
        'value' => function($model) {
            return $model->docente->primer_nombre . ' ' . $model->docente->segundo_apellido;
        }
    ],
    'puntuacion',
    [
        'attribute' => 'fecha_creacion',
        'format' => 'date',
        'filter' =>  \kartik\date\DatePicker::widget([
            'model' => $searchModel,
            'attribute'=>'fecha_creacion',
            'pluginOptions' => [
                'format' => 'dd-mm-yyyy',
                'autoclose'=>true,
                'todayHighlight' => true
            ]
        ]),
    ],

    ['class' => 'yii\grid\ActionColumn'],
];

?>

<div class="row">
    <div class="col-md-12">
        <div class="box box-info">
            <div class="box-header">
                <p>
                    <?= Html::a('Nueva Postulación', ['create'], ['class' => 'btn btn-success']) ?>
                </p>
            </div>

            <div class="box-body">
                <?php Pjax::begin(); ?>
                <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

                <?php
                echo \kartik\export\ExportMenu::widget([
                    'moduleId'=>'gridView',
                    'dataProvider' => $dataProvider,
                    'columns' => $gridColumns,
//                    'exportConfig' => [
//                        ExportMenu::FORMAT_TEXT => true,
//                        ExportMenu::FORMAT_PDF => false,
//                        ExportMenu::FORMAT_EXCEL => true,
//                        ExportMenu::FORMAT_HTML => true,
//                    ]

                ]);
                ?>

                <?= \kartik\grid\GridView::widget([
                    'moduleId'=>'gridView',
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'toolbar' => [
                            '{export}',
                            '{toggleData}'
                    ],
                    'columns' => $gridColumns,
                ]); ?>
                <?php Pjax::end(); ?>
            </div>
        </div>
    </div>
</div>
