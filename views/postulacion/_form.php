<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\forms\PostulacionForm */
/* @var $form yii\widgets\ActiveForm */

$user = Yii::$app->user;
$identity = null;
$isHHRR = null;
$isAdmin = null;
if($user) {
    $isHHRR = Yii::$app->authManager->getAssignment('HHRR', $user->getId());
    $isAdmin = Yii::$app->authManager->getAssignment('Administrador', $user->getId());
    $identity = $user->identity;
}
?>

<!-- begin row -->
<div class="row">
    <!-- begin col-lg-12 -->
    <div class="col-lg-12">
        <!-- begin box -->
        <div class="box box-success">
            <div class="box-body">
                <div class="col-lg-6 col-md-6 col-xs-6">

                    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

                    <?php
                    echo $form->field($model->postulacion, 'id')
                        ->textInput([
                            'readonly'=>true,
                        ])
                        ->hiddenInput()
                        ->label(false);
                    ?>

                    <?php
                    if($isHHRR !== null || $isAdmin !== null) {

                        echo Html::label(
                            'Docente: ' . $model->docente->primer_apellido . ' ' . $model->docente->primer_apellido);

                        echo $form->field($model->postulacion, 'docente_id')
                            ->textInput([
                                'readonly'=>true,
                            ])
                            ->hiddenInput()
                            ->label(false);
                    }
                    else {
                        if($model->isNewRecord)
                            $model->docente_id = Yii::$app->user->getId();

                        echo $form->field($model->postulacion, 'docente_id')
                            ->hiddenInput()
                            ->label(false);
                    }

                    ?>

                    <?php
                    foreach ($model->documentos as $documento) {

                        $key = $documento->tipo_documento_id;
                        $nameKey = $documento->tipo_documento_id;
                        echo '<div class="form-group">';
                        echo Html::label($documento->tipoDocumento->nombre . " : ", 'documento');

                        if($isHHRR == null && $isAdmin == null) {
                            echo $form->field($model,
                                "ficheros[$key]")
                                ->fileInput([
                                    'multiple' => false,
                                    'id' => 'ficheros_' . $key,
//                                    'required'=> $documento->isNewRecord,
                                    'required'=> true,
                                    'disabled' => !$model->postulacion->estado,
                                    'value' => $documento->nombre
                                ])
                                ->label(false);
                        }

                        if(!$documento->isNewRecord)
                        {
                            echo Html::a('Descargar: ' . $documento->nombre,
                                \yii\helpers\Url::toRoute([$documento->contenido]),
                                ['target' => '_blank']);
                        }

                        echo '</div>';
                    }
                    ?>

                    <?php
                    $model->puntuacion = $model->isNewRecord  ? 0 : $model->puntuacion;
                    if($isHHRR !== null || $isAdmin !== null) { // es un docente

                        echo $form->field($model->postulacion, 'puntuacion')->textInput();
                    }
                    else {

                        echo $form->field($model->postulacion, 'puntuacion')
                            ->hiddenInput()
                            ->label(false);
                    }
                    ?>

                    <?php
                    if($isHHRR !== null || $isAdmin !== null) { // es un docente
//                        echo $form->field($model, 'procede')
//                            ->textInput();

                        echo $form->field($model->postulacion, 'estado')->widget(\kartik\widgets\SwitchInput::className(),[
                            'bsVersion' => '3.x',
                            'inlineLabel'=>false,
                            'pluginOptions'=>[
                                'size'=>'mini',
                                'onText'=>'Abierta',
                                'offText'=>'Cerrada',
                                'onColor'=>'success',
                                'offColor'=>'danger',
                            ],
                        ]);
                    }
                    else {
                        $model->estado = $model->isNewRecord  ? true : $model->estado;
                        echo $form->field($model->postulacion, 'estado')
                            ->checkbox()
                            ->hiddenInput()
                            ->label(false);
                    }
                    ?>

                    <div class="form-group">
                        <?= Html::submitButton('Guardar', ['class' => 'btn btn-success']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $this->registerJsFile('@web/js/postulacion/form.js', ['depends' => ['app\assets\AppAsset']]) ?>
