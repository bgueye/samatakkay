<?php

namespace App\Controller\Admin;

use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Router\CrudUrlGenerator;

class OrderCrudController extends AbstractCrudController
{

    private $em;
    private $crudUrlGenerator;
    public function __construct(EntityManagerInterface $entityManager, CrudUrlGenerator $crudUrlGenerator)
    {
        $this->em = $entityManager;
        $this->crudUrlGenerator = $crudUrlGenerator;
    }

    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        $updatePreparation = Action::new('updatePreparation', 'préparation en cours ', 'fas fa-box-open')->linkToCrudAction('updatePreparation');
        $updatedelivery = Action::new('updatedelivery', 'Livraison en cours | ', 'fas fa-truck')->linkToCrudAction('updateDelivery');
        $isdelivery = Action::new('isdelivery', 'Livrée | ', 'fas fa-address-card')->linkToCrudAction('isDelivery');
        return $actions
            ->add('detail', $updatePreparation)
            ->add('detail', $updatedelivery)
            ->add('detail', $isdelivery)
            ->add('index', 'detail')
            ->remove('index', 'edit')
            ->remove('detail', 'edit');
    }

    public function updatePreparation(AdminContext $context)
    {
        $order = $context->getEntity()->getInstance();
        $order->setState(2);
        $this->em->flush();

        $this-> addFlash('noice', "<span style='color:green;'><strong>La commande <u>".$order->getReference()."</u> est bien <u>en cours de préparation</u>. </strong></span>");

        $url = $this->crudUrlGenerator->build()
            ->setController(OrderCrudController::class)
            ->setAction('index')
            ->generateUrl();
        
        return $this->redirect($url);
    }

    public function updateDelivery(AdminContext $context)
    {
        $order = $context->getEntity()->getInstance();
        $order->setState(3);
        $this->em->flush();

        $this-> addFlash('noice', "<span style='color:orange;'><strong>La commande <u>".$order->getReference()."</u> est bien <u>en cours de livraison</u>. </strong></span>");

        $url = $this->crudUrlGenerator->build()
            ->setController(OrderCrudController::class)
            ->setAction('index')
            ->generateUrl();
        
        return $this->redirect($url);
    }
    public function isDelivery(AdminContext $context)
    {
        $order = $context->getEntity()->getInstance();
        $order->setState(4);
        $this->em->flush();

        $this-> addFlash('noice', "<span style='color:orange;'><strong>La commande <u>".$order->getReference()."</u> est bien <u>livrée</u> à l'adresse indiquée. </strong></span>");

        $url = $this->crudUrlGenerator->build()
            ->setController(OrderCrudController::class)
            ->setAction('index')
            ->generateUrl();
        
        return $this->redirect($url);
    }    


    public function configureCrud(Crud $crud): Crud
    {
        return $crud->setDefaultSort(['id' => 'DESC']);
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            DateTimeField::new('createdAt', 'Passée le'),
            TextField::new('user.fullname', 'Commandée par'),
            TextEditorField::new('delivery', 'Adresse de livraison')->onlyOnDetail(),
            MoneyField::new('total', 'Total produit')->setCurrency('EUR'),
            TextField::new('carrierName', 'transporteur'),
            MoneyField::new('carrierPrice', 'Frais de port')->setCurrency('EUR'),
            ChoiceField::new('state', 'Statut')->setChoices([
                'Non payé' => 0,
                'Payée' => 1,
                'Préparation en cours' => 2,
                'Livraison en cours' => 3,
                'Livrée' => 4
            ]),
            ArrayField::new('orderDetails', 'Produits achetés')->hideOnIndex()
        ];
    }
}
