<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250510225059 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE categorie CHANGE description description LONGTEXT NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX UNIQ_6EEAA67D1AD5CDBF ON commande
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE commande DROP cart_id
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE produit CHANGE description description LONGTEXT NOT NULL
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE produit CHANGE description description TEXT NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE categorie CHANGE description description TEXT NOT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE commande ADD cart_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            CREATE UNIQUE INDEX UNIQ_6EEAA67D1AD5CDBF ON commande (cart_id)
        SQL);
    }
}
