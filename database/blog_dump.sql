-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 29 juin 2023 à 12:37
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `ARTICLES`
--

CREATE TABLE `ARTICLES` (
  `id` int(11) NOT NULL,
  `TITLE` varchar(50) NOT NULL,
  `IMPART` int(11) NOT NULL,
  `STARTDATE` datetime NOT NULL,
  `ENDDATE` datetime NOT NULL,
  `TEXT` varchar(150) NOT NULL,
  `AUTHOR_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ARTICLES`
--

INSERT INTO `ARTICLES` (`id`, `TITLE`, `IMPART`, `STARTDATE`, `ENDDATE`, `TEXT`, `AUTHOR_id`) VALUES
(1, 'le sport au feminin', 1, '2023-06-28 11:57:23', '2023-07-28 00:00:00', 'Melanie championne du monde de biathlon', 1),
(2, 'sport- lancer de javelot', 4, '2023-06-28 00:00:00', '2023-07-28 00:00:00', 'Monique vas t-elle nous ramener la coupe à la maison ?', 3),
(3, 'Pizza burratta', 5, '2023-06-28 00:00:00', '2023-07-28 00:00:00', 'Déguster les meilleurs pizzas de Valence', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ARTICLES_has_CATEGORY`
--

CREATE TABLE `ARTICLES_has_CATEGORY` (
  `ARTICLES_id` int(11) NOT NULL,
  `CATEGORY_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `AUTHOR`
--

CREATE TABLE `AUTHOR` (
  `id` int(11) NOT NULL,
  `PSEUDO` varchar(50) NOT NULL,
  `SURNAME` varchar(50) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `AUTHOR`
--

INSERT INTO `AUTHOR` (`id`, `PSEUDO`, `SURNAME`, `NAME`) VALUES
(1, 'Matéo', 'durand', NULL),
(2, 'Valentine', 'Moulin', NULL),
(3, 'Melanie', 'Di Ciccio', NULL),
(4, 'Monique', 'Brazil', NULL),
(5, 'Jean', 'Marc', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORY`
--

CREATE TABLE `CATEGORY` (
  `id` int(11) NOT NULL,
  `CAT` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `CATEGORY`
--

INSERT INTO `CATEGORY` (`id`, `CAT`) VALUES
(1, 'loisir'),
(2, 'sport'),
(3, 'cuisine'),
(5, 'mode'),
(6, 'psycho');

-- --------------------------------------------------------

--
-- Structure de la table `COMMENT`
--

CREATE TABLE `COMMENT` (
  `id` int(11) NOT NULL,
  `COM` varchar(150) NOT NULL,
  `DATECOM` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AUTHOR_id` int(11) NOT NULL,
  `ARTICLES_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `COMMENT`
--

INSERT INTO `COMMENT` (`id`, `COM`, `DATECOM`, `AUTHOR_id`, `ARTICLES_id`) VALUES
(1, 'bravo', '2023-06-28 11:54:22', 1, 1),
(2, 'sans avis', '2023-06-28 11:54:46', 4, 3),
(3, 'Genial !', '2023-06-28 11:55:27', 1, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ARTICLES`
--
ALTER TABLE `ARTICLES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ARTICLES_AUTHOR1_idx` (`AUTHOR_id`);

--
-- Index pour la table `ARTICLES_has_CATEGORY`
--
ALTER TABLE `ARTICLES_has_CATEGORY`
  ADD PRIMARY KEY (`ARTICLES_id`,`CATEGORY_id`),
  ADD KEY `fk_ARTICLES_has_CATEGORY_CATEGORY1_idx` (`CATEGORY_id`),
  ADD KEY `fk_ARTICLES_has_CATEGORY_ARTICLES_idx` (`ARTICLES_id`);

--
-- Index pour la table `AUTHOR`
--
ALTER TABLE `AUTHOR`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PSEUDO_UNIQUE` (`PSEUDO`);

--
-- Index pour la table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `COMMENT`
--
ALTER TABLE `COMMENT`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_COMMENT_AUTHOR1_idx` (`AUTHOR_id`),
  ADD KEY `fk_COMMENT_ARTICLES1_idx` (`ARTICLES_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ARTICLES`
--
ALTER TABLE `ARTICLES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `AUTHOR`
--
ALTER TABLE `AUTHOR`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `COMMENT`
--
ALTER TABLE `COMMENT`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ARTICLES`
--
ALTER TABLE `ARTICLES`
  ADD CONSTRAINT `fk_ARTICLES_AUTHOR1` FOREIGN KEY (`AUTHOR_id`) REFERENCES `AUTHOR` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ARTICLES_has_CATEGORY`
--
ALTER TABLE `ARTICLES_has_CATEGORY`
  ADD CONSTRAINT `fk_ARTICLES_has_CATEGORY_ARTICLES` FOREIGN KEY (`ARTICLES_id`) REFERENCES `ARTICLES` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ARTICLES_has_CATEGORY_CATEGORY1` FOREIGN KEY (`CATEGORY_id`) REFERENCES `CATEGORY` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `COMMENT`
--
ALTER TABLE `COMMENT`
  ADD CONSTRAINT `fk_COMMENT_ARTICLES1` FOREIGN KEY (`ARTICLES_id`) REFERENCES `ARTICLES` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_COMMENT_AUTHOR1` FOREIGN KEY (`AUTHOR_id`) REFERENCES `AUTHOR` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
