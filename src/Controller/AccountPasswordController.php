<?php

namespace App\Controller;

use App\Form\ChangePasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Notifier\Notification\Notification;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AccountPasswordController extends AbstractController
{
    private $em;

    public function __construct(EntityManagerInterface $entityManager){
        $this->em = $entityManager;
    }    


    /**
     * @Route("/compte/modifier-mot-de-passe", name="account_password")
     */
    public function index(Request $request, UserPasswordHasherInterface $encoder): Response
    {
        $notification = null;
        $user = $this->getUser();

        $form = $this->createForm(ChangePasswordType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $old_pwd = $form->get('odl_password')->getData();
            
            if ($encoder->isPasswordValid($user, $old_pwd)){
                $new_pwd = $form->get('new_password')->getData();

                if (preg_match('#^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!*$@%_])([-+!*$@%_\w]{8,15})$#', $new_pwd)) {
                    $password = $encoder->hashPassword($user, $new_pwd);
                    $user->setPassword($password);
                    $this->em->flush(); 
                    $notification= 'Votre mot de passe a été mis à jour !';
                }else{
                    $notification = "Votre nouveau mot de passe n'est pas conforme au format requis.";
                }               
            }else{
                $notification= "Votre mot de passe actuel n'est pas le bon !";               
            }
        }

        return $this->render('account/password.html.twig', [
            'form' => $form->createView(),
            'notification' => $notification
        ]);
    }
}
