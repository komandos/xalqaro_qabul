<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%verification_token_column_to_admin}}`.
 */
class m210723_071346_create_verification_token_column_to_admin_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%admin}}', 'verification_token', $this->string()->defaultValue(null));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%verification_token_column_to_admin}}');
        $this->dropColumn('{{%admin}}', 'verification_token');

    }
}
