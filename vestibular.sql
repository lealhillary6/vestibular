-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 13-Jun-2018 às 01:45
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `vestibular`
--
CREATE DATABASE IF NOT EXISTS `vestibular` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vestibular`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidade`
--

CREATE TABLE IF NOT EXISTS `cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(100) NOT NULL,
  `cod_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `cod_estado` (`cod_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `cidade`
--

INSERT INTO `cidade` (`id_cidade`, `nome_cidade`, `cod_estado`) VALUES
(1, 'Araraquara', 1),
(2, 'Parati', 2),
(3, 'Rio branco', 3),
(4, 'Pirapozinho do norte', 4),
(5, 'Manaus', 5),
(6, 'Codó', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(100) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id_curso`, `nome_curso`) VALUES
(1, 'Direito'),
(2, 'Medicina'),
(3, 'Emgenharia'),
(4, 'Letras'),
(5, 'ED. Fisica'),
(6, 'Farmacia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id_estado`, `nome_estado`, `uf`) VALUES
(1, 'São paulo', 'SP'),
(2, 'Rio de janeiro', 'RJ'),
(3, 'Acre', 'AC'),
(4, 'Bahia', 'BA'),
(5, 'Amazonas	', 'AM'),
(6, 'Maranhão', 'MA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `faculdade`
--

CREATE TABLE IF NOT EXISTS `faculdade` (
  `id_faculdade` int(11) NOT NULL AUTO_INCREMENT,
  `cod_cidade` int(100) NOT NULL,
  `tipo_faculdade` enum('Publica','Privada') NOT NULL,
  `nome_faculdade` varchar(100) NOT NULL,
  `cod_vestibular` int(11) NOT NULL,
  PRIMARY KEY (`id_faculdade`),
  UNIQUE KEY `cod_vestibular` (`cod_vestibular`),
  KEY `cod_cidade` (`cod_cidade`),
  KEY `cod_vestibular_2` (`cod_vestibular`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `faculdade`
--

INSERT INTO `faculdade` (`id_faculdade`, `cod_cidade`, `tipo_faculdade`, `nome_faculdade`, `cod_vestibular`) VALUES
(3, 1, 'Privada', 'UNIP', 7),
(4, 1, 'Privada', 'UNIARA', 8),
(5, 2, 'Publica', 'UFRJ', 3),
(12, 6, 'Publica', 'IFMA', 6),
(13, 4, 'Publica', 'UFBA', 4),
(14, 5, 'Publica', 'UFAM', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sexo` char(1) NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`cpf`, `nome`, `email`, `sexo`) VALUES
('11111111111', 'João Pereira', 'Joaopereira@email.com', 'M'),
('11111111112', 'Fernanda Mendes', 'fernandamendes@email.com', 'F'),
('11111111113', 'Patricia Lopes ', 'patricialopes@email.com', 'F'),
('11111111114', 'Matheus Endrigo', 'matheusendrigo@email.com', 'M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vestibular`
--

CREATE TABLE IF NOT EXISTS `vestibular` (
  `id_vestibular` int(11) NOT NULL AUTO_INCREMENT,
  `nome_vestibular` varchar(100) NOT NULL,
  `cod_cidade` int(11) NOT NULL,
  PRIMARY KEY (`id_vestibular`),
  KEY `cod_cidade` (`cod_cidade`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `vestibular`
--

INSERT INTO `vestibular` (`id_vestibular`, `nome_vestibular`, `cod_cidade`) VALUES
(1, 'Fatec-RJ', 2),
(2, 'VUNESP', 1),
(3, 'Enem', 3),
(4, 'UFBA', 4),
(5, 'UFAM', 4),
(6, 'IFMA', 6),
(7, 'UNIP', 1),
(8, 'UIARA', 1);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`cod_estado`) REFERENCES `estado` (`id_estado`);

--
-- Limitadores para a tabela `faculdade`
--
ALTER TABLE `faculdade`
  ADD CONSTRAINT `faculdade_ibfk_2` FOREIGN KEY (`cod_cidade`) REFERENCES `cidade` (`id_cidade`),
  ADD CONSTRAINT `faculdade_ibfk_1` FOREIGN KEY (`cod_vestibular`) REFERENCES `vestibular` (`id_vestibular`);

--
-- Limitadores para a tabela `vestibular`
--
ALTER TABLE `vestibular`
  ADD CONSTRAINT `vestibular_ibfk_1` FOREIGN KEY (`cod_cidade`) REFERENCES `cidade` (`id_cidade`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
