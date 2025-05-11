<?php

namespace App\Controller;

use App\Repository\CategorieRepository;
use App\Form\UserProfilFormTypeForm;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;


final class UserProfilController extends AbstractController
{
    #[Route('/user/profil', name: 'app_user_profil')]
    #[IsGranted('ROLE_USER')]
    public function index(Request $request, EntityManagerInterface $entityManager, CategorieRepository $categorieRepository): Response
    {

        // Récupère les catégories depuis la base de données
        $categories = $categorieRepository->findAll();

        $user = $this->getUser();
        $form = $this->createForm(UserProfilFormTypeForm::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success', 'Votre profil a été mis à jour.');
            return $this->redirectToRoute('app_user_profil');
        }

        return $this->render('user_profil/index.html.twig', [
            'formProfil' => $form->createView(),
            'categories' => $categories,
        ]);
    }

    
}
