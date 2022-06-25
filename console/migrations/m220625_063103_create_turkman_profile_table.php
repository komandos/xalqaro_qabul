<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%turkman_profile}}`.
 */
class m220625_063103_create_turkman_profile_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%turkman_profile}}', ['id' => $this->primaryKey(),
            'first_name' => $this->string(50),
            'last_name' => $this->string(50),
            'patronymic' => $this->string(50),
            'state_id' => $this->integer()->notNull(),
            'province_id' => $this->string(255)->notNull(),
            'region_id' => $this->string(255)->notNull(),
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
            'section_id' => $this->integer(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%turkman_profile}}');
    }
}
