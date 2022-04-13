-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Apr 13, 2022 alle 16:55
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestione_corsi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `alunni`
--

CREATE TABLE `alunni` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `anno_nascita` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `alunni`
--

INSERT INTO `alunni` (`id`, `nome`, `cognome`, `anno_nascita`) VALUES
(1, 'Martina', 'Pola', NULL),
(2, 'Francesca', 'Massalini', NULL),
(3, 'Enrico', 'Giorgi', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `docenti`
--

CREATE TABLE `docenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `codice_fiscale` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `docenti`
--

INSERT INTO `docenti` (`id`, `nome`, `cognome`, `codice_fiscale`) VALUES
(1, 'Matteo', 'Arosti', NULL),
(2, 'Andrea', 'Ribuoli', NULL),
(3, 'Gabriella', 'Acerbi', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `frequenze`
--

CREATE TABLE `frequenze` (
  `id` int(11) NOT NULL,
  `alunno_id` int(11) NOT NULL,
  `materia_id` int(11) NOT NULL,
  `media` decimal(7,2) DEFAULT NULL,
  `ore_assenza` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `frequenze`
--

INSERT INTO `frequenze` (`id`, `alunno_id`, `materia_id`, `media`, `ore_assenza`) VALUES
(1, 1, 1, '7.20', 2),
(2, 1, 2, '8.00', 0),
(3, 2, 1, '7.10', 5),
(4, 2, 3, '9.10', 0),
(5, 1, 4, '6.10', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `materie`
--

CREATE TABLE `materie` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `anno` int(4) DEFAULT NULL,
  `ore` int(3) NOT NULL,
  `docente_id` int(11) DEFAULT NULL,
  `docente_fascia` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `materie`
--

INSERT INTO `materie` (`id`, `nome`, `anno`, `ore`, `docente_id`, `docente_fascia`) VALUES
(1, 'Sistemistica', 1, 16, 1, 'B'),
(2, 'Database', 1, 40, 1, 'B'),
(3, 'Fond. Prog.', 2, 80, 2, 'A'),
(4, 'Tecniche di rel.', NULL, 20, 3, 'A');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `alunni`
--
ALTER TABLE `alunni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_cognome_nome` (`cognome`,`nome`);

--
-- Indici per le tabelle `frequenze`
--
ALTER TABLE `frequenze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alunno_id` (`alunno_id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indici per le tabelle `materie`
--
ALTER TABLE `materie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `docente_id` (`docente_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `alunni`
--
ALTER TABLE `alunni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `docenti`
--
ALTER TABLE `docenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `frequenze`
--
ALTER TABLE `frequenze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `materie`
--
ALTER TABLE `materie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `frequenze`
--
ALTER TABLE `frequenze`
  ADD CONSTRAINT `frequenze_ibfk_1` FOREIGN KEY (`alunno_id`) REFERENCES `alunni` (`id`),
  ADD CONSTRAINT `frequenze_ibfk_2` FOREIGN KEY (`materia_id`) REFERENCES `materie` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `materie`
--
ALTER TABLE `materie`
  ADD CONSTRAINT `materie_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docenti` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
