-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 31 déc. 2022 à 16:53
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shipcruisetour`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id_ch` int(11) NOT NULL,
  `type_ch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `croisiere`
--

CREATE TABLE `croisiere` (
  `id_cr` int(11) NOT NULL,
  `port_dar` int(11) NOT NULL,
  `port_dep` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `nb_nuit` int(11) NOT NULL,
  `prix_cr` float NOT NULL,
  `date_dep` date NOT NULL,
  `name_cr` varchar(255) NOT NULL,
  `id_nav` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `croisiere`
--

INSERT INTO `croisiere` (`id_cr`, `port_dar`, `port_dep`, `image`, `nb_nuit`, `prix_cr`, `date_dep`, `name_cr`, `id_nav`) VALUES
(2, 1, 1, 'amazon.jpg', 2, 2000, '2022-12-27', 'marouane', 1);

-- --------------------------------------------------------

--
-- Structure de la table `narive`
--

CREATE TABLE `narive` (
  `id_n` int(11) NOT NULL,
  `name_n` varchar(255) NOT NULL,
  `nb_ch` int(11) NOT NULL,
  `nb_pl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `narive`
--

INSERT INTO `narive` (`id_n`, `name_n`, `nb_ch`, `nb_pl`) VALUES
(1, 'amazon', 2222, 222);

-- --------------------------------------------------------

--
-- Structure de la table `port`
--

CREATE TABLE `port` (
  `id_p` int(11) NOT NULL,
  `nameP` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `port`
--

INSERT INTO `port` (`id_p`, `nameP`) VALUES
(1, 'aaaaaaaaaaaaaaa');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_re` int(11) NOT NULL,
  `date_re` date NOT NULL,
  `prix_re` float NOT NULL,
  `id_cr` int(11) NOT NULL COMMENT 'id de narive',
  `id_user` int(11) NOT NULL,
  `id_ch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `typechambre`
--

CREATE TABLE `typechambre` (
  `id_t_ch` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Prix` float NOT NULL,
  `Capacite` int(11) NOT NULL COMMENT 'nombre des gens dans chaque chambre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typechambre`
--

INSERT INTO `typechambre` (`id_t_ch`, `Name`, `Prix`, `Capacite`) VALUES
(1, 'sans chambre', 0, 0),
(2, 'aaaaaaa\r\n', 2000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_u` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for members / 1 for admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_u`, `userName`, `Email`, `Password`, `Role`) VALUES
(1, 'marouane', 'uanemaro216@gmail.com', '$2y$10$qHrkUT/M8b0QGlOzZm/qB..H7Yx1FLoHVG4eX6kIC7.JEfl.gEHZ6', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id_ch`),
  ADD KEY `typeofchambre` (`type_ch`);

--
-- Index pour la table `croisiere`
--
ALTER TABLE `croisiere`
  ADD PRIMARY KEY (`id_cr`),
  ADD KEY `port_de_depart` (`port_dep`),
  ADD KEY `port_de_arriver` (`port_dar`),
  ADD KEY `id_navire_contr` (`id_nav`);

--
-- Index pour la table `narive`
--
ALTER TABLE `narive`
  ADD PRIMARY KEY (`id_n`);

--
-- Index pour la table `port`
--
ALTER TABLE `port`
  ADD PRIMARY KEY (`id_p`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_re`),
  ADD KEY `id_narive` (`id_cr`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_chambre` (`id_ch`);

--
-- Index pour la table `typechambre`
--
ALTER TABLE `typechambre`
  ADD PRIMARY KEY (`id_t_ch`),
  ADD KEY `Prix` (`Prix`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_u`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id_ch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `croisiere`
--
ALTER TABLE `croisiere`
  MODIFY `id_cr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `narive`
--
ALTER TABLE `narive`
  MODIFY `id_n` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `port`
--
ALTER TABLE `port`
  MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_re` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `typechambre`
--
ALTER TABLE `typechambre`
  MODIFY `id_t_ch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `typeofchambre` FOREIGN KEY (`type_ch`) REFERENCES `typechambre` (`id_t_ch`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `croisiere`
--
ALTER TABLE `croisiere`
  ADD CONSTRAINT `id_navire_contr` FOREIGN KEY (`id_nav`) REFERENCES `narive` (`id_n`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `port_de_arriver` FOREIGN KEY (`port_dar`) REFERENCES `port` (`id_p`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `port_de_depart` FOREIGN KEY (`port_dep`) REFERENCES `port` (`id_p`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `id_chambre` FOREIGN KEY (`id_ch`) REFERENCES `chambre` (`id_ch`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_cruise` FOREIGN KEY (`id_cr`) REFERENCES `croisiere` (`id_cr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_u`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
