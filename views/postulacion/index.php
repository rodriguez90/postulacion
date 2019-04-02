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
    [
        'attribute' => 'id',
        'width'=>'10%',
    ],
    [
        'attribute' => 'docente',
        'width'=>'35%',
        'value' => function($model) {
            return $model->docente->primer_nombre . ' ' . $model->docente->segundo_apellido;
        }
    ],
    [
        'attribute' => 'puntuacion',
        'width'=>'25%',
    ],
    [
        'attribute' => 'fecha_creacion',
        'width'=>'25%',
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
                    'exportConfig' => [
                        ExportMenu::FORMAT_TEXT => false,
                        ExportMenu::FORMAT_HTML => false,
                        ExportMenu::FORMAT_EXCEL => false,
                        ExportMenu::FORMAT_PDF => [
                            'pdfConfig' => [
                                'methods' => [
                                    'SetTitle' => 'Postulaciones',
                                    'SetSubject' => 'Generating PDF files via yii2-export extension has never been easy',
                                    'SetHeader' => ['Postulaciones|| Fecha: ' . date("d-m-Y")],
                                    'SetFooter' => ['|Página {PAGENO}|'],
                                ]
                            ]
                        ],
                    ],

                ])  . "<hr>\n" .


                \kartik\grid\GridView::widget([
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
