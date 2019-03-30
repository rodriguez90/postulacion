<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Reclamacion */
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

                    <?php $form = ActiveForm::begin(); ?>


                    <?php
                    if($isHHRR !== null || $isAdmin !== null) {

                        echo Html::label(
                            'Docente: ' . $model->docente->primer_apellido . ' ' . $model->docente->primer_apellido);

                        echo $form->field($model, 'docente_id')
                            ->textInput([
                                'readonly'=>true,
                                'value' => $model->docente->primer_apellido . ' ' . $model->docente->primer_apellido
                            ])
                            ->hiddenInput()
                            ->label(false);

//                        echo $form->field($model, 'docente_id')->widget(
//                            \kartik\select2\Select2::class,
//                            [
//                                'data' => \yii\helpers\ArrayHelper::map(\app\models\Docente::find()->all(), 'usuario_id', 'primer_nombre'),
//                                'value' => $model->isNewRecord ? '' : $model->docente_id,
//                                'disabled' => $model->isNewRecord ? false : true,
//                                'options' => [
//                                    'placeholder' => 'Seleccione el Docente.',
//                                ],
//                                'pluginOptions' => [
//                                    'allowClear' => false
//                                ],
//                            ]
//                        );
                    }
                    else {
                        if($model->isNewRecord)
                            $model->docente_id = Yii::$app->user->getId();

                        echo $form->field($model, 'docente_id')
                            ->hiddenInput()
                            ->label(false);
                    }
                    ?>

                    <?php
                    echo $form->field($model, 'descripcion')
                        ->textarea([
                            'rows' => 6,
                            'readonly'=> $isHHRR !== null  || $isAdmin !== null,
                            'disabled'=> $isHHRR !== null  || $isAdmin !== null
                        ])
                    ?>

                    <?php
                    if($isHHRR !== null || $isAdmin !== null) { // es un docente
//                        echo $form->field($model, 'procede')
//                            ->textInput();

                        echo $form->field($model, 'procede')->widget(\kartik\widgets\SwitchInput::className(),[
                            'bsVersion' => '3.x',
                            'inlineLabel'=>false,
                            'pluginOptions'=>[
                                'size'=>'mini',
                                'onText'=>'Procede',
                                'offText'=>'No Procede',
                                'onColor'=>'success',
                                'offColor'=>'danger',
                            ],
                        ]);
                    }
                    else {
                        $model->procede = $model->isNewRecord  ? false : $model->procede;
                        echo $form->field($model, 'procede')
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
