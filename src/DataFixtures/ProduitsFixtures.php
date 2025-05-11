<?php
namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;
use App\Entity\Produit;
use App\Entity\Categorie;

class ProduitsFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create('fr_FR');

        // Créer des catégories factices
        $categories = ['Champagne', 'Vins', 'Bieres', 'Rhums'];
        $produitsParCategorie = 10;

        foreach ($categories as $categorieName) {
            $categorie = new Categorie();
            $categorie->setName($categorieName);
            $categorie->setDescription($faker->sentence(15));  // Génère une description en français
            $manager->persist($categorie);
            

            // Générer des produits pour chaque catégorie
            for ($i = 0; $i < $produitsParCategorie; $i++) {
                $produit = new Produit();
                $produit->setName($faker->word());
                $produit->setDescription($faker->sentence(15));  // Génère une description en français
                $produit->setPriceHt($faker->numberBetween(1, 5000));
                $produit->setAvailable($faker->boolean());
                $produit->setCategorie($categorie);
                $manager->persist($produit);
            }
        }

        // Persist toutes les catégories et produits dans la base de données
        $manager->flush();
    }
}
