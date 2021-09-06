<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%departments}}`.
 */
class m210824_082907_create_departments_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }
        $this->createTable('{{%departments}}', [
            'id' => $this->primaryKey(),
            'code' => $this->string(64),
            'name' => $this->string(256),
            'structure_type' => $this->integer(),
            'parent' => $this->integer(),
            'position' => $this->integer(),
            'status' => $this->boolean(),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
            'created_by' => $this->integer(),
            'updated_by' => $this->integer(),
        ], $tableOptions);

        $this->createIndex('departments_index_1', '{{%departments}}', 'parent');
        $this->createIndex('departments_index_2', '{{%departments}}', 'created_by');
        $this->createIndex('departments_index_3', '{{%departments}}', 'updated_by');

        $this->addForeignKey('departments_fk_1', '{{%departments}}', 'parent', '{{%departments}}', 'id', 'cascade', 'cascade');
        $this->addForeignKey('departments_fk_2', '{{%departments}}', 'created_by', '{{%admin}}', 'id', 'cascade', 'cascade');
        $this->addForeignKey('departments_fk_3', '{{%departments}}', 'updated_by', '{{%admin}}', 'id', 'cascade', 'cascade');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%departments}}');
    }
}
