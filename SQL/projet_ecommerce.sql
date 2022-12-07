-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 04 déc. 2022 à 22:32
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `author_id`, `created_at`, `updated_at`) VALUES
(4, 'Elixir Botanique', 'Le Soin Anti-Pollution Réparateur Jour désasphyxie immédiatement la peau, elle est protégée face aux méfaits de la pollution responsables du vieillissement prématuré de la peau. Dès 1 mois, rides et ridules sont réduites ; la peau est réparée, fortifiée et paraît éclatante de santé', 2, '2022-11-30 09:26:22', '2022-11-30 09:28:04'),
(5, 'Gommage Éclat Ultra-Fraîcheur Pure Algue', 'Ce Gommage Éclat Ultra-Fraîcheur exfolie en douceur, oxygène et rafraîchit parfaitement la peau. Un grain de peau affiné pour une peau douce et éclatante ! Il est formulé à la Micro-Algue Tetraselmis aux propriétés oxygénantes* et cultivée en culture responsable et durable au large de nos côtes bretonnes.\r\n\r\nDestiné aux peaux normales à mixtes, qui peuvent tirailler, être en manque d\'hydratation ou ternes.', 2, '2022-11-30 09:45:42', NULL),
(6, 'Crème Riche Hydratation Non-Stop 48H', 'Grâce à cette crème riche, la peau est immédiatement nourrie et retrouve tout son confort. Pendant 48h, elle est hydratée en continu, pour une peau repulpée et un teint frais et éclatant du matin au soir. Enrichie en Eau Cellulaire d’Edulis, activatrice d’hydratation.', 2, '2022-11-30 09:45:50', NULL),
(7, 'Grand Soin Régénérant', 'Avec le Grand Soin Régénérant les rides sont lissées, la peau est plus souple et confortable jour après jour. Dès 1 mois, la peau est nourrie et régénérée. Enrichi en Huiles Précieuses aux bénéfices anti-âge.', 2, '2022-11-30 09:45:59', NULL),
(8, 'Palette Yeux', 'Une harmonie aux tons chauds inspirée par les couleurs flamboyantes des couchers de soleil et des paysages bretons.\r\n\r\n9 fards à paupières hautement pigmentés, aux finis mats, nacrés ou métalliques. Allant des tons bruns aux rouges ardents et aux ors éclatants, Lande Ambrée est idéale pour créer vos looks du plus naturel au plus osé.\r\n\r\nLeur formule douce et végane** est enrichie en bleuet biologique, qui convient aux yeux sensibles et secs et/ou aux porteurs de lentilles.', 2, '2022-11-30 09:46:10', NULL),
(9, 'Ombre Lifeproof', 'Un fard à paupière stylo facile à utiliser, résistant à toutes les épreuves de la vie : c\'est l\'Ombre Lifeproof*. Une couleur intense et nacrée dès le premier passage.\r\n\r\nSa mine et sa texture crémeuse permettent une application facile et modulable. Sa formule longue tenue résiste en toute circonstances: sport, eau, larmes de joie. Tenue 14H.', 2, '2022-11-30 09:46:10', NULL),
(10, 'Coffret Comme Une Evidence', 'Se fondre dans l’immensité du firmament et se sentir au plus proche des astres.\r\nInspiré de notre beau jardin de noël, ce coffret renferme toute l\'harmonie et la féminité du parfum Comme Une Evidence.', 2, '2022-11-30 09:46:10', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart_product`
--

CREATE TABLE `cart_product` (
  `id` int(11) NOT NULL,
  `products_id` int(11) DEFAULT NULL,
  `carts_id` int(11) DEFAULT NULL,
  `product_quantity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Cat 1'),
(2, 'Cat 2'),
(3, 'Catégorie 3');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `seller_id`, `category_id`, `title`, `description`, `price`, `image`, `created_at`, `updated_at`, `quantity`) VALUES
(1, 1, 1, 'Eau de Parfum So Elixir Bois Sensuel ', 'Un élixir de féminité voluptueux et racé', '2000', NULL, '2022-11-30 09:46:53', NULL, NULL),
(2, 2, 3, 'Eau de Parfum Cuir de Nuit', 'La lune dévoile une nature à fleur de peau, aussi sensuelle que sauvage, des notes cuirées addictives aux facettes chaudes et épicées.', '4000', NULL, '2022-11-30 10:12:00', NULL, NULL),
(3, 2, 1, 'Eau de Parfum Sable Fauve', 'Le soleil se couche sur les terres mystérieuses emprises des tourbillons de senteurs chaudes et instinctives.', '1000', NULL, '2022-11-30 23:41:59', NULL, NULL),
(4, 2, 2, 'Eau de Parfum Voile d\'Ocre', 'L’horizon infini des dunes de sable, la chaleur enveloppante du désert doré rencontre la fraîcheur des ombres.', '950', NULL, '2022-11-30 01:36:13', NULL, NULL),
(5, 1, 3, 'Comme une Evidence', 'La fraîcheur raffinée de l\'essence de Bergamote laisse place au sillage délicatement féminin de l\'absolu de Rose Damascena.', '1425', NULL, '2022-11-30 09:46:29', NULL, NULL),
(6, 2, 1, 'Eau de Parfum So Elixir Purple', 'Matières premières :\r\n- Infusion de Tubéreuse\r\n- Essence de Vétiver\r\n- Essence de Patchouli', '3078', NULL, '2022-11-30 19:33:01', NULL, NULL),
(7, 2, 1, 'Eau de Parfum Sur La Lande', 'Une invitation à renouer avec sa nature visionnaire.\r\nTerre de caractère. Horizon infini.', '3654', NULL, '2022-11-30 11:16:22', NULL, NULL),
(8, 1, 2, 'Eau de Parfum Oui à L’Amour', 'L\'Eau de Parfum Oui à L’Amour est le complice d\'un amour sans fin. Un bouquet de Rose décoré de notes croquantes d’Angélique et sublimé par l’élégance du Cèdre.', '1300', NULL, '2022-11-30 12:59:59', NULL, NULL),
(9, 1, 3, 'Eau de Parfum Garden Party', 'L’arrivée des beaux jours, la légèreté des pétales de rose qui se mêlent aux rires éparpillés dans le jardin.', '2673', NULL, '2022-11-30 05:14:23', NULL, NULL),
(10, 2, 3, 'Eau de Parfum Sel d\'Azur', 'Une balade le long des falaises, à l’ombre des pins, les embruns salés et une fraîcheur zestée.', '2099', NULL, '2022-11-30 15:46:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `firstname`) VALUES
(1, 'test@test.com', '[\"ROLE_USER\"]', '$2y$13$rSMcBmakx4Dqm9JbY6RVSu.NoSWQV9DdUcEkMJqeR5PvmXF3HwuU6', 'Yves', 'Rocher'),
(2, 'user@test.com', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$oYt5uSY0wyBBzvNKyIgPs.KeGMMNJYROmwpIeiyrqL0EMaeo6B3Q.', 'Sephora', 'Paris');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E66F675F31B` (`author_id`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BA388B7A76ED395` (`user_id`);

--
-- Index pour la table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2890CCAA6C8A81A9` (`products_id`),
  ADD KEY `IDX_2890CCAABCB5C6F5` (`carts_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD8DE820D9` (`seller_id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E66F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `FK_2890CCAA6C8A81A9` FOREIGN KEY (`products_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_2890CCAABCB5C6F5` FOREIGN KEY (`carts_id`) REFERENCES `cart` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_D34A04AD8DE820D9` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
