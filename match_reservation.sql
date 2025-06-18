-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 18 juin 2025 à 16:58
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `match_reservation`
--

-- --------------------------------------------------------

--
-- Structure de la table `activites`
--

CREATE TABLE `activites` (
  `id` int(11) NOT NULL,
  `lieu` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ville` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `activites`
--

INSERT INTO `activites` (`id`, `lieu`, `type`, `titre`, `description`, `ville`) VALUES
(4, ' États-Unis', NULL, 'Visite de la Statue de la Liberté', 'Excursion en ferry vers l’île Liberty avec accès au musée et panorama sur Manhattan.', 'New York City'),
(5, 'États-Unis', NULL, 'Balade à Hollywood', 'Explorez le Walk of Fame, les studios de cinéma et le célèbre panneau Hollywood.', ' Los Angeles'),
(6, ' États-Unis', NULL, 'Martin Luther King Jr. National Park', ' Découverte de la vie et de l’œuvre de Martin Luther King dans son quartier natal.\r\n\r\n', 'Atlanta'),
(7, 'Canada', NULL, ' Tour CN', 'Montez dans l’une des plus hautes tours du monde pour une vue à 360° sur la ville.', ' Toronto'),
(8, 'Canada', NULL, 'Balade au parc Stanley', ' Profitez d’un grand parc côtier avec sentiers, plages et pistes cyclables.', ' Vancouver'),
(9, 'Canada', NULL, 'Festival de Jazz de Montréal', ' Concerts en plein air gratuits dans un des plus grands festivals de musique au monde.', 'Montréal'),
(10, 'Mexique', NULL, ' Visite des ruines de Teotihuacan', 'Découvrez les pyramides du Soleil et de la Lune à proximité de la capitale.', 'Mexico City'),
(11, ' Mexique', NULL, 'Route du Tequila', 'Visitez des distilleries traditionnelles et dégustez les meilleures tequilas du pays.', 'Guadalajara'),
(12, 'Mexique', NULL, 'Randonnée au Parc Nacional Cumbres', 'Partez en randonnée dans les montagnes et admirez la faune mexicaine.\r\n\r\n', 'Monterrey');

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `nom`, `email`, `mot_de_passe`, `date_creation`) VALUES
(1, 'Admin', 'admin@site.com', '$2y$10$2854cRXJbhhMpoTaWaZQxuakwDGCN9Py9MuoavG5yYO5FrNZe4ue2', '2025-06-15 10:40:26');

-- --------------------------------------------------------

--
-- Structure de la table `classements`
--

CREATE TABLE `classements` (
  `id` int(11) NOT NULL,
  `equipe_id` int(11) NOT NULL,
  `points` int(11) DEFAULT 0,
  `joues` int(11) DEFAULT 0,
  `gagnes` int(11) DEFAULT 0,
  `nuls` int(11) DEFAULT 0,
  `perdues` int(11) DEFAULT 0,
  `buts_marques` int(11) DEFAULT 0,
  `buts_encaisses` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--

CREATE TABLE `equipes` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `groupe` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipes`
--

INSERT INTO `equipes` (`id`, `nom`, `groupe`) VALUES
(1, 'États‑Unis', ''),
(2, 'Canada', ''),
(3, 'Mexique', ''),
(4, 'Japon', 'AF'),
(5, 'Iran', 'AF'),
(6, 'Corée du Sud', 'AF'),
(7, 'Jordanie', 'AF'),
(8, 'Ouzbékistan', 'AF'),
(9, 'Australie', 'AF'),
(10, 'Nouvelle-Zélande', 'OF'),
(11, 'Argentine', 'CO'),
(12, 'Brésil', 'CO'),
(13, 'Équateur', 'CO'),
(14, 'A2', ''),
(15, 'A1', ''),
(16, 'A3', ''),
(17, 'A4', ''),
(18, 'C1', ''),
(19, 'C3', ''),
(20, 'D3', ''),
(21, 'D4', ''),
(22, 'B2', ''),
(23, 'D2', ''),
(24, 'Bolivie', ''),
(25, 'Chili', ''),
(26, 'Uruguay', ''),
(27, 'Venezuela', ''),
(28, 'Colombie', ''),
(29, 'Paraguay', ''),
(30, 'Pérou', '');

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

CREATE TABLE `matchs` (
  `id` int(11) NOT NULL,
  `date_match` date NOT NULL,
  `heure_match` time NOT NULL,
  `lieu` varchar(100) NOT NULL,
  `equipe1_id` int(11) DEFAULT NULL,
  `equipe2_id` int(11) DEFAULT NULL,
  `stade_id` int(11) DEFAULT NULL,
  `score_equipe1` int(11) DEFAULT NULL,
  `score_equipe2` int(11) DEFAULT NULL,
  `phase` varchar(100) DEFAULT NULL,
  `groupe` varchar(10) DEFAULT NULL,
  `categorie` varchar(100) DEFAULT 'Coupe du Monde 2026'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `matchs`
--

INSERT INTO `matchs` (`id`, `date_match`, `heure_match`, `lieu`, `equipe1_id`, `equipe2_id`, `stade_id`, `score_equipe1`, `score_equipe2`, `phase`, `groupe`, `categorie`) VALUES
(1, '2025-06-11', '21:00:00', 'France', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(3, '2025-06-07', '18:00:00', 'Ta’ Qali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(4, '2025-06-07', '21:45:00', 'Helsinki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(5, '2025-07-10', '20:45:00', 'Groningen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(6, '2025-06-10', '21:45:00', 'Helsinki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(7, '2026-06-11', '21:00:00', '', 3, 14, 1, NULL, NULL, 'phase de groupes', 'A', 'Coupe du Monde 2026'),
(8, '2026-06-11', '18:00:00', '', 16, 17, 3, NULL, NULL, 'phase de groupes', 'A', 'Coupe du Monde 2026'),
(9, '2026-06-13', '20:00:00', '', 18, 19, 15, NULL, NULL, 'phase de groupes', 'C', 'Coupe du Monde 2026'),
(10, '2026-06-13', '14:00:00', '', 20, 21, 5, NULL, NULL, 'phase de groupes', 'D', 'Coupe du Monde 2026'),
(11, '2026-06-12', '18:00:00', '', 2, 22, 4, NULL, NULL, 'phase de groupes', 'B', 'Coupe du Monde 2026'),
(12, '2026-06-12', '20:00:00', '', 1, 23, 11, NULL, NULL, 'phase de groupes', 'D', 'Coupe du Monde 2026'),
(13, '2025-06-10', '16:00:00', '', 24, 25, 17, NULL, NULL, 'Journée 16 – aller', '---', 'Coupe du Monde 2026'),
(14, '2025-06-10', '19:00:00', '', 26, 27, 18, NULL, NULL, 'Journée 16 – aller', '---', 'Coupe du Monde 2026'),
(15, '2025-06-10', '20:00:00', '', 11, 28, 19, NULL, NULL, 'Journée 16 – aller', '---', 'Coupe du Monde 2026'),
(16, '2025-06-10', '20:45:00', '', 12, 29, 20, NULL, NULL, 'Journée 16 – aller', '---', 'Coupe du Monde 2026'),
(17, '2025-06-10', '21:30:00', '', 30, 13, 21, NULL, NULL, 'Journée 16 – aller', '---', 'Coupe du Monde 2026'),
(18, '2025-06-20', '00:06:00', 'france', 11, 25, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(19, '2025-06-18', '00:07:00', 'france', 15, 15, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(20, '2025-06-19', '02:40:00', 'france', 14, 14, NULL, NULL, NULL, NULL, NULL, 'Coupe du Monde 2026'),
(21, '2025-06-19', '02:46:00', '', 14, 16, 5, NULL, NULL, 'Phase de groupe', 'A', 'Coupe du Monde 2026');

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `message` text NOT NULL,
  `date_envoi` datetime DEFAULT current_timestamp(),
  `reponse` text DEFAULT NULL,
  `date_reponse` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `utilisateur_id`, `nom`, `email`, `telephone`, `message`, `date_envoi`, `reponse`, `date_reponse`) VALUES
(5, 4, 'Meriem Moumene', 'meryemmoumene11@gmail.com', '0705884319', 'message1', '2025-06-18 15:57:11', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `paiements`
--

CREATE TABLE `paiements` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `montant` float NOT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `date_paiement` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `paiements`
--

INSERT INTO `paiements` (`id`, `reservation_id`, `transaction_id`, `montant`, `statut`, `date_paiement`) VALUES
(8, 22, NULL, 100, 'completed', '2025-06-14 22:55:10'),
(9, 23, NULL, 100, 'completed', '2025-06-14 22:56:48'),
(10, 24, NULL, 100, 'completed', '2025-06-14 23:00:58'),
(11, 25, NULL, 250, 'completed', '2025-06-14 23:08:31'),
(12, 26, NULL, 250, 'completed', '2025-06-14 23:24:25'),
(13, 27, NULL, 250, 'completed', '2025-06-15 00:02:18'),
(14, 28, NULL, 100, 'completed', '2025-06-15 00:12:24'),
(15, 29, NULL, 100, 'completed', '2025-06-16 13:37:09'),
(16, 30, NULL, 100, 'completed', '2025-06-16 15:50:25'),
(17, 31, NULL, 100, 'completed', '2025-06-16 17:38:46'),
(18, 32, NULL, 100, 'completed', '2025-06-17 14:17:33'),
(19, 33, NULL, 100, 'completed', '2025-06-17 14:57:08'),
(20, 34, NULL, 100, 'completed', '2025-06-18 12:37:29');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1,
  `prix_total` float NOT NULL,
  `date_reservation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `utilisateur_id`, `ticket_id`, `quantite`, `prix_total`, `date_reservation`) VALUES
(22, 4, 1, 1, 100, '2025-06-14 22:55:10'),
(23, 4, 1, 1, 100, '2025-06-14 22:56:48'),
(24, 4, 1, 1, 100, '2025-06-14 23:00:58'),
(25, 4, 3, 1, 250, '2025-06-14 23:08:31'),
(26, 4, 3, 1, 250, '2025-06-14 23:24:25'),
(27, 4, 3, 1, 250, '2025-06-15 00:02:18'),
(28, 4, 1, 1, 100, '2025-06-15 00:12:24'),
(29, 4, 1, 1, 100, '2025-06-16 13:37:09'),
(30, 4, 1, 1, 100, '2025-06-16 15:50:25'),
(31, 4, 1, 1, 100, '2025-06-16 17:38:46'),
(32, 4, 1, 1, 100, '2025-06-17 14:17:33'),
(33, 4, 1, 1, 100, '2025-06-17 14:57:08'),
(34, 4, 2, 1, 100, '2025-06-18 12:37:29');

-- --------------------------------------------------------

--
-- Structure de la table `stades`
--

CREATE TABLE `stades` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `capacite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stades`
--

INSERT INTO `stades` (`id`, `nom`, `ville`, `capacite`) VALUES
(1, 'Estadio Azteca', 'Mexico City, Mexique', 87523),
(2, 'Estadio BBVA', 'Monterrey, Mexique', 53500),
(3, 'Estadio Akron', 'Zapopan (Guadalajara), Mexique', 49850),
(4, 'BMO Field', 'Toronto, Canada', 30000),
(5, 'BC Place', 'Vancouver, Canada', 54500),
(6, 'MetLife Stadium', 'East Rutherford (New Jersey, USA)', 82500),
(7, 'AT&T Stadium', 'Arlington (Dallas, USA)', 80000),
(8, 'Arrowhead Stadium', 'Kansas City, USA', 76416),
(9, 'NRG Stadium', 'Houston, USA', 72220),
(10, 'Mercedes-Benz Stadium', 'Atlanta, USA', 71000),
(11, 'SoFi Stadium', 'Inglewood (Los Angeles), USA', 70240),
(12, 'Lincoln Financial Field', 'Philadelphia, USA', 69796),
(13, 'Lumen Field', 'Seattle, USA', 69000),
(14, 'Levi’s Stadium', 'Santa Clara (SF Bay Area), USA', 68500),
(15, 'Gillette Stadium', 'Foxborough (Boston), USA', 65878),
(16, 'Hard Rock Stadium', 'Miami Gardens, USA', 64767),
(17, 'Estadio Municipal Villa Ingenio', 'El Alto (La Paz), Bolivie', 0),
(18, 'Estadio Centenario', 'Montevideo, Uruguay', 0),
(19, 'Estadio Mâs Monumental (River Plate)', 'Buenos Aires, Argentine', 0),
(20, 'Neo Química Arena', 'São Paulo, Brésil', 0),
(21, 'Estadio Nacional', 'Lima, Pérou', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `prix_base` float NOT NULL,
  `entree` varchar(10) NOT NULL,
  `numero_place` varchar(20) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tickets`
--

INSERT INTO `tickets` (`id`, `match_id`, `type`, `prix_base`, `entree`, `numero_place`, `description`) VALUES
(1, 7, 'Standard', 100, 'A', 'A12', 'Place standard derrière les buts.'),
(2, 7, 'Standard', 100, 'A', 'A13', 'Place standard derrière les buts.'),
(3, 7, 'VIP', 250, 'B', 'B01', 'Accès VIP avec buffet et siège premium.'),
(4, 7, 'VIP', 250, 'B', 'B02', 'Accès VIP avec buffet et siège premium.'),
(5, 7, 'Famille', 80, 'C', 'C10', 'Zone famille, proche des toilettes et snack.'),
(6, 7, 'Handicapé', 50, 'D', 'D01', 'Espace accessible pour personnes à mobilité réduite.');

-- --------------------------------------------------------

--
-- Structure de la table `transports`
--

CREATE TABLE `transports` (
  `id` int(11) NOT NULL,
  `nom_transport` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `stade_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transports`
--

INSERT INTO `transports` (`id`, `nom_transport`, `description`, `contact`, `stade_id`) VALUES
(1, 'Bus Ligne 1', 'Bus qui dessert le stade toutes les 30 minutes.', 'Téléphone : 0123456789', NULL),
(2, 'Métro Station Stade', 'Station de métro à 5 minutes du stade.', 'Email : contact@metro.com', NULL),
(3, 'Bus Azteca Express', 'Navette rapide reliant le centre-ville à Estadio Azteca', '+52 55 1234 5678', 1),
(4, 'Metro Monterrey L3', 'Ligne de métro directe pour accéder à Estadio BBVA', '+52 81 9876 5432', 2),
(5, 'Navette Jalisco', 'Transport dédié les jours de match vers Estadio Akron', '+52 33 4567 8910', 3),
(6, 'Tramway Toronto Sud', 'Ligne de tramway vers BMO Field depuis Union Station', '+1 416 555 0101', 4),
(7, 'SkyTrain Expo Line', 'Accès rapide à BC Place via SkyTrain', '+1 604 555 0202', 5),
(8, 'Metro North NJ Line', 'Ligne ferroviaire menant au MetLife Stadium', '+1 201 555 1111', 6),
(9, 'Navette Arlington Express', 'Bus spécial depuis Dallas vers AT&T Stadium', '+1 214 555 2222', 7),
(10, 'Bus Kansas City 15', 'Service de bus local vers Arrowhead Stadium', '+1 816 555 3333', 8),
(11, 'Metro Houston Red Line', 'Métro léger pour rejoindre le NRG Stadium', '+1 713 555 4444', 9),
(12, 'MARTA Rail Ligne Or', 'Métro d’Atlanta pour le Mercedes-Benz Stadium', '+1 404 555 5555', 10),
(13, 'LAX Game Shuttle', 'Navette depuis l’aéroport vers SoFi Stadium', '+1 310 555 6666', 11),
(14, 'SEPTA Ligne C', 'Train de banlieue pour Lincoln Financial Field', '+1 215 555 7777', 12),
(15, 'Seattle Link Light Rail', 'Tram rapide pour Lumen Field', '+1 206 555 8888', 13),
(16, 'Caltrain Express', 'Train depuis San Francisco vers Levi’s Stadium', '+1 408 555 9999', 14),
(17, 'MBTA Foxborough', 'Train régional pour Gillette Stadium', '+1 617 555 0000', 15),
(18, 'Miami Metrobus Ligne 7', 'Bus desservant le Hard Rock Stadium', '+1 305 555 1212', 16),
(19, 'Teleférico El Alto', 'Téléphérique urbain vers Estadio Municipal Villa Ingenio', '+591 2 555 3030', 17),
(20, 'Bus Montevideo L2', 'Transport public vers Estadio Centenario', '+598 2900 1111', 18),
(21, 'Subte Línea D', 'Métro de Buenos Aires jusqu’au Monumental', '+54 11 5555 1212', 19),
(22, 'Train Corinthians Express', 'Train spécial vers Neo Química Arena', '+55 11 3333 4444', 20),
(23, 'Metro Lima Central', 'Ligne directe pour rejoindre Estadio Nacional', '+51 1 222 3333', 21);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) NOT NULL,
  `telephone` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `telephone`, `email`, `mot_de_passe`, `date_inscription`) VALUES
(1, 'Alice Dupont', '', 0, 'alice@example.com', '123', '2025-06-12 15:12:25'),
(2, 'Bob Martin', '', 0, 'bob@example.com', '$2y$10$NDs2c9m7p2NElTmZL6pTUOaB1mbkBRXhStF.YhC2AIh4h81MG6iD6', '2025-06-12 15:12:25'),
(3, 'Claire Leblanc', '', 0, 'claire@example.com', '12345', '2025-06-12 15:12:25'),
(4, 'Moumene', 'Meri', 0, 'meryemmoumene11@gmail.com', '$2y$10$Foe1slEKht6O5ZBgmby99.3OlTA7/a4TnIb/wU.CfWhbcPhiuKqVa', '2025-06-12 21:49:33'),
(5, 'a aa', '', 0, 'aa@example.com', '$2y$10$6DVY/odk0xNkNuo9TDj1AeGavlvVoydKKKgeuKQ6V9j1mnz.EySI.', '2025-06-12 22:53:17'),
(6, 'bb', '', 0, 'bb@example.com', '$2y$10$5tqQnK3ZzZfvA4W3XM3wOOv5v2CnY27mBGhBa15Ge3QKJJmE5Rrz2', '2025-06-13 14:29:46'),
(7, 'El Mekki', '', 0, 'salimaelmekki11@gmail.com', '$2y$10$Pyzh1jlqWAarIxX355gbjuvFMrkiWmfoptSsWEDFEmSZPJujmztE.', '2025-06-12 17:28:14'),
(8, 'salima', '', 0, 'salimasalima@gmail.com', '$2y$10$.qBHWuaA9OMPqJEUAr2KX.LcWIuWA72OVA95TZtuuhXmldXpRhje.', '2025-06-14 21:31:19'),
(9, 'EL MEKKI', '', 0, 'salimaelmekki@gmail.com', '$2y$10$UsrhA.ZbBZ2wLbQGFxSBUOfCiPZHRS0dawtOlaa./uWHXXdAeh.i6', '2025-06-15 10:06:56'),
(10, 'admin', '', 0, 'admin@site.com', '$2y$10$VHMRcYKrngL6rHVngYsB4.kWV0fXQTIN6XxQ7JKfc.MKkCtm9n0bK', '2025-06-15 11:58:39');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activites`
--
ALTER TABLE `activites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `classements`
--
ALTER TABLE `classements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_classements_equipe` (`equipe_id`);

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipe1_id` (`equipe1_id`),
  ADD KEY `equipe2_id` (`equipe2_id`),
  ADD KEY `stade_id` (`stade_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Index pour la table `stades`
--
ALTER TABLE `stades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_id` (`match_id`);

--
-- Index pour la table `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stade_id` (`stade_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activites`
--
ALTER TABLE `activites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `classements`
--
ALTER TABLE `classements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `matchs`
--
ALTER TABLE `matchs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `stades`
--
ALTER TABLE `stades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `transports`
--
ALTER TABLE `transports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classements`
--
ALTER TABLE `classements`
  ADD CONSTRAINT `fk_classements_equipe` FOREIGN KEY (`equipe_id`) REFERENCES `equipes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD CONSTRAINT `matchs_ibfk_1` FOREIGN KEY (`equipe1_id`) REFERENCES `equipes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `matchs_ibfk_2` FOREIGN KEY (`equipe2_id`) REFERENCES `equipes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `matchs_ibfk_3` FOREIGN KEY (`stade_id`) REFERENCES `stades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD CONSTRAINT `paiements_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matchs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `transports`
--
ALTER TABLE `transports`
  ADD CONSTRAINT `transports_ibfk_1` FOREIGN KEY (`stade_id`) REFERENCES `stades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
