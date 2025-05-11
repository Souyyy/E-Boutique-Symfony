-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : dim. 11 mai 2025 à 17:08
-- Version du serveur : 8.0.40
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `SymShop`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse_client`
--

CREATE TABLE `adresse_client` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` int NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adresse_client`
--

INSERT INTO `adresse_client` (`id`, `user_id`, `type`, `name`, `first_name`, `phone`, `address`, `cp`, `city`, `country`) VALUES
(1, 4, 'Maison', 'Fredo', 'Fedo', '43434', 'r ue du fred', 3434, 'Paris', 'France'),
(2, 3, 'root', 'root', 'trt', '0110101011', 'root', 12345, 'root', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `name`, `description`) VALUES
(8, 'Champagne', '<div>Faisant pétiller les évènements festifs, le champagne est associé à la joie, aux célébrations et au prestige. Découvrez l’élégance et le raffinement de ce vin à bulles à travers une belle sélection de champagnes de grande maison et de champagnes de vigneron. Des vins qui raviront vos papilles en toutes occasions !</div>'),
(9, 'Vins', '<div>Avec WineShop, l\'achat de vins sur Internet n\'a jamais été aussi simple ! Découvrez une sélection de vins issus des vignobles du monde entier : pépites, nouveautés, vins récompensés, cuvées confidentielles ou Grands Vins de domaines de renom... une offre vaste et aiguisée à prix canon !</div>'),
(10, 'Bieres', '<div>Acheter les meilleures bières de votre région sur WineShop.com ! Faites le plein de bières artisanales et retrouvez des brasseries incontournables comme la Brasserie du Mont-Blanc, les Brasseurs Savoyards, la Brasserie des Cimes, Ninkasi ou encore Pietra.</div>'),
(11, 'Rhums', '<div>Amateur de rhum ou néophyte, vous désirez acheter une bouteille de rhum ? Des rhums pas chers aux bouteilles haut de gamme au prix plus élevé, WineShop vous invite à découvrir une sélection complète de rhums, ron et rum pour une dégustation inoubliable.</div>');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_number` int NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `user_id`, `order_number`, `valid`, `date_time`) VALUES
(1, 4, 920572, 0, '2025-05-08 22:06:12'),
(2, 4, 862748, 1, '2025-05-08 22:10:52'),
(3, 4, 180197, 1, '2025-05-08 22:12:02'),
(4, 4, 988022, 1, '2025-05-08 22:12:51'),
(5, 3, 502650, 1, '2025-05-10 23:18:34');

-- --------------------------------------------------------

--
-- Structure de la table `command_line`
--

CREATE TABLE `command_line` (
  `id` int NOT NULL,
  `produit_id` int DEFAULT NULL,
  `commande_id` int DEFAULT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `command_line`
--

INSERT INTO `command_line` (`id`, `produit_id`, `commande_id`, `quantity`) VALUES
(1, 4, 1, 3),
(2, 4, 2, 1),
(3, 4, 3, 1),
(4, 4, 4, 2),
(5, 5, 4, 1),
(6, 6, 4, 1),
(7, 4, 5, 1),
(8, 5, 5, 2),
(9, 7, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250506101104', '2025-05-06 10:11:16', 259),
('DoctrineMigrations\\Version20250508132836', '2025-05-08 13:29:08', 53),
('DoctrineMigrations\\Version20250510225059', '2025-05-10 22:52:45', 131);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int NOT NULL,
  `categorie_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `categorie_id`, `produit_id`, `type`, `path`, `alt`) VALUES
(1, 8, 4, 'Image', 'https://d2i4pzk02r8gti.cloudfront.net/sylius_big/13/55/ca4548cd70c8fd00be1f620e384b.jpeg', 'Champagne Chandon & Moet'),
(2, 8, 5, 'Image', 'https://champfrance.fr/wp-content/uploads/bollinger-spe%CC%81cial-cuve%CC%81e-75cl-avec-coffret-750x750.png', 'Image'),
(3, 8, 7, 'Image', 'https://champfrance.fr/wp-content/uploads/Ruinart-Blanc-de-Blancs-seconde-peau-750x750.png', 'Ruinart'),
(4, 8, 6, 'Image', 'https://champfrance.fr/wp-content/uploads/veuve-clicquot-brut-carte-jaune-en-75cl-nu-750x750.png', 'Image'),
(5, 8, 10, 'Image', 'https://champfrance.fr/wp-content/uploads/Perrier-Joue%CC%88t-Blason-Rose-75cl-750x750.png', 'Image'),
(6, 8, 8, 'Image', 'https://champfrance.fr/wp-content/uploads/armand_de_brignac_brutgold-750x750.png', 'Image'),
(7, 8, 9, 'Image', 'https://champfrance.fr/wp-content/uploads/Mumm-Cordonrouge-Commander-750x750.png', 'Image'),
(8, 8, 11, 'Image', 'https://champfrance.fr/wp-content/uploads/Krug-brut-163e%CC%80me-e%CC%81dition-750x750.png', 'Image'),
(9, 9, 15, 'Image', 'https://www.vinatis.com/54026-detail_default/chateau-la-gaffeliere-2018-1er-grand-cru-classe-b.png', 'Image'),
(10, 9, 16, 'Image', 'https://www.vinatis.com/87304-detail_default/volnay-1er-cru-clos-de-la-barre-monopole-2017-louis-jadot.png', 'Image'),
(11, 9, 17, 'Image', 'https://www.vinatis.com/91540-detail_default/chateau-d-ampuis-2019-e-guigal.png', 'Image'),
(12, 9, 18, 'Image', 'https://www.vinatis.com/78708-detail_default/chablis-grand-cru-vaudesir-2021-jean-marc-brocard.png', 'Image'),
(13, 9, 19, 'Image', 'https://www.vinatis.com/83788-detail_default/nicolas-catena-zapata-2020-catena-zapata.png', 'Image'),
(14, 9, 20, 'Image', 'https://www.vinatis.com/81441-detail_default/chateau-capion-2017.png', 'Image'),
(15, 10, 24, 'Image', 'https://www.vinatis.com/51609-detail_default/blanche-du-mont-blanc-75cl-brasserie-du-mont-blanc.png', 'Image'),
(16, 10, 25, 'Image', 'https://www.vinatis.com/71144-detail_default/biere-sans-alcool-pale-ale-run-hard.png', 'Image'),
(17, 10, 26, 'Image', 'https://www.vinatis.com/51606-detail_default/verte-du-mont-blanc-75cl-brasserie-du-mont-blanc.png', 'Image'),
(18, 10, 27, 'Image', 'https://www.vinatis.com/78737-detail_default/nonne-triple-bio-75cl-les-brasseurs-savoyards.png', 'Image'),
(19, 10, 28, 'Image', 'https://www.vinatis.com/51608-detail_default/blonde-du-mont-blanc-75cl-brasserie-du-mont-blanc.png', 'Image'),
(20, 11, 34, 'Image', 'https://www.vinatis.com/75122-detail_default/rhum-arrange-nektar-passion-ananas-citron-vert-70cl.png', 'Image'),
(21, 11, 35, 'Image', 'https://www.vinatis.com/75123-detail_default/rhum-arrange-nektar-citron-vert-gingembre-70-cl.png', 'Image'),
(22, 11, 36, 'Image', 'https://www.vinatis.com/75124-detail_default/rhum-arrange-nektar-mangue-passion-70-cl.png', 'Image'),
(23, 11, 37, 'Image', 'https://www.vinatis.com/34727-detail_default/ti-arranges-de-ced-ananas-victoria-les-rhums-de-ced.png', 'Image');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int NOT NULL,
  `categorie_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_ht` double NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `categorie_id`, `name`, `description`, `price_ht`, `available`) VALUES
(4, 8, 'Champagne Moët & Chandon Impérial Brut', '<div>Cuvée signature de la maison, à base de Pinot Noir, Pinot Meunier et Chardonnay. Bulles fines, arômes de pomme verte, agrumes, noisette et fleurs blanches. Très accessible.</div>', 33, 1),
(5, 8, 'Champagne Bollinger Special Cuvée Brut', '<div>Un grand classique de la maison Bollinger, assemblé principalement à partir de Pinot Noir. Robe dorée, bulles fines, arômes de pomme rôtie, brioche et épices. Un champagne de gastronomie, structuré et complexe.</div>', 38, 1),
(6, 8, 'Champagne Veuve Clicquot Brut Carte Jaune', '<div>Reconnaissable entre tous, ce brut emblématique propose un équilibre entre puissance, structure et fraîcheur. Arômes de fruits blancs, pain grillé et vanille. Une valeur sûre.</div>', 36, 0),
(7, 8, 'Champagne Ruinart Blanc de Blancs', '<div>100% Chardonnay, ce champagne séduit par sa finesse et sa fraîcheur. Notes d\'agrumes, de fleurs blanches et de fruits à chair blanche. Élégant, parfait à l’apéritif ou sur des fruits de mer.</div>', 52, 1),
(8, 8, 'Champagne Armand de Brignac', '<div>Le meuilleur champagne au monde ! Armand de Brignac présente son chef-d’œuvre, le Brut Gold, une cuvée brut séduisante offrant une richesse et une expression aromatique exceptionnelles, révélant ainsi l’excellence de la Champagne.&nbsp;</div>', 315, 1),
(9, 8, 'Champagne G.H Mumm', '<div>Le champagne Cordon Rouge est proposé par la maison G.H. Mumm est sa cuvée la plus célèbre. Elle résume à elle seule le savoir-faire de la maison et son identité à travers un vin structuré.</div>', 44, 1),
(10, 8, 'Champagne Perrier-Jouët Grand Brut', '<div>Un champagne floral et élégant, avec des touches de poire, de citron et de brioche. Belle effervescence, parfait en toute occasion. Un excellent rapport qualité/prix.</div>', 32, 0),
(11, 8, 'Champagne Krug', '<div>Les Grandes Cuvées Krug sont la signature de la maison depuis 1843. Elles incarnent le souhait du fondateur de la maison, offrir à ses consommateurs un champagne d’une incroyable élégance et richesse.</div>', 217, 0),
(15, 9, 'Château la Gaffelière 2018 - 1er Grand Cru Classé B', '<div>Toujours à la recherche de  généreux, gourmands, racés et d’un équilibre résolument classique, privilégiant la fraîcheur et l’harmonie, la Gaffelière nous propose ce splendide et racé millésime 2018.</div>', 95, 1),
(16, 9, 'Volnay 1er Cru - Clos de la Barre Monopole 2017 - Louis Jadot', '<div>Le Volnay 1er Cru Clos de la Barre, exclusivité de la maison Jadot et voisin des prestigieuses appellations <a href=\"https://www.vinatis.com/achat-vin-pommard\">Pommard</a> et <a href=\"https://www.vinatis.com/achat-vin-bourgogne-meursault-1er-cru\">Meursault</a>, se distingue par son caractère fruité aux notes de vanille, de petits fruits et de violettes.</div>', 63, 1),
(17, 9, 'Château d\'Ampuis 2019 - E. Guigal', '<div>Fruit de la formidable aventure humaine et familiale entreprise par Marcel <a href=\"https://www.vinatis.com/maisons/guigal\">Guigal</a> et son fils Philippe, la cuvée Château d’Ampuis est un Côte-Rôtie composé de Syrah et de <a href=\"https://www.vinatis.com/viognier-vin-blanc\">Viognier</a>.</div>', 99, 0),
(18, 9, 'Chablis Grand Cru Vaudesir 2021 - Jean Marc Brocard', '<div>De tous les Grands Crus de Chablis, le Vaudésir en est le plus délicat. Il séduit par son caractère vif et élégant et offre également une minéralité rarement égalée, grâce à la finesse exprimée par le chardonnay sur le terroir Kimméridgien, un calcaire assez friable constitué d\'huîtres et de coquillages fossilisés.</div>', 64, 0),
(19, 9, 'Nicolas Catena Zapata 2020 - Catena Zapata', '<div>Le Nicolas Catena Zapata 2020 est un assemblage de 54% de Cabernet Sauvignon de Gualtallary, 25% de Cabernet Franc d\'Altamira et 21% de Malbec des deux régions.</div>', 95, 0),
(20, 9, 'Château Capion 2017', '<div>Domaine parmi les mieux notés de l’appellation par Robert Parker, le Château Capion s’impose par l’expressivité et la richesse de ses vins particulièrement taillés pour la garde.</div>', 36, 0),
(24, 10, 'Blanche du Mont-Blanc 75cl - Brasserie du Mont-Blanc', '<div>La Blanche du Mont-Blanc est une Wheatbeer (bière blanche de type belge), le malt d’orge, le malt de blé et différentes variétés de houblons sont relevés par un bouquet épicé où la coriandre et l’écorce d’orange de Curaçao dominent.</div>', 7, 1),
(25, 10, 'Bière sans alcool - Pale Ale - Run\'hard', '<div>Surnommée \"La Reine\", cette bière est une Pale Ale, sans alcool et sans gluten, brasée artisanalement en France, non filtrée et non pasteurisée.</div>', 8, 1),
(26, 10, 'Verte du Mont-Blanc 75cl - Brasserie du Mont-Blanc', '<div>Avec cette bière aromatisée au génépi, Sylvain Chiron, savoyard pure souche, fait complètement honneur à ses origines alpines.</div>', 6, 0),
(27, 10, 'Nonne Triple Bio 75cl - Les Brasseurs Savoyards', '<div>La Nonne triple fait partie de la gamme proposée par les Brasseurs Savoyards : une gamme plus pointue et encore plus en phase avec le savoir-faire de la fabrication artisanale de bières.</div>', 6, 0),
(28, 10, 'Blonde du Mont-Blanc 75cl - Brasserie du Mont-Blanc', '<div>Cette bière blonde de dégustation, composée d’un assemblage de trois variétés de houblon, offre un profil floral, fruité et épicé <em>(réglisse)</em>.</div>', 7, 0),
(34, 11, 'Rhum Arrangé - Nektar Passion-Ananas-Citron Vert 70cl', '<div>De la fraîcheur par les fruits et la richesse aromatique dès la première dégustation. Légers, pas trop sucrés, ces rhums seront vos alliés parfaits pour vos apéritifs entre amis sous le signe du plaisir et de la fête.</div>', 31, 1),
(35, 11, 'Rhum Arrangé - Nektar Citron Vert-Gingembre 70 CL', '<div>Plongez au cœur d\'une dégustation de fruits frais, parfaitement équilibrée entre saveurs sucrées, acidulées et délicates, 100% naturelles. De quoi ravir vos apéritifs, dignes des meilleurs cocktails. Simple, sans superflus, un plaisir dont il serait dommage de se priver !</div>', 32, 1),
(36, 11, 'Rhum Arrangé - Nektar Mangue-Passion 70 CL', '<div>Mangue-Passion est un véritable voyage exotique. Saveurs et fraîcheur s\'allient pour vous procurer un véritable moments de plaisir gustatif. A déguster bien frais, il vous séduira autant que vos convives. Juteux, délicat, harmonieux, un véritable régal !</div>', 26, 1),
(37, 11, 'Ti Arranges de Ced - Ananas Victoria - Les Rhums de Ced', '<div>Elaboré à partir de rhum agricole AOC de Martinique et de fruits provenant pour l\'essentiel d\'une coopérative agricole raisonnée de la Réunion, les Rhums de Ced dans leur gamme \"Ti Arrangés de Ced\" mettent en avant le vrai goût du fruit comme si vous croquiez dedans.</div>', 33, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `first_name`) VALUES
(3, 'root@root.com', '[\"ROLE_ADMIN\"]', '$2y$13$/lCdO81gR9WIyl8wXK6pkeS.uVSQvK98IgA6RHZJP70FKEzAM1K0.', 'Greg11', 'Licorne'),
(4, 'root1@root.com', '[\"ROLE_USER\"]', '$2y$13$/lCdO81gR9WIyl8wXK6pkeS.uVSQvK98IgA6RHZJP70FKEzAM1K0.', 'Fredo', 'LEo'),
(5, 'azsas@ffefe.Dde', '[\"ROLE_USER\"]', '$2y$13$1RvdLjikCn8Ry3c85QH/Pu1sMI5fDnqmGVccT6BRlxxBz/oE7157a', 'aaqq', 'qqaq');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresse_client`
--
ALTER TABLE `adresse_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_891D1BDA76ED395` (`user_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67DA76ED395` (`user_id`);

--
-- Index pour la table `command_line`
--
ALTER TABLE `command_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_70BE1A7BF347EFB` (`produit_id`),
  ADD KEY `IDX_70BE1A7B82EA2E54` (`commande_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6A2CA10CBCF5E72D` (`categorie_id`),
  ADD KEY `IDX_6A2CA10CF347EFB` (`produit_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC27BCF5E72D` (`categorie_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresse_client`
--
ALTER TABLE `adresse_client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `command_line`
--
ALTER TABLE `command_line`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse_client`
--
ALTER TABLE `adresse_client`
  ADD CONSTRAINT `FK_891D1BDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `command_line`
--
ALTER TABLE `command_line`
  ADD CONSTRAINT `FK_70BE1A7B82EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `FK_70BE1A7BF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10CBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CF347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC27BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
