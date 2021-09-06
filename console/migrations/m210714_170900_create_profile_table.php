<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%profile}}`.
 */
class m210714_170900_create_profile_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%profile}}', [
            'id' => $this->primaryKey(),
            'first_name' => $this->string(50),
            'last_name' => $this->string(50),
            'patronymic' => $this->string(50),
            'state_id' => $this->integer()->notNull(),
            'province_id' => $this->integer()->notNull(),
            'region_id' => $this->integer()->notNull(),
            'address' => $this->text(),
            'phone_1' => $this->string(50),
            'phone_2' => $this->string(50)->null(),
            'date_birth' => $this->date(),
            'email' => $this->string(50),
            'gender_id' => $this->integer()->notNull(),
            'image' => $this->text(),
            'status' => $this->boolean(),
            'created_at' => $this->timestamp()->null(),
            'updated_at' => $this->timestamp()->null(),
            'diplom' => $this->string(255),
            'transkriptlar' => $this->string(255),
            'year_of_graduation' => $this->integer()->notNull(),
            'sertifikat' => $this->string(255)->null(), // chet tillari bo'yicha
            'pass_seria' => $this->string(10),
            'pass_num' => $this->string(50),
            'pass_file' => $this->string(200),
            'section_id'=> $this->integer(),
 ], $tableOptions);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%profile}}');
    }
}
