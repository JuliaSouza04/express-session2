-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para produtos_de_limpaza
CREATE DATABASE IF NOT EXISTS `produtos_de_limpaza` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `produtos_de_limpaza`;

-- Copiando estrutura para tabela produtos_de_limpaza.cadastro_produtos
CREATE TABLE IF NOT EXISTS `cadastro_produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `volume_ml` int(11) NOT NULL,
  `tipo_embalagem` varchar(50) NOT NULL,
  `aplicacao` varchar(50) NOT NULL,
  `estoque` int(11) NOT NULL,
  `estoque_minimo` int(11) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela produtos_de_limpaza.cadastro_produtos: ~3 rows (aproximadamente)
INSERT INTO `cadastro_produtos` (`id_produto`, `nome`, `marca`, `volume_ml`, `tipo_embalagem`, `aplicacao`, `estoque`, `estoque_minimo`) VALUES
	(1, 'Detergente', 'Ypê', 500, 'Plástica', 'Doméstica', 10, 5),
	(2, 'Amaciante', 'Coala', 1000, 'Plástica', 'Doméstica', 15, 5),
	(3, 'Shamppo', 'Elseve', 400, 'Plástica', 'Doméstica', 20, 5);

-- Copiando estrutura para tabela produtos_de_limpaza.registro de saida e entrada
CREATE TABLE IF NOT EXISTS `registro de saida e entrada` (
  `id_produto` int(11) NOT NULL,
  `entrada` datetime NOT NULL,
  `saida` datetime NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `id_produto` FOREIGN KEY (`id_produto`) REFERENCES `cadastro_produtos` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela produtos_de_limpaza.registro de saida e entrada: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
