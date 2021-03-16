-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 mars 2021 à 11:27
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `entrepriseisolware`
--

-- --------------------------------------------------------

--
-- Structure de la table `asso_projet_partenaire`
--

DROP TABLE IF EXISTS `asso_projet_partenaire`;
CREATE TABLE IF NOT EXISTS `asso_projet_partenaire` (
  `projet_partenaire` int(11) NOT NULL AUTO_INCREMENT,
  `num_projet` int(11) DEFAULT NULL,
  `num_partenaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`projet_partenaire`),
  KEY `num_projet` (`num_projet`),
  KEY `num_partenaire` (`num_partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `num_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `montant_categorie` double DEFAULT NULL,
  PRIMARY KEY (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emploiye`
--

DROP TABLE IF EXISTS `emploiye`;
CREATE TABLE IF NOT EXISTS `emploiye` (
  `num_emploiye` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emploiye` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `sexe_emploiye` tinyint(1) DEFAULT NULL,
  `num_categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_emploiye`),
  KEY `num_categorie` (`num_categorie`),
  KEY `num_categorie_2` (`num_categorie`),
  KEY `num_categorie_3` (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emplp`
--

DROP TABLE IF EXISTS `emplp`;
CREATE TABLE IF NOT EXISTS `emplp` (
  `emplP` int(11) NOT NULL AUTO_INCREMENT,
  `num_emploiye` int(11) DEFAULT NULL,
  `num_projet` int(11) DEFAULT NULL,
  PRIMARY KEY (`emplP`),
  KEY `num_emploiye` (`num_emploiye`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `empls`
--

DROP TABLE IF EXISTS `empls`;
CREATE TABLE IF NOT EXISTS `empls` (
  `emplS` int(11) NOT NULL AUTO_INCREMENT,
  `num_emploiye` int(11) DEFAULT NULL,
  `num_service` int(11) DEFAULT NULL,
  PRIMARY KEY (`emplS`),
  KEY `num_emploiye` (`num_emploiye`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

DROP TABLE IF EXISTS `partenaire`;
CREATE TABLE IF NOT EXISTS `partenaire` (
  `num_partenaire` int(11) NOT NULL AUTO_INCREMENT,
  `nom_partenaire` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `num_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_partenaire`),
  KEY `num_type` (`num_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `num_pays` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`num_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pays_partenaire`
--

DROP TABLE IF EXISTS `pays_partenaire`;
CREATE TABLE IF NOT EXISTS `pays_partenaire` (
  `projet_partenaire` int(11) NOT NULL AUTO_INCREMENT,
  `num_partenaire` int(11) DEFAULT NULL,
  `num_pays` int(11) DEFAULT NULL,
  PRIMARY KEY (`projet_partenaire`),
  KEY `num_partenaire` (`num_partenaire`),
  KEY `num_pays` (`num_pays`),
  KEY `num_pays_2` (`num_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `num_projet` int(11) NOT NULL AUTO_INCREMENT,
  `nom_projet` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `budget_projet` double DEFAULT NULL,
  `num_emploiye` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_projet`),
  KEY `num_emploiye` (`num_emploiye`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `num_service` int(11) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `num_emploiye` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_service`),
  KEY `num_emploiye` (`num_emploiye`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_parte`
--

DROP TABLE IF EXISTS `type_parte`;
CREATE TABLE IF NOT EXISTS `type_parte` (
  `num_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`num_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `asso_projet_partenaire`
--
ALTER TABLE `asso_projet_partenaire`
  ADD CONSTRAINT `asso_projet_partenaire_ibfk_1` FOREIGN KEY (`projet_partenaire`) REFERENCES `projet` (`num_projet`),
  ADD CONSTRAINT `asso_projet_partenaire_ibfk_2` FOREIGN KEY (`projet_partenaire`) REFERENCES `partenaire` (`num_partenaire`);

--
-- Contraintes pour la table `emploiye`
--
ALTER TABLE `emploiye`
  ADD CONSTRAINT `emploiye_ibfk_1` FOREIGN KEY (`num_emploiye`) REFERENCES `categorie` (`num_categorie`);

--
-- Contraintes pour la table `emplp`
--
ALTER TABLE `emplp`
  ADD CONSTRAINT `emplp_ibfk_1` FOREIGN KEY (`num_emploiye`) REFERENCES `emploiye` (`num_emploiye`);

--
-- Contraintes pour la table `empls`
--
ALTER TABLE `empls`
  ADD CONSTRAINT `empls_ibfk_1` FOREIGN KEY (`num_emploiye`) REFERENCES `emploiye` (`num_emploiye`);

--
-- Contraintes pour la table `partenaire`
--
ALTER TABLE `partenaire`
  ADD CONSTRAINT `partenaire_ibfk_1` FOREIGN KEY (`num_partenaire`) REFERENCES `type_parte` (`num_type`);

--
-- Contraintes pour la table `pays_partenaire`
--
ALTER TABLE `pays_partenaire`
  ADD CONSTRAINT `pays_partenaire_ibfk_1` FOREIGN KEY (`projet_partenaire`) REFERENCES `partenaire` (`num_partenaire`),
  ADD CONSTRAINT `pays_partenaire_ibfk_2` FOREIGN KEY (`projet_partenaire`) REFERENCES `pays` (`num_pays`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`num_emploiye`) REFERENCES `emploiye` (`num_emploiye`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`num_service`) REFERENCES `emploiye` (`num_emploiye`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
