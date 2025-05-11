<?php

namespace App\Controller;

use App\Entity\Commande;
use App\Entity\CommandLine;
use App\Entity\Produit;
use App\Repository\CategorieRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;


#[Route('/user/commandes')]
class CommandeController extends AbstractController
{
    #[Route('/', name: 'app_commander')]
    public function index(CategorieRepository $categorieRepository): Response
    {
        $user = $this->getUser();
        // Récupérer les catégories depuis la base de données
        $categories = $categorieRepository->findAll();



        if (!$user) {
            return $this->redirectToRoute('app_login');
        }

        return $this->render('commande/index.html.twig', [
            'commandes' => $user->getCommandes(),
            'categories' => $categories,
        ]);
    }

    #[Route('/valider', name: 'valider_commande', methods: ['POST'])]
    #[IsGranted('ROLE_USER')]
    public function valider(Request $request, EntityManagerInterface $em): Response
    {
        $user = $this->getUser();

        // Vérifie que l'utilisateur a une adresse
        if (count($user->getAdresseClients()) === 0) {
            $this->addFlash('warning', 'Vous devez ajouter une adresse avant de commander.');
            return $this->redirectToRoute('app_adresse_client_new'); // ou une autre route pour ajouter une adresse
        }

        $panier = $request->getSession()->get('panier', []);
        if (empty($panier)) {
            $this->addFlash('warning', 'Votre panier est vide.');
            return $this->redirectToRoute('voir_panier');
        }

        // Création de la commande
        $commande = new Commande();
        $commande->setUser($user);
        $commande->setDateTime(new \DateTime());
        $commande->setValid(true);
        $commande->setOrderNumber(random_int(100000, 999999));

        foreach ($panier as $produitId => $quantity) {
            $produit = $em->getRepository(Produit::class)->find($produitId);
            if ($produit) {
                $ligne = new CommandLine();
                $ligne->setProduit($produit);
                $ligne->setQuantity($quantity);
                $ligne->setCommande($commande);
                $em->persist($ligne);
            }
        }

        $em->persist($commande);
        $em->flush();

        // Vider le panier
        $request->getSession()->remove('panier');

        return $this->redirectToRoute('app_commander');
    }
}
