<?php

use yii\db\Migration;

/**
 * Class m220721_073847_alter_turkman_profile_table
 */
class m220721_073847_alter_turkman_profile_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->alterColumn('{{%turkman_profile}}', 'created_at', $this->integer()->null());
        $this->alterColumn('{{%turkman_profile}}', 'updated_at', $this->integer()->null());
        $this->alterColumn('{{%turkman_profile}}', 'date_birth', $this->integer()->null());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m220721_073847_alter_turkman_profile_table cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m220721_073847_alter_turkman_profile_table cannot be reverted.\n";

        return false;
    }
    */
}
