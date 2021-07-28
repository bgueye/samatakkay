<?php

namespace App\Controller;

use App\Classes\Cart;
use App\Classes\Mail;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderSuccessController extends AbstractController
{

    private $em;

    public function __construct(EntityManagerInterface $entityManager){
        $this->em = $entityManager;
    }


    /**
     * @Route("/commande/merci/{stripSessionId}", name="order_validate")
     */
    public function index(Cart $cart, $stripSessionId): Response
    {
        $order = $this->em->getRepository(Order::class)->findOneByStripSessionId($stripSessionId);

        if(!$order || $order->getUser() != $this->getUser()){
            return $this->redirectToRoute('home');
        }

        
        if(!$order->getIsPaid()){
        //vider la session "cart"
        $cart->remove();
        // modifier le statut ispaid de la commande à 1 
        $order->setIsPaid(1);
        $this->em->flush();
        //Envoyer un mail au client pour lui confirmer sa commande
        $mail = new Mail();
        $content = "Bonjour ".$order->getUser()->getFirstname().",<br/>Merci pour votre commande sur la boutique des bijoux fantaisies.<b/><b/>Votre commande est en traitement vous serez informé(e) par mail dès son expédition.";
        $mail->send($order->getUser()->getEmail(), $order->getUser()->getFirstname(), "Votre commande samatakkay, la boutique des bijoux fantaisie est bien validée", $content);

        }
        
        //Afficher quelques informations de la commande
        return $this->render('order_success/index.html.twig', [
            'order' => $order
        ]);
    }
}
