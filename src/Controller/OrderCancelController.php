<?php

namespace App\Controller;

use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderCancelController extends AbstractController
{

    private $em;

    public function __construct(EntityManagerInterface $entityManager){
        $this->em = $entityManager;
    }

    
    /**
     * @Route("/commande/erreur/{stripSessionId}", name="order_cancel")
     */
    public function index($stripSessionId): Response
    {
        $order = $this->em->getRepository(Order::class)->findOneByStripSessionId($stripSessionId);

        if(!$order || $order->getUser() != $this->getUser()){
            return $this->redirectToRoute('home');
        }


        //envoyer un email à l'utilisateur pour lui indiquer l'echec du paiement


        
        return $this->render('order_cancel/index.html.twig', [
            'order' => $order
        ]);
    }
}
