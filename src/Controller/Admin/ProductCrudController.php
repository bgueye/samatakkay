<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class ProductCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name', 'Nom'),
            SlugField::new('slug')->setTargetFieldName('name'),
            ImageField::new('illustration', 'Image')
                ->setBasePath('uploads/media/')
                ->setUploadDir('public/uploads/media')
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false),
            TextareaField::new('description'),
            TextField::new('composition'),
            MoneyField::new('price','Prix')->setCurrency('EUR'),
            IntegerField::new('stock', 'Quantité'),
            BooleanField::new('isBest', 'Best of'),
            BooleanField::new('disponible'),
            BooleanField::new('published', 'Publié'),
            AssociationField::new('category','Catégorie')


        ];
    }
    
}
