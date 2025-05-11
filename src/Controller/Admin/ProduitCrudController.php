<?php

namespace App\Controller\Admin;

use App\Entity\Produit;
use Doctrine\DBAL\Types\IntegerType;
use Dom\Text;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;

class ProduitCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Produit::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('name', 'Nom'),
            TextEditorField::new('description'),
            AssociationField::new('categorie')->setRequired(true),
            IntegerField::new('price_ht', 'Prix HT (€)'),
            IntegerField::new('priceTTC', 'Prix TTC (€)')->hideOnForm(),
            BooleanField::new('available', 'Actif')
        ];
    }
    
}
