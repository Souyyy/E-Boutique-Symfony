<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Form\ProduitForm;
use App\Repository\ProduitRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\CategorieRepository;


#[Route('/produit')]
final class ProduitController extends AbstractController
{
    #[Route('/{id}', name: 'app_produit_show', methods: ['GET'])]
    public function show(Produit $produit, CategorieRepository $categorieRepository): Response
    {
        $categories = $categorieRepository->findAll();

        return $this->render('produit/show.html.twig', [
            'produit' => $produit,
            'categories' => $categories,
        ]);
    }

}