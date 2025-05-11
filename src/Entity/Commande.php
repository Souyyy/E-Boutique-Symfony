<?php

namespace App\Entity;

use App\Repository\CommandeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CommandeRepository::class)]
class Commande
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $orderNumber = null;

    #[ORM\Column]
    private ?bool $valid = null;

    #[ORM\Column]
    private ?\DateTime $dateTime = null;

    #[ORM\ManyToOne(inversedBy: 'commandes')]
    private ?User $user = null;

    /**
     * @var Collection<int, CommandLine>
     */
    #[ORM\OneToMany(targetEntity: CommandLine::class, mappedBy: 'commande')]
    private Collection $commandLines;

    public function __construct()
    {
        $this->commandLines = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getOrderNumber(): ?int
    {
        return $this->orderNumber;
    }

    public function setOrderNumber(int $orderNumber): static
    {
        $this->orderNumber = $orderNumber;

        return $this;
    }

    public function isValid(): ?bool
    {
        return $this->valid;
    }

    public function setValid(bool $valid): static
    {
        $this->valid = $valid;

        return $this;
    }

    public function getDateTime(): ?\DateTime
    {
        return $this->dateTime;
    }

    public function setDateTime(\DateTime $dateTime): static
    {
        $this->dateTime = $dateTime;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    /**
     * @return Collection<int, CommandLine>
     */
    public function getCommandLines(): Collection
    {
        return $this->commandLines;
    }

    public function addCommandLine(CommandLine $commandLine): static
    {
        if (!$this->commandLines->contains($commandLine)) {
            $this->commandLines->add($commandLine);
            $commandLine->setCommande($this);
        }

        return $this;
    }

    public function removeCommandLine(CommandLine $commandLine): static
    {
        if ($this->commandLines->removeElement($commandLine)) {
            // set the owning side to null (unless already changed)
            if ($commandLine->getCommande() === $this) {
                $commandLine->setCommande(null);
            }
        }

        return $this;
    }

}
