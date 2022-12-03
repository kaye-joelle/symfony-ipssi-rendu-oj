<?php

namespace App\Controller;


use App\Repository\ArticleRepository;
use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;



class CartController extends AbstractController
{

    //  Route pour le panier ("/panier", name="cart_index")

    public function index(SessionInterface $session, ProductRepository $ProductRepository) {
        $panier = $session->get('panier' []);

        $panierAffiche = [];
        // creer une boucle qui permet d'afficher les produits et leurs quantités

        foreach ($panier as $id => $quantity) {
            $panierAffiche[] = [
            'product' => $ProductRepository->find($id),
            'quantity' => $quantity,
            ];
        }

        return $this->render('cart/index.html.twig', [
            'items' => $panierAffiche
        ]);
    }

    // fonction pour panier : route ("/panier/add/{id}", name="cart_add")

    public function add($id, Request $request) {
        $session = $request->getSession();

        // Vérification pour voir si le panier exsite
        $panier = $session->get('panier' []);

        // Creer une condition qui permet de mettre 2 fois le meme article dans le panier

        if(!empty($panier[$id])) {
            $panier[$id]++;
        }

        // si il n'est pas alors ajouter 1 seul
        else {
            $panier[$id] = 1;
        }

        // si panier contient quelque chose, changer pour les nouvelles données
        $session->set('panier', $panier);
        dd($session->get('panier'));

    }
}
