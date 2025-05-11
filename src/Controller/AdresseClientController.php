<?php

// src/Controller/AdresseClientController.php

namespace App\Controller;

use App\Repository\CategorieRepository;
use App\Entity\AdresseClient;
use App\Form\AdresseClientTypeForm;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class AdresseClientController extends AbstractController
{

    
    #[Route('/user/adresse', name: 'app_user_adresse')]
    #[IsGranted('ROLE_USER')]
    public function index(Request $request, EntityManagerInterface $entityManager, CategorieRepository $categorieRepository): Response
    {
        
        // Récupérer les catégories depuis la base de données
        $categories = $categorieRepository->findAll();
        $user = $this->getUser();

        // Récupérer l'adresse existante s'il y en a une
    $adresseClient = $user->getAdresseClients()->first() ?: new AdresseClient();

    // Si c’est une nouvelle adresse, on associe l’utilisateur
    if ($adresseClient->getId() === null) {
        $adresseClient->setUser($user);
    }
        // Formulaire pour gérer l'adresse de l'utilisateur
        $formAdresse = $this->createForm(AdresseClientTypeForm::class, $adresseClient);
        $formAdresse->handleRequest($request);

        if ($formAdresse->isSubmitted() && $formAdresse->isValid()) {
            $entityManager->persist($adresseClient);
            $entityManager->flush();
            $this->addFlash('success', 'Votre adresse a été ajoutée.');
        }

        return $this->render('adresse_client/index.html.twig', [
            'formAdresse' => $formAdresse->createView(),
            'categories' => $categories,
        ]);
    }
}
