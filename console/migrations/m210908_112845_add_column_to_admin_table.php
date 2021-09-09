<?php

use yii\db\Migration;

/**
 * Handles adding columns to table `{{%admin}}`.
 */
class m210908_112845_add_column_to_admin_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('admin', 'role', $this->string(20)->notNull());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropColumn('admin', 'role');
    }
}
