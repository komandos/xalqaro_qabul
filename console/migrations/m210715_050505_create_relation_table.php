<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%relation}}`.
 */
class m210715_050505_create_relation_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createIndex('profile_index_1','{{%profile}}','section_id');
        $this->createIndex('profile_index_2','{{%profile}}','province_id');
        $this->createIndex('profile_index_3','{{%profile}}','region_id');
        $this->createIndex('profile_index_5','{{%profile}}','gender_id');
        $this->createIndex('province_index_1','{{%province}}','state_id');
        $this->createIndex('region_index_1','{{%regions}}','province_id');

        $this->addForeignKey('profile_fk_1', '{{%profile}}', 'section_id', '{{%province}}', 'id', 'cascade','cascade');
        $this->addForeignKey('profile_fk_2', '{{%profile}}', 'province_id', '{{%province}}', 'id', 'cascade','cascade');
        $this->addForeignKey('profile_fk_3', '{{%profile}}', 'region_id', '{{%regions}}', 'id', 'cascade','cascade');
        $this->addForeignKey('profile_fk_5', '{{%profile}}', 'gender_id', '{{%gender}}', 'id', 'cascade','cascade');
        $this->addForeignKey('province_fk_1', '{{%province}}', 'state_id', '{{%state}}', 'id', 'cascade','cascade');
        $this->addForeignKey('region_fk_1', '{{%regions}}', 'province_id', '{{%province}}', 'id', 'cascade','cascade');

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropForeignKey('profile_fk_1', '{{%profile}}');
        $this->dropForeignKey('profile_fk_2', '{{%profile}}');
        $this->dropForeignKey('profile_fk_3', '{{%profile}}');
        $this->dropForeignKey('profile_fk_5', '{{%profile}}');
        $this->dropForeignKey('province_fk_1', '{{%province}}');
        $this->dropForeignKey('region_fk_1', '{{%regions}}');
        $this->dropIndex('profile_index_2', '{{%profile}}');
        $this->dropIndex('profile_index_3', '{{%profile}}');
        $this->dropIndex('profile_index_5', '{{%profile}}');
        $this->dropIndex('province_index_1', '{{%province}}');
        $this->dropIndex('region_index_11', '{{%regions}}');
        $this->dropTable('{{%relation}}');
    }
}
