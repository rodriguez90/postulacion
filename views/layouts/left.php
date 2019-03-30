<?php

$items = [['label' => 'Menu',
    'options' => ['class' => 'header'],
    'items' =>[]
]];

$administracion = [
    'label' => 'Administración',
    'icon' => 'cogs',
    'url' => '#',
    'items' => []
];

$user = Yii::$app->user;

if($user == null) return;

$identity = $user->identity;

if($identity == null) return;


if(Yii::$app->authManager->checkAccess($user->getId(),'site/index') ||
    $identity->getIsAdmin())
{
    $items[]=['label' => 'Inicio', 'icon' => 'home', 'url' => ['/site/index']];
}

if(Yii::$app->authManager->checkAccess($user->getId(),'postulacion/index') ||
    $identity->getIsAdmin())
{
    $items[]=['label' => 'Postulaciones', 'icon' => 'user-plus', 'url' => ['/postulacion/index']];
}

if(Yii::$app->authManager->checkAccess($user->getId(),'reclamacion/index') ||
    $identity->getIsAdmin())
{
    $items[]=['label' => 'Reclamaciones', 'icon' => 'question', 'url' => ['/reclamacion/index']];
}

if($identity->getIsAdmin())
{
    if(Yii::$app->authManager->checkAccess($user->getId(),'tipo-documento/index') ||
        $identity->getIsAdmin())
    {
        $administracion['items'][]=['label' => 'Tipos de Documento', 'icon' => 'file-pdf-o', 'url' => ['/tipo-documento/index']];
    }

    if(Yii::$app->authManager->checkAccess($user->getId(),'titulo-profesional/index') ||
        $identity->getIsAdmin())
    {
        $administracion['items'][]=['label' => 'Títulos', 'icon' => 'graduation-cap', 'url' => ['/titulo-profesional/index']];
    }

    if(Yii::$app->authManager->checkAccess($user->getId(),'docente/index') ||
        $identity->getIsAdmin())
    {
        $administracion['items'][]=['label' => 'Docentes', 'icon' => 'users', 'url' => ['/docente/index']];
    }

    if(Yii::$app->authManager->getAssignment('Administrador',$user->getId()) ||
        ($identity != null && $identity->getIsAdmin()))
    {
        $administracion['items'][]=['label' => 'Usuarios & Permisos', 'icon' => 'wrench', 'url' => ['/user/admin/index']];
    }

    $items[]= $administracion;
}

?>
<aside class="main-sidebar">

    <section class="sidebar">

        <?= dmstr\widgets\Menu::widget(
            [
                'options' => ['class' => 'sidebar-menu tree', 'data-widget'=> 'tree'],
                'items' => $items
            ]
        ) ?>

    </section>

</aside>
