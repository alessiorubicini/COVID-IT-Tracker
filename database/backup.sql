-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 05, 2021 at 09:19 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `covid_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `Prevede`
--

CREATE TABLE `Prevede` (
  `id` int(11) NOT NULL,
  `idZona` int(11) NOT NULL,
  `idRegola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Prevede`
--

INSERT INTO `Prevede` (`id`, `idZona`, `idRegola`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 1),
(4, 3, 3),
(5, 2, 4),
(6, 1, 5),
(7, 4, 6),
(8, 3, 7),
(9, 2, 7),
(10, 1, 9),
(11, 4, 10),
(12, 3, 11),
(13, 2, 12),
(14, 1, 12),
(15, 4, 13),
(16, 3, 16),
(17, 2, 16),
(18, 1, 17),
(19, 4, 18),
(20, 3, 21),
(21, 2, 22),
(22, 1, 22),
(23, 4, 23);

-- --------------------------------------------------------

--
-- Table structure for table `Regioni`
--

CREATE TABLE `Regioni` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `colore` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Regioni`
--

INSERT INTO `Regioni` (`id`, `nome`, `colore`) VALUES
(1, 'Piemonte', 'Arancione'),
(2, 'Valle d\'Aosta', 'Giallo'),
(3, 'Lombardia', 'Arancione'),
(5, 'Veneto', 'Giallo'),
(6, 'Friuli Venezia Giulia', 'Giallo'),
(7, 'Liguria', 'Giallo'),
(8, 'Emilia-Romagna', 'Arancione'),
(9, 'Toscana', 'Arancione'),
(10, 'Umbria', 'Arancione'),
(11, 'Marche', 'Arancione'),
(12, 'Lazio', 'Giallo'),
(13, 'Abruzzo', 'Arancione'),
(14, 'Molise', 'Rosso'),
(15, 'Campania', 'Arancione'),
(16, 'Puglia', 'Giallo'),
(17, 'Basilicata', 'Rosso'),
(18, 'Calabria', 'Giallo'),
(19, 'Sicilia', 'Giallo'),
(20, 'Sardegna', 'Bianco'),
(21, 'P.A. Bolzano', 'Arancione'),
(22, 'P.A. Trento', 'Arancione');

-- --------------------------------------------------------

--
-- Table structure for table `Regole`
--

CREATE TABLE `Regole` (
  `id` int(11) NOT NULL,
  `campo` varchar(30) NOT NULL,
  `descrizione` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Regole`
--

INSERT INTO `Regole` (`id`, `campo`, `descrizione`) VALUES
(1, 'Scuola', 'Dal 6 marzo, si prevede nelle zone rosse la sospensione dell’attività in presenza delle scuole di ogni ordine e grado, comprese le scuole dell’infanzia ed elementari. Resta garantita la possibilità di svolgere attività in presenza per gli alunni con disabilità e con bisogni educativi speciali.'),
(2, 'Scuola', 'I Presidenti delle regioni potranno disporre la sospensione dell’attività scolastica: nelle aree in cui abbiano adottato misure più stringenti per via della gravità delle varianti, nelle zone in cui vi siano più di 250 contagi ogni 100mila abitanti nell’arco di 7 giorni o nel caso di una eccezionale situazione di peggioramento del quadro epidemiologico.'),
(3, 'VisiteAmiciParenti', 'Visite vietate in ogni caso.'),
(4, 'VisiteAmiciParenti', 'Visite consentite dalle 5 alle 22 una volta al giorno rimanendo nel proprio comune di residenza e nei limiti\r\ndi al massimo 2 persone non conviventi eccetto minori di 14 anni.'),
(5, 'VisiteAmiciParenti', 'Visite consentite dalle 5 alle 22 una volta al giorno rimanendo nella propria regione e nei limiti\r\ndi al massimo 2 persone non conviventi eccetto minori di 14 anni.'),
(6, 'VisiteAmiciParenti', 'Consentiti nella regione senza limiti.'),
(7, 'BarRistoranti', 'Bar e ristoranti chiusi.\r\nAsporto sempre consentito fino alle 22 e le consegne a domicilio fino a chiusura.\r\nDopo le 18 vietato il consumo nei luoghi pubblici.'),
(9, 'BarRistoranti', 'Aperti dalle 5 alle 18. Massimo 4 persone al tavolino salvo che siano tutti conviventi.\r\nAsporto sempre consentito fino alle 22 e le consegne a domicilio fino a chiusura.\r\nDopo le 18 vietato il consumo nei luoghi pubblici.'),
(10, 'BarRistoranti', 'Bar e ristoranti aperti. Consentito il consumo nei luoghi pubblici dopo le 18.'),
(11, 'Negozi', 'Chiusi i negozi di abbigliamento, di calzature e le gioiellerie, i mercati, salvo la vendita di soli generi alimentari, prodotti agricoli e florovivaistici, parrucchieri, barbieri e centri estetici.'),
(12, 'Negozi', 'Aperti ma con mercati e centri commerciali chiusi nei festivi e prefestivi.'),
(13, 'Negozi', 'Aperti.'),
(16, 'Musei', 'Mostre e musei chiusi.'),
(17, 'Musei', 'Mostre e musei aperti nei giorni feriali (dal lunedì al venerdì).'),
(18, 'Musei', 'Mostre e musei aperti.'),
(19, 'SpostamentiEstero', 'Si amplia il novero dei Paesi interessati della sperimentazione dei voli cosiddetti “COVID tested”. A chi è stato in Brasile nei 14 giorni precedenti è consentito l’ingresso in Italia anche per raggiungere domicilio, abitazione o residenza dei figli minori.'),
(20, 'SpostamentiRegioni', 'Confermato, fino al 27 marzo, il divieto già in vigore di spostarsi tra regioni o province autonome diverse, con l’eccezione degli spostamenti dovuti a motivi di lavoro, salute o necessità.\r\n\r\nIn zona arancione e gialla si può andare nelle seconde case che si trovano fuori regione. \r\nNon si può andare in una seconda abitazione che si trova in zona rossa o se ci si trova in zona rossa.'),
(21, 'Sport', 'In zona rossa si può svolgere attività motoria solo individualmente in prossimità della propria abitazione con obbligo di mascherina. Restano chiuse ovunque palestre e piscine. Si può svolgere attività sportiva esclusivamente all’aperto e in forma individuale.'),
(22, 'Sport', 'L’attività sportiva o motoria all’aperto, anche in aree attrezzate e parchi pubblici è consentita. Palestre e piscine chiuse.'),
(23, 'Sport', 'Riapertura di palestre e piscine e attività sportiva consentita (ancora da confermare).');

-- --------------------------------------------------------

--
-- Table structure for table `Zone`
--

CREATE TABLE `Zone` (
  `id` int(11) NOT NULL,
  `colore` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Zone`
--

INSERT INTO `Zone` (`id`, `colore`) VALUES
(2, 'Arancione'),
(4, 'Bianco'),
(1, 'Giallo'),
(3, 'Rosso');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Prevede`
--
ALTER TABLE `Prevede`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idZona` (`idZona`),
  ADD KEY `idRegola` (`idRegola`);

--
-- Indexes for table `Regioni`
--
ALTER TABLE `Regioni`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `colore` (`colore`);

--
-- Indexes for table `Regole`
--
ALTER TABLE `Regole`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Zone`
--
ALTER TABLE `Zone`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `colore` (`colore`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Regole`
--
ALTER TABLE `Regole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Prevede`
--
ALTER TABLE `Prevede`
  ADD CONSTRAINT `prevede_ibfk_1` FOREIGN KEY (`idZona`) REFERENCES `Zone` (`id`),
  ADD CONSTRAINT `prevede_ibfk_2` FOREIGN KEY (`idRegola`) REFERENCES `Regole` (`id`);

--
-- Constraints for table `Regioni`
--
ALTER TABLE `Regioni`
  ADD CONSTRAINT `regioni_ibfk_1` FOREIGN KEY (`colore`) REFERENCES `Zone` (`colore`);
