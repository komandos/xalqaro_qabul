<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%section}}`.
 */
class m210906_103839_create_section_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%section}}', [
            'id' => $this->primaryKey(),
            'code' =>$this->string(150),
            'direction' =>$this->string(255),
            'university' => $this->string(255),
            'quota'=> $this->integer(),
            'form_education' => $this->string(100),
            'edu_lang' => $this->string(100),
            'duration' => $this->string(100),
            'created_at' => $this->integer(),
            'updated_at' => $this->integer(),
        ]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%section}}');
    }
}
