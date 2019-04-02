<?php

use yii\db\Migration;

/**
 * Class m190402_084458_alter_table_postulacion
 */
class m190402_084458_alter_table_postulacion extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('postulacion', 'estado', $this->boolean()->defaultValue(true)->comment('Estado'));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {

        return true;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190402_084458_alter_table_postulacion cannot be reverted.\n";

        return false;
    }
    */
}
