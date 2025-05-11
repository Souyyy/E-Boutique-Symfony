<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Produit;
use App\Repository\ProduitRepository;
use App\Repository\CategorieRepository;
use App\Repository\AdresseClientRepository;

final class PanierController extends AbstractController
{
    #[Route('/panier/ajouter/{id}', name: 'ajouter_au_panier')]
    public function ajouter(Produit $produit, Request $request): Response
    {

        $panier = $request->getSession()->get('panier', []);
        $id = $produit->getId();

        $panier[$id] = ($panier[$id] ?? 0) + 1;

        $request->getSession()->set('panier', $panier);

        $this->addFlash('success', 'Produit ajouté au panier !');
            $referer = $request->headers->get('referer');
            return $this->redirect($referer ?? $this->generateUrl('app_boutique'));


    }

    #[Route('/panier/modifier/{id}', name: 'modifier_quantite_panier', methods: ['POST'])]
    public function modifierQuantite(Request $request, Produit $produit): Response
    {
        $quantite = (int) $request->request->get('quantite');
        $panier = $request->getSession()->get('panier', []);
        $id = $produit->getId();

        if ($quantite > 0) {
            $panier[$id] = $quantite;
        } else {
            unset($panier[$id]); // Supprimer si 0
        }

        $request->getSession()->set('panier', $panier);

        return $this->redirectToRoute('voir_panier');
    }

    #[Route('/panier', name: 'voir_panier')]
    public function voirPanier(ProduitRepository $repo, Request $request, CategorieRepository $categorieRepository, AdresseClientRepository $adresseRepository): Response
    {

        $categories = $categorieRepository->findAll();
        $panier = $request->getSession()->get('panier', []);
        $produits = [];
        $total = 0;

        foreach ($panier as $id => $quantite) {
            $produit = $repo->find($id);
            $produits[] = [
                'produit' => $produit,
                'quantite' => $quantite,
                'total' => $produit->getPriceTTC() * $quantite
            ];
            $total += $produit->getPriceTTC() * $quantite;
        }

        $adresses = [];
    if ($this->getUser()) {
        $adresses = $adresseRepository->findBy(['user' => $this->getUser()]);
    }


        return $this->render('panier/index.html.twig', [
            'produits' => $produits,
            'total' => $total,
            'categories' => $categories,
            'adresses' => $adresses,

        ]);
    }
}
