-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Abr-2018 às 23:02
-- Versão do servidor: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unip`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL,
  `nome_curso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL,
  `nome_disciplina` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grade`
--

CREATE TABLE `grade` (
  `idGrade` int(11) NOT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `id_professor` int(11) DEFAULT NULL,
  `id_disciplina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `id` int(11) NOT NULL,
  `nome_professor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala_info`
--

CREATE TABLE `sala_info` (
  `idSala` int(11) NOT NULL,
  `id_tipo_sala` int(11) NOT NULL,
  `nome_sala` int(11) NOT NULL,
  `bloco` varchar(2) NOT NULL,
  `andar` int(11) NOT NULL,
  `qnto_lugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sala_local`
--

CREATE TABLE `sala_local` (
  `idLocal` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `id_grade` int(11) NOT NULL,
  `periodoLocal` int(11) NOT NULL,
  `dia_semana` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_sala`
--

CREATE TABLE `tipo_sala` (
  `idTipoSala` int(11) NOT NULL,
  `nome_tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `idTurma` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `turma_nome` varchar(15) NOT NULL,
  `qnto_aluno` int(11) NOT NULL,
  `periodo_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_adm`
--

CREATE TABLE `usuario_adm` (
  `idUsuario` int(11) NOT NULL,
  `nome_usuario` varchar(50) NOT NULL,
  `senha` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`idDisciplina`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`idGrade`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `fk_id_professor` (`id_professor`),
  ADD KEY `fk_id_disciplina` (`id_disciplina`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sala_info`
--
ALTER TABLE `sala_info`
  ADD PRIMARY KEY (`idSala`),
  ADD KEY `fk_tipo_sala_sala_info` (`id_tipo_sala`);

--
-- Indexes for table `sala_local`
--
ALTER TABLE `sala_local`
  ADD PRIMARY KEY (`idLocal`),
  ADD KEY `fk_id_turma` (`id_turma`),
  ADD KEY `fk_id_sala` (`id_sala`),
  ADD KEY `fk_id_grade` (`id_grade`);

--
-- Indexes for table `tipo_sala`
--
ALTER TABLE `tipo_sala`
  ADD PRIMARY KEY (`idTipoSala`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`idTurma`),
  ADD KEY `fk_turma_curso` (`id_curso`);

--
-- Indexes for table `usuario_adm`
--
ALTER TABLE `usuario_adm`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `idDisciplina` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `idGrade` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sala_info`
--
ALTER TABLE `sala_info`
  MODIFY `idSala` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sala_local`
--
ALTER TABLE `sala_local`
  MODIFY `idLocal` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_sala`
--
ALTER TABLE `tipo_sala`
  MODIFY `idTipoSala` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `idTurma` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuario_adm`
--
ALTER TABLE `usuario_adm`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `fk_id_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`idDisciplina`),
  ADD CONSTRAINT `fk_id_professor` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id`),
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`idCurso`);

--
-- Limitadores para a tabela `sala_info`
--
ALTER TABLE `sala_info`
  ADD CONSTRAINT `fk_tipo_sala_sala_info` FOREIGN KEY (`id_tipo_sala`) REFERENCES `tipo_sala` (`idTipoSala`);

--
-- Limitadores para a tabela `sala_local`
--
ALTER TABLE `sala_local`
  ADD CONSTRAINT `fk_id_grade` FOREIGN KEY (`id_grade`) REFERENCES `grade` (`idGrade`),
  ADD CONSTRAINT `fk_id_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala_info` (`idSala`),
  ADD CONSTRAINT `fk_id_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`idTurma`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`idCurso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
