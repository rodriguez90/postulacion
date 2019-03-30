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
                        $form->field($model, 'docente_id')->widget(
                            \kartik\select2\Select2::class,
                            [
                                'data' => \yii\helpers\ArrayHelper::map(\app\models\Docente::find()->all(), 'user_id', 'primer_nombre'),
                                'value' => $model->isNewRecord ? '' : $model->docente_id,
                                'options' => ['placeholder' => 'Seleccione el Docente.'],
                                'pluginOptions' => [
                                    'allowClear' => false
                                ],
                            ]
                        );
                    }
                    else {
                        $model->docente_id = Yii::$app->user->getId();
                        echo $form->field($model, 'docente_id')
//                        ->textInput(['readonly' => true,
//                            'value' => Yii::$app->user->getId()])
                        ->hiddenInput()
                        ->label(false);
                    }
                    ?>

                    <?= $form->field($model, 'descripcion')->textarea(['rows' => 6]) ?>

                    <?php
                    if($isHHRR !== null || $isAdmin !== null) {
                        echo $form->field($model, 'procede')
                            ->textInput();
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
