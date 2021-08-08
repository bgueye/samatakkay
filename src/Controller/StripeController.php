<?php

namespace App\Controller;

use Stripe\Stripe;
use App\Entity\Order;
use App\Entity\Product;
use Stripe\Checkout\Session;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class StripeController extends AbstractController
{

    /**
     * @Route("/commande/create-session/{reference}", name="stripe_create_session")
     */
    public function index(EntityManagerInterface $entityManager, $reference)
    {
        Stripe::setApiKey('sk_test_51JG7bDJQOAme2gwHolD7pRCbRMJT0aeDZ0gFAZN9QyRnVkC5yXaTskbZVeS92rOViEGHi8Qxu1aMMu17bzBcRsPv00ya6k1rCm');
        
        $YOUR_DOMAIN = 'http://127.0.0.1:8000';
        $product_for_stripe = [];  
        
        $order = $entityManager->getRepository(Order::class)->findOneByReference($reference);

        

        foreach($order->getOrderDetails()->getValues() as $product){
            $product_object = $entityManager->getRepository(Product::class)->findOneByName($product->getProduct());
            $product_for_stripe[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'unit_amount' => $product->getPrice(),
                    'product_data' => [
                        'name' => $product->getProduct(),
                        'images' => [$YOUR_DOMAIN.'/uploads/media/'.$product_object->getIllustration()]
                    ],
                ],
                'quantity' => $product->getQuantity(),
            ];
        }

        $product_for_stripe[] = [
            'price_data' => [
                'currency' => 'eur',
                'unit_amount' => $order->getCarrierPrice(),
                'product_data' => [
                    'name' => $order->getCarrierName(),
                    'images' => [$YOUR_DOMAIN]
                ],
            ],
            'quantity' => 1,
        ];



        $checkout_session = Session::create([
            'customer_email' => $this->getUser()->getEmail(),
            'payment_method_types' => ['card'],
            'line_items' => [
                $product_for_stripe
            ],
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/commande/merci/{CHECKOUT_SESSION_ID}',
            'cancel_url' => $YOUR_DOMAIN . '/commande/erreur/{CHECKOUT_SESSION_ID}',
        ]); 

        $order->setStripSessionID($checkout_session->id); 
        $entityManager->flush();

        //$response = new JsonResponse(['url' => $checkout_session->url]);
        return $this->redirect($checkout_session->url);
    }
}
