<?php

namespace App\Controller;

use App\Entity\User;
use App\Classes\Mail;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class RegisterController extends AbstractController
{
    private $em;

    public function __construct(EntityManagerInterface $entityManager){
        $this->em = $entityManager;
    }



    /**
     * @Route("/inscription", name="register")
     */
    public function index(Request $request, UserPasswordHasherInterface $encoder): Response
    {

        $notification = null;
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){

            $user = $form->getData();

            $search_email = $this->em->getRepository(User::class)->findOneByEmail($user->getEmail());

            if(!$search_email){
                //Vérifier la conformité du mot de passe
                $pwd = $user->getPassword();
                if (preg_match('#^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!*$@%_])([-+!*$@%_\w]{8,15})$#', $pwd)) {
                    
                    $password = $encoder->hashPassword($user, $user->getPassword());
                    $user->setPassword($password);

                    $this->em->persist($user);
                    $this->em->flush();

                    $mail = new Mail();
                    $content = "Bonjour ".$user->getFirstname().",<br/>Bienvenue sur samatakkay, la boutique des bijoux fantaisies.<b/><b/>Votre inscriptions'est correctement déroulée. Vous pouvez dès à présent vous connecter à votre compte.";
                    $mail->send($user->getEmail(), $user->getFirstname(), "Bienvenue sur samatakkay, la boutique des bijoux fantaisie", $content);

                    $notification ="Votre inscription s'est correctement déroulée. Vous pouvez dès à présent vous connecter à votre compte.";
                }else{
                    $notification = "Votre mot de passe n'est pas conforme au format requis.";
                }
            }else{
                $notification ="L'email que vous avez renseigné existe déjà.";
            }
            

        }

        return $this->render('register/index.html.twig',[
            'form' => $form->createView(),
            'notification' => $notification
        ]);
    }
}
