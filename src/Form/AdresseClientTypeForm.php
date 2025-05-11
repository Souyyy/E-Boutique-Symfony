<?php

namespace App\Form;

use App\Entity\AdresseClient;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class AdresseClientTypeForm extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('type', TextType::class, [
                'label' => 'Nom de votre adresse',
            ])
            ->add('name', TextType::class, [
                'label' => 'Nom',
            ])
            ->add('firstName', TextType::class, [
                'label' => 'Prénom',
            ])
            ->add('phone', TextType::class, [
                'label' => 'Téléphone',
            ])
            ->add('address', TextType::class, [
                'label' => 'Adresse',
            ])
            ->add('cp', IntegerType::class, [
                'label' => 'Code postale',
            ])
            ->add('city', TextType::class, [
                'label' => 'Ville',
                'invalid_message' => 'Veuillez entrer un nombre entier.',
            ])
            ->add('country', TextType::class, [
                'label' => 'Pays',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => AdresseClient::class,
        ]);
    }
}
