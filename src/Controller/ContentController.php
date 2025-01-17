<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\User;
use App\Entity\Cart;
use App\Entity\CartProduct;


use App\Repository\ArticleRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/')]
class ContentController extends AbstractController
{
    // Articles
    #[Route('', name: 'app_home')]
    public function index(ArticleRepository $articleRepository): Response
    {
        $articles = $articleRepository->findByCreatedDate(3);

        return $this->render('content/index.html.twig', [
            'articles' => $articles,
        ]);
    }
    
    // Products
    #[Route('/products', name: 'app_products')]
    public function getProducts(ProductRepository $productRepository): Response
    {
        $products = $productRepository->findAll();
        // $products[$key] = $product->getProducts();
        // $user = $this->getUser();
        // $cart = $user->getCart();
        // $p = $cart->getCartProducts()->toArray();
        
        // $productss = [];
        // foreach ($p as $key => $product) {
        //     $products[$key] = $product->getProducts();
        // }
        //dd($productss);


        return $this->render('content/products.html.twig', [
            'products' => $products,
        ]);
    }

    #[Route('/product/{id}', name: 'app_product_show')]
    public function getProduct(Product $product): Response
    {
        return $this->render('content/product.html.twig', [
            'product' => $product,
        ]);
    }

}
