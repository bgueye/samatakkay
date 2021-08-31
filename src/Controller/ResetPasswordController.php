<?php

namespace App\Controller;

use App\Entity\User;
use App\Classes\Mail;
use DateTimeImmutable;
use App\Entity\ResetPassword;
use App\Form\ResetPasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class ResetPasswordController extends AbstractController
{
    private $em;

    public function __construct(EntityManagerInterface $entityManager){
        $this->em = $entityManager;
    }

    
    /**
     * @Route("/reset/mot-de-passe-oublie", name="reset_password")
     */
    public function index(Request $request): Response
    {

        if($this->getUser()){
            return $this->redirectToRoute('home');
        }

        if($request->get('email')){
            $user = $this->em->getRepository(User::class)->findOneByEmail($request->get('email'));
            
            if($user){
                //Enregistrer en base la demande de reset_password avec user, token et createdAt
                $reset_password = new ResetPassword();
                $reset_password->setUser($user);
                $reset_password->setToken(uniqid());
                $reset_password->setCreatedAt(new DateTimeImmutable());
                $this->em->persist($reset_password);
                $this->em->flush();

                //Envoyer le mail avec le lien pour mettre à jour le mot de passe
                $url= $this->generateUrl('update_password', [
                    'token' => $reset_password->getToken()
                ]);

                $content = "Bonjour ".$user->getFirstname()."<br/><br/>Vous avez demandé de réinitialiser votre mot de passe sur samatakkay, la boutique des bijoux fantaisies.<br/>";
                $content .="Merci de bien vouloir cliquer sur le lien suivant pour <a href='".$url."'>mettre à jour votre mot de passe</a>. <br/>";
                
                $mail = new Mail();
                $mail->send($user->getEmail(), $user->getFirstname()." ".$user->getLastname(), "Réinitialisez votre mot de passe sur samatakkay", $content);

                $this->addFlash('notice', 'Vous allez recevoir dans quelques secondes un mail avec la procedure pour réinitialiser votre mot de passe.');
            }else{
                $this->addFlash('notice', 'Cette adresse email est inconnue.');
                return $this->redirectToRoute('reset_password');
            }
        }


        return $this->render('reset_password/index.html.twig');
    }

    /**
     * @Route("/modifier-mon-mot-de-passe/{token}", name="update_password")
     */
    public function update(Request $request, UserPasswordHasherInterface $encoder, $token): Response
    {
        $reset_password = $this->em->getRepository(ResetPassword::class)->findOneByToken($token);

        if(!$reset_password){
            return $this->redirectToRoute('reset_password');
        }

        //Vérifier si le ceatedAt = now -24H
        $now = new DateTimeImmutable();
        if($now > $reset_password->getCreatedAt()->modify('+1 days')){
            $this->addFlash('notice', 'Votre demande de réinitialisation de mot de passe à expirée. Merci de la renouveler.');
            return $this->redirectToRoute('reset_password');
        }

        //Rendre une vue avec mot de passe et confirmer votre mot de passe.
        $form = $this->createForm(ResetPasswordType::class);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isvalid()){
            $new_pwd = $form->get('new_password')->getData();

            if (preg_match('#^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!*$@%_])([-+!*$@%_\w]{8,15})$#', $new_pwd)) {
                
                //encodage du mot de passe
                $password = $encoder->hashPassword($reset_password->getUser(), $new_pwd);
                //enregistrement en base de données
                $reset_password->getUser()->setPassword($password);
                    $this->em->flush();
                //Redirection ver la page de connexion
                $this->addFlash('notice', 'Votre mot de passe à bien été mis à jour.');
                return $this->redirectToRoute('app_login');
            }
            else{
                $this->addFlash('notice', 'Votre mot de passe n\'est pas conforme au format requis.');
            }
        }
        return $this->render('reset_password/update.html.twig', [
            'form' => $form->createView()
        ]);
        

    }
}
