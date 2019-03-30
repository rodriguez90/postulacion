<?php
/**
 * Created by PhpStorm.
 * User: pedro
 * Date: 15/11/2018
 * Time: 11:09
 */

namespace app\rbac;
use app\models\Postulacion;
use yii\rbac\Item;
use yii\rbac\Rule;
use app\models\Payment;


class PostulacionRule extends Rule
{
    public $name = 'isDocente';

    public function execute($user, $item, $params)
    {
        $result = false;
        // TODO: Implement execute() method.
        var_dump('in rule');
//        var_dump($user);
//        var_dump($params);

        if(\Yii::$app->authManager->getAssignment('admin', $user)
            || \Yii::$app->authManager->getAssignment('Administrador', $user))
        {
                $result = true;
        }
		else if( isset($params['postulaciones']))
        {
            $result = true;
            foreach ($params['postulaciones'] as $postulacionId )
            {
                $postulacion = Postulacion::findOne(['id'=>$postulacionId]);
                if($postulacion->docente_id !== $user)
                {
                    $result = false;
                    break;
                }
            }
        }

//        var_dump($result);die;
        return $result;
    }
}