<div align="center">
  <img align="center" width="200" src="https://symfony.com/logos/symfony_black_03.png" alt="Symfony e-Boutique"/>
</div>

<h3 align="center">Symfony e-Boutique</h3>
<p align="center">Application web de e-commerce développée avec Symfony, permettant la navigation par catégories, l’inscription, la connexion, la gestion de panier et la consultation d’articles.</p>
<a align="center" href="https://theodisy.alwaysdata.net/" target="_blank"><p><strong>DEMO</strong></p></a>


---

## 🛍️ Description

Symfony e-Boutique est un site web développé en **PHP avec le framework Symfony**. Il permet à un utilisateur de s’inscrire, de se connecter, de parcourir les produits par catégorie, d’ajouter des articles à son panier, d’ajuster les quantités, de valider sa commande, et plus encore.

Le projet est actuellement **hébergé sur AlwaysData** (en production).

---

## ✅ Fonctionnalités

| Fonctionnalité                                      | État                       |
|-----------------------------------------------------|----------------------------|
| 🔐 Connexion utilisateur                             | ✅ OK                      |
| 📝 Inscription utilisateur                           | ✅ OK                      |
| 📂 Navigation par catégorie                          | ✅ OK                      |
| 🧾 Parcours des articles                             | ✅ OK                      |
| 🛒 Ajout d’article au panier                         | ✅ OK                      |
| ➕ Ajustement de quantités dans le panier            | ✅ OK (⚠️ Voir remarque)  |
| 💰 Calcul du prix total dans le panier               | ✅ OK                      |
| ✅ Message de confirmation de commande               | ✅ OK                      |
| 🆕 Ajout d’un nouveau type d’article                 | ✅ OK                      |
| 🆕 Ajout d’une nouvelle catégorie                     | ✅ OK                      |
| 👤 Gestion des utilisateurs (hors inscription)       | ❌ Non implémentée         |

> ⚠️ **Attention :** L’ajustement de quantité dans le panier **nécessite de saisir la nouvelle quantité puis de cliquer sur le bouton "Modifier"** pour que le changement soit pris en compte. Ce fonctionnement est correct mais peut manquer d’intuitivité.

---

## 👥 Comptes de démonstration

Pour tester rapidement les différentes interfaces, deux comptes sont à disposition :

| Rôle            | Email                      | Mot de passe |
|-----------------|----------------------------|--------------|
| 🛠 Administrateur | admin@boutique.fr           | Admin123     |
| 👤 Utilisateur     | user@boutique.fr            | User123      |

🔐 *L'administrateur a accès aux fonctionnalités d'ajout de produits et de catégories.*

---

## 🧰 Prérequis

Avant de lancer le projet, assure-toi d’avoir installé :

- PHP (>=8.1 recommandé)
- Composer
- Symfony CLI
- MySQL / MariaDB
- Git

---

## Technologies
Ce projet utilise plusieurs technologies modernes pour créer une expérience interactive:

<table align="center"> <tbody> <tr> <td align="center"> <img width="75" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Symfony2.svg/langfr-280px-Symfony2.svg.png" alt="Symfony" /> <p>Symfony</p> </td> </tr> </tbody> </table>


## ✨ Améliorations possibles
- Gestion des utilisateurs
  
- Permettre aux utilisateurs de changé de mot de passe

- Gestion du stock par produit

- Filtres avancés sur les produits

- Retirer les `<div>` des textes

- Ajout des gestions d'erreurs


## Installation

### 1. Cloner le projet
   
Ouvrez votre terminal et exécutez la commande suivante pour cloner le dépôt :

```git clone https://github.com/Souyyy/E-Boutique-Symfony/```

### 2. Accéder au répertoire
Naviguez dans le dossier du projet :

```cd E-Boutique-Symfony```

### 3. Installer les dépendances
Installez toutes les dépendances nécessaires au projet :

```composer install```

Cette étape peut prendre quelques minutes selon votre connexion internet.

### 3.1 Installer la BDD

Créez une base de donnée nommé `SymShop`, et importer le fichier SQL

### 4. Lancer l'application

Démarrez le serveur de développement :

```symfony serve```

### 5. Accéder à l'application

Ouvrez votre simulateur et lancé le projet.

## Licence
Ce programme est sous licence MIT.

