<?php

namespace App\Entity;

use App\Repository\CartRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CartRepository::class)]
class Cart
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $cart = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getcart(): ?string
    {
        return $this->cart;
    }

    public function setCart(?string $cart): self
    {
        $this->cart = $cart;

        return $this;
    }
}
