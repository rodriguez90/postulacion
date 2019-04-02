<?php

use yii\db\Migration;

/**
 * Class m190331_102229_alter_table_postulacion_documento
 */
class m190331_102229_alter_table_postulacion_documento extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {

        $this->dropForeignKey('fk_Postulacion_documento', 'postulacion');

        $this->dropColumn('postulacion', 'documento_id');

        $this->addColumn('documento', 'postulacion_id', $this->integer()->notNull());

        $this->addForeignKey(
            'fk_documento_postulacion',
            'documento',
            'postulacion_id',
            'postulacion',
            'id',
            'CASCADE',
            'CASCADE');

        $this->alterColumn('documento', 'contenido', $this->binary()->null()->comment('Contenido'));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190331_102229_alter_table_postulacion_documento cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190331_102229_alter_table_postulacion_documento cannot be reverted.\n";

        return false;
    }
    */
}
