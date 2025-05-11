<?php
// src/Controller/CategorieController.php

namespace App\Controller;

use App\Entity\Categorie;
use App\Form\CategorieForm;
use App\Repository\CategorieRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use App\Repository\ProduitRepository;

#[Route('/categorie')]
final class CategorieController extends AbstractController
{

    // Modification de la route pour accepter 'name' comme paramètre
    #[Route('/{name}', name: 'app_categorie_show', methods: ['GET'])]
    public function show(string $name, ProduitRepository $produitRepository, CategorieRepository $categorieRepository): Response
    {
        // Recherche de la catégorie par son nom
        $categorie = $categorieRepository->findOneBy(['name' => $name]);

        // Si la catégorie n'existe pas
        if (!$categorie) {
            throw $this->createNotFoundException('Catégorie introuvable');
        }

        $categories = $categorieRepository->findAll();  // Passer les catégories ici aussi

        // Récupérer les produits associés à cette catégorie
        $produits = $produitRepository->findBy(['categorie' => $categorie]);

        return $this->render('categorie/show.html.twig', [
            'categorie' => $categorie,
            'categories' => $categories,
            'produits' => $produits,  // Les produits de la catégorie

        ]);
    }
}
