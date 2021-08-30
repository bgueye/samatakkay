<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class ChangePasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('firstname', TextType::class,[
                'label' => 'Prénom',
                'disabled' => true
            ])
            ->add('lastname', TextType::class,[
                'label' => 'Nom',
                'disabled' => true
            ])
            ->add('email', EmailType::class, [
                'label' => 'Adresse email',
                'disabled' => true
            ])
            ->add('odl_password', PasswordType::class, [
                'mapped' => false,
                'label' => 'Mot de passe actuel',
                'attr' => [
                    'placeholder' => 'Saisir votre mot de passe actuel'
                ]
            ])
            ->add('new_password', RepeatedType::class, [ 
                'mapped' => false,
                'type' => PasswordType::class,
                'invalid_message' => 'Le mot de passe et la confirmation doivent être identique.',
                'label' => 'Nouveau mot de passe',
                'required' => true,
                'first_options' => [
                    'label' => 'Nouveau mot de passe',
                    'attr' => [
                        'placeholder' => 'Saisir votre nouveau mot de passe',
                        'pattern' => "^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!*$@%_])([-+!*$@%_\w]{8,15})$"
                    ]
                ],
                'second_options' => [
                    'label' => 'Confirmez votre nouveau mot de passe',
                    'attr' => ['placeholder' => 'Confirmez votre nouveau mot de passe']
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Mettre à jour',
                'attr' => [
                    'class' => 'btn btn-block'
                ]
            ])                        
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
