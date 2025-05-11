<?php

namespace App\Entity;

use App\Repository\ProduitRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: ProduitRepository::class)]
class Produit
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Assert\NotBlank(message: 'Le nom du produit est obligatoire.')]
    #[Assert\Length(max: 255, maxMessage: 'Le nom ne peut pas dépasser {{ limit }} caractères.')]
    private ?string $name = null;

    #[ORM\Column(type: "text")]
    #[Assert\NotBlank(message: 'La description est obligatoire.')]
    #[Assert\Length(min: 10, minMessage: 'La description doit faire au moins {{ limit }} caractères.')]
    private ?string $description = null;

    #[ORM\Column]
    #[Assert\NotNull(message: 'Le prix HT est obligatoire.')]
    #[Assert\Positive(message: 'Le prix HT doit être positif.')]
    private ?float $priceHT = null;

    #[ORM\Column]
    #[Assert\NotNull(message: 'La disponibilité du produit est obligatoire.')]
    private ?bool $available = null;

    /**
     * @var Collection<int, Media>
     */
    #[ORM\OneToMany(targetEntity: Media::class, mappedBy: 'produit')]
    private Collection $media;

    #[ORM\ManyToOne(inversedBy: 'produits')]
    private ?Categorie $categorie = null;

    /**
     * @var Collection<int, CommandLine>
     */
    #[ORM\OneToMany(targetEntity: CommandLine::class, mappedBy: 'produit')]
    private Collection $commandLines;

    public function __construct()
    {
        $this->media = new ArrayCollection();
        $this->commandLines = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getPriceHT(): ?float
    {
        return $this->priceHT;
    }

    public function setPriceHT(float $priceHT): static
    {
        $this->priceHT = $priceHT;

        return $this;
    }

    public function isAvailable(): ?bool
    {
        return $this->available;
    }

    public function setAvailable(bool $available): static
    {
        $this->available = $available;

        return $this;
    }

    /**
     * @return Collection<int, Media>
     */
    public function getMedia(): Collection
    {
        return $this->media;
    }

    public function addMedium(Media $medium): static
    {
        if (!$this->media->contains($medium)) {
            $this->media->add($medium);
            $medium->setProduit($this);
        }

        return $this;
    }

    public function removeMedium(Media $medium): static
    {
        if ($this->media->removeElement($medium)) {
            // set the owning side to null (unless already changed)
            if ($medium->getProduit() === $this) {
                $medium->setProduit(null);
            }
        }

        return $this;
    }

    public function getCategorie(): ?Categorie
    {
        return $this->categorie;
    }

    public function setCategorie(?Categorie $categorie): static
    {
        $this->categorie = $categorie;

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
            $commandLine->setProduit($this);
        }

        return $this;
    }

    public function removeCommandLine(CommandLine $commandLine): static
    {
        if ($this->commandLines->removeElement($commandLine)) {
            // set the owning side to null (unless already changed)
            if ($commandLine->getProduit() === $this) {
                $commandLine->setProduit(null);
            }
        }

        return $this;
    }

    public function getPriceTTC(): float
    {
        return $this->priceHT * 1.2;
    }

    public function __toString(): string
    {
        return $this->name;
    }
}
