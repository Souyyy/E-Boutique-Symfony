<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\CategorieRepository;
use App\Repository\ProduitRepository;
use App\Repository\PanierRepository;
use App\Repository\BoutiqueRepository;
use App\Repository\HomeRepository;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(CategorieRepository $categorieRepository, ProduitRepository $produitRepository): Response
    {
        $categories = $categorieRepository->findAll();
        $produits = $produitRepository->findAll();

        return $this->render('home/index.html.twig', [
            'categories' => $categories,
            'produits' => $produits,
            'controller_name' => 'HomeController',
        ]);
    }
}
