<?php

use yii\db\Migration;

/**
 * Class m190327_161057_esquema_inicial
 */
class m190327_161057_esquema_inicial extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('TipoDocumento', [
            'id' => $this->primaryKey()->comment('No.'),
            'nombre' => $this->string()->notNull()->unique()->comment('Nombre'),
            'descripcion' => $this->string()->notNull()->unique()->comment('Descripción'),
        ]);

        $this->createTable('TituloProfesional', [
            'id' => $this->primaryKey()->comment('No.'),
            'nombre' => $this->string()->notNull()->unique()->comment('Nombre'),
            'descripcion' => $this->string()->notNull()->unique()->comment('Descripción'),
        ]);

        $this->createTable('Documento', [
            'id' => $this->primaryKey()->comment('No.'),
            'nombre' => $this->string()->notNull()->comment('Nombre Documento'),
            'contenido' => $this->binary()->notNull()->comment('Contenido'),
            'tipo_documento_id' => $this->integer()->notNull()->comment('Tipo Documento'),
            'fecha_creacion' => $this->timestamp()->notNull()->defaultExpression('CURRENT_TIMESTAMP'),
        ]);

        $this->addForeignKey(
            'fk_documento_tipo',
            'Documento',
            'tipo_documento_id',
            'TipoDocumento',
            'id',
            'CASCADE',
            'CASCADE');

        $this->createTable('Docente', [
            'usuario_id' => $this->primaryKey()->comment('Usuario'),
            'primer_nombre' => $this->string()->notNull()->comment('Primer Nombre'),
            'segundo_nombre' => $this->string()->null()->comment('Segundo Nombre'),
            'primer_apellido' => $this->string()->notNull()->comment('Primer Apellido'),
            'segundo_apellido' => $this->string()->null()->comment('Segundo Apellido'),
            'cedula' => $this->string()->notNull()->comment('Cédula'),
            'telefono' => $this->string()->notNull()->comment('Teléfono'),
            'email' => $this->string()->notNull()->comment('Email'),
            'fecha_creacion' => $this->timestamp()->notNull()->defaultExpression('CURRENT_TIMESTAMP'),
        ]);

        $this->addForeignKey(
            'fk_docente_usuario',
            'docente',
            'usuario_id',
            'user',
            'id',
            'CASCADE',
            'CASCADE');

        $this->createTable('TituloDocente', [
            'id' => $this->primaryKey()->comment('No.'),
            'titulo_id' => $this->integer()->notNull()->comment('Titulo Profesional.'),
            'docente_id' => $this->integer()->notNull()->comment('Docente'),
        ]);

        $this->addForeignKey(
            'fk_tituloDocente_titulo',
            'TituloDocente',
            'titulo_id',
            'TituloProfesional',
            'id',
            'CASCADE',
            'CASCADE');

        $this->addForeignKey(
            'fk_tituloDocente_docente',
            'TituloDocente',
            'docente_id',
            'Docente',
            'usuario_id',
            'CASCADE',
            'CASCADE');

//        $this->addPrimaryKey('pk_TituloDocente', 'TituloDocente', ['titulo_id', 'docente_id']);

        $this->createTable('Postulacion', [
            'id' => $this->primaryKey()->comment('No.'),
            'docente_id' => $this->integer()->notNull()->comment('Docente'),
            'documento_id' => $this->integer()->notNull()->comment('Documento'),
            'puntuacion' => $this->double()->notNull()->defaultValue(0)->comment('Puntuación'),
            'fecha_creacion' => $this->timestamp()->notNull()->defaultExpression('CURRENT_TIMESTAMP'),
        ]);

        $this->addForeignKey(
            'fk_Postulacion_docente',
            'Postulacion',
            'docente_id',
            'docente',
            'usuario_id',
            'CASCADE',
            'CASCADE');

        $this->addForeignKey(
            'fk_Postulacion_documento',
            'Postulacion',
            'documento_id',
            'Documento',
            'id',
            'CASCADE',
            'CASCADE');

//        $this->addPrimaryKey('pk_Postulacion', 'Postulacion', ['documento_id', 'docente_id']);

        $this->createTable('Reclamacion', [
            'id' => $this->primaryKey()->comment('No.'),
            'docente_id' => $this->integer()->notNull()->comment('Docente'),
            'descripcion' => $this->text()->notNull()->comment('Contenido'),
            'procede' => $this->boolean()->defaultValue(false)->comment('Procede'),
            'fecha_creacion' => $this->timestamp()->notNull()->defaultExpression('CURRENT_TIMESTAMP'),
        ]);

        $this->addForeignKey(
            'fk_reclamacion_docente',
            'Reclamacion',
            'docente_id',
            'docente',
            'usuario_id',
            'CASCADE',
            'CASCADE');

        return true;

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('Postulacion');
        $this->dropTable('Reclamacion');
        $this->dropTable('TituloDocente');
        $this->dropTable('Docente');
        $this->dropTable('Documento');
        $this->dropTable('TituloProfesional');
        $this->dropTable('TipoDocumento');


        return true;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190327_161057_esquema_inicial cannot be reverted.\n";

        return false;
    }
    */
}
