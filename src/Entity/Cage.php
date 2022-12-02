<?php

namespace App\Entity;

use App\Repository\CageRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CageRepository::class)]
class Cage
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $cage = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCage(): ?string
    {
        return $this->cage;
    }

    public function setCage(?string $cage): self
    {
        $this->cage = $cage;

        return $this;
    }
}
