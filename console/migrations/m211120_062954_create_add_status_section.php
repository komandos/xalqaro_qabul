<?php

use yii\db\Migration;

/**
 * Class m211120_062954_create_add_status_section
 */
class m211120_062954_create_add_status_section extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('section','status',$this->integer());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m211120_062954_create_add_status_section cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m211120_062954_create_add_status_section cannot be reverted.\n";

        return false;
    }
    */
}
