-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Dez-2017 às 20:41
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cp`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarAluno` (IN `_antigoRa` BIGINT, IN `_ra` VARCHAR(250), IN `_fk_pessoa` VARCHAR(250), IN `_fk_responsavel` BIGINT)  NO SQL
UPDATE `aluno` SET `ra`=_ra,`senha`=_senha,`fk_pessoa`=_fk_pessoa,`fk_responsavel`=_fk_responsavel WHERE aluno.ra = _antigoRa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarAluno_matric_turma` (IN `_antigaData` DATE, IN `_dataMatric` DATE, IN `_fk_aluno` BIGINT, IN `_fk_turma` BIGINT, IN `_situacao` BIT)  NO SQL
UPDATE
    `aluno_matric_turma`
SET
    `dataMatric` = _dataMatric,
    `fk_aluno` = _fk_aluno,
    `fk_turma` = _fk_turma,
    `situacao` = _situacao
WHERE
    aluno_matric_turma.dataMatric = _antigaData$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarComponenteCurricular` (IN `_id` BIGINT, IN `_fk_turma` BIGINT, IN `_nome` VARCHAR(250), IN `_carga_hora` DOUBLE, IN `_situacao` BIT)  NO SQL
UPDATE
    `componentecurricular`
SET
    `fk_turma` = _fk_turma,
    `nome` = _nome,
    `carga_hora` = _carga_hora,
    `situacao` = _situacao
WHERE
    componentecurricular.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarCoordenador_de_curso` (IN `_id` BIGINT)  NO SQL
UPDATE
    `coordenador_de_curso`
SET
    `fk_curso` = _fk_curso,
    `fk_professor` = _fk_professor,
    `data_inicio` = _data_inicio,
    `data_fim` = _data_fim
WHERE
    coordenador_de_curso.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarCurso` (IN `_id` BIGINT, IN `_fk_escola` BIGINT, IN `_nome` VARCHAR(250), IN `_cargaHora` DOUBLE, IN `_numeroDeVagas` INT)  NO SQL
UPDATE
    `curso`
SET
    `fk_escola` = _fk_escola,
    `nome` = _nome,
    `cargaHora` = _cargaHora,
    `numeroDeVagas` = _numeroDeVagas
WHERE
    curso.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarEmail_escola` (IN `_antigoEmail` VARCHAR(250), IN `_email` VARCHAR(250))  NO SQL
UPDATE
    `email_escola`
SET
    `email` = _email
WHERE
    email_escola.email = _antigoEmail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarEscola` (IN `_antigocnpj` BIGINT, IN `_cnpj` BIGINT, IN `_nome` VARCHAR(250), IN `_estado` VARCHAR(250), IN `_municipio` VARCHAR(250), IN `_bairro` VARCHAR(250), IN `_endereco` VARCHAR(250), IN `_numero` VARCHAR(250), IN `_cep` VARCHAR(10))  NO SQL
UPDATE
    `escola`
SET
    `cnpj` = _cnpj,
    `nome` = _nome,
    `estado` = _estado,
    `municipio` = _municipio,
    `bairro` = _bairro,
    `endereco` = _endereco,
    `numero` = _numero,
    `cep` = _cep
WHERE
    escola.cnpj = _antigocnpj$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarPessoa` (IN `_Antigoemail` VARCHAR(250), IN `_email` VARCHAR(250), IN `_nome` VARCHAR(250), IN `_sobrenome` VARCHAR(250), IN `_estado` VARCHAR(250), IN `_municipio` VARCHAR(250), IN `_bairro` VARCHAR(250), IN `_endereco` VARCHAR(250), IN `_cep` VARCHAR(10), IN `_imagem` VARCHAR(250))  NO SQL
UPDATE
    `pessoa`
SET
    `email` = _email,
    `nome` = _nome,
    `sobrenome` = _sobrenome,
    `estado` = _estado,
    `municipio` = _municipio,
    `bairro` = _bairro,
    `endereco` = _endereco,
    `numero` = _numero,
    `cep` = _cep,
    `imagem` = _imagem
WHERE
    pessoa.email = _Antigoemail$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarPostagem` (IN `_id` BIGINT, IN `_fk_componentecurricular` BIGINT, IN `_corpoTexto` TEXT)  NO SQL
UPDATE
    `postagem`
SET
    `fk_componentecurricular` = _fk_componentecurricular,
    `corpoTexto` = _corpoTexto,
    `dataHora` = NOW()
WHERE
    postagem.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarProfessor` (IN `_antigoCpf` BIGINT, IN `_cpf` BIGINT, IN `_senha` VARCHAR(250), IN `_fk_pessoa` VARCHAR(250))  NO SQL
UPDATE `professor` SET `cpf`=_cpf,`senha`=_senha,`fk_pessoa`=_fk_pessoa WHERE professor.cpf = _antigoCpf$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarProf_ministra_cc` (IN `_antigoProfessor` BIGINT, IN `_antigoComponenteCurricular` BIGINT, IN `_fk_professor` BIGINT, IN `_fk_componentecurricular` BIGINT)  NO SQL
UPDATE
    `prof_ministra_cc`
SET
    `fk_professor` = _fk_professor,
    `fk_componentecurricular` = _fk_componentecurricular
WHERE
    prof_ministra_cc.fk_professor = _antigoProfessor
   AND
   prof_ministra_cc.fk_componentecurricular = _antigoComponenteCurricular$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarResponsavel` (IN `_antigoCpf` BIGINT, IN `_cpf` BIGINT, IN `_senha` VARCHAR(250), IN `_fk_pessoa` VARCHAR(250))  NO SQL
UPDATE responsavel SET `cpf`=_cpf,`senha`=_senha,`fk_pessoa`=_fk_pessoa WHERE responsavel.cpf = _antigoCpf$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarTelefone_escola` (IN `_antigoTelefone` VARCHAR(250), IN `_telefone` VARCHAR(250), IN `fk_escola``=_fk_escola` BIGINT)  NO SQL
UPDATE `telefone_escola` SET `telefone`=_telefone,`fk_escola`=_fk_escola WHERE telefone_escola.telefone = _antigoTelefone$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarTelefone_pessoa` (IN `_antigoTelefone` VARCHAR(250), IN `_telefone` VARCHAR(250), IN `_fk_pessoa` INT(250))  NO SQL
UPDATE telefone_pessoa SET `telefone`=_telefone,`fk_pessoa` =_fk_pessoa WHERE telefone_pessoa.telefone = _antigoTelefone$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarTrabalho` (IN `_id` BIGINT, IN `_fk_professor` BIGINT, IN `_fk_componentecurricular` BIGINT, IN `_corpoTexto` TEXT, IN `_data_postagem` DATE, IN `_prazo_entrega` DATE)  NO SQL
UPDATE
    `trabalho`
SET
    `fk_professor` = _fk_professor,
    `fk_componentecurricular` = _fk_componentecurricular,
    `corpoTexto` = _corpoTexto,
    `data_postagem` = _data_postagem,
    `prazo_entrega` = _prazo_entrega
WHERE
    trabalho.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_alterarTurma` (IN `_id` BIGINT, IN `_fk_curso` BIGINT, IN `_numeroTurma` VARCHAR(250), IN `_ano` INT)  NO SQL
UPDATE
    turma
SET
    turma.fk_curso = _fk_curso,
    turma.numeroTurma = _numeroTurma,
    turma.ano = _ano
WHERE
    turma.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarAluno` (IN `_ra` BIGINT, IN `_senha` VARCHAR(250), IN `_fk_pessoa` VARCHAR(250))  NO SQL
INSERT INTO aluno(ra, senha, fk_pessoa) VALUES (_ra,_senha,_fk_pessoa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarAluno_matric_turma` (IN `_fk_aluno` BIGINT, IN `_fk_turma` BIGINT, IN `_situacao` BIT)  NO SQL
INSERT INTO aluno_matric_turma(dataMatric, fk_aluno, fk_turma, situacao) VALUES ( now(), _fk_aluno, _fk_turma, _situacao)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarAluno_responde_trab` (IN `_fk_aluno` BIGINT, IN `_fk_trabalho` BIGINT, IN `_corpoTexto` TEXT)  NO SQL
INSERT INTO aluno_responde_trab
    (
        
        fk_aluno,
        fk_trabalho,
        corpoTexto,
        dataResposta
    )
VALUES(
    _fk_aluno,
    _fk_trabalho,
    _corpoTexto,
    now()
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarComponenteCurricular` (IN `fk_turma` BIGINT, IN `_nome` VARCHAR(250), IN `_carga_hora` DOUBLE, IN `_situacao` BIT)  NO SQL
INSERT INTO componentecurricular(
    fk_turma,
    nome,
    carga_hora,
    situacao
)
VALUES(
    _fk_turma,
    _nome,
    _carga_hora,
    _situacao
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarCoordenador_de_curso` (IN `_fk_curso` BIGINT, IN `_fk_professor` BIGINT, IN `_data_inicio` DATE, IN `_data_fim` DATE)  NO SQL
INSERT INTO coordenador_de_curso(
    fk_curso,
    fk_professor,
    data_inicio,
    data_fim
)
VALUES(
    _fk_curso,
    _fk_professor,
    _data_inicio,
    _data_fim
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarCurso` (IN `_fk_escola` BIGINT, IN `_nome` VARCHAR(250), IN `_cargaHora` DOUBLE, IN `_numeroDeVagas` INT)  NO SQL
INSERT INTO curso(
    fk_escola,
    nome,
    cargaHora,
    numeroDeVagas
)
VALUES(
    _fk_escola,
    _nome,
    _cargaHora,
    _numeroDeVagas
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarEmail_Escola` (IN `_email` VARCHAR(250), IN `_fk_escola` BIGINT)  NO SQL
INSERT INTO email_escola(email, fk_escola)
VALUES(_email, _fk_escola)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrareNotificacao` (IN `_pessoa` VARCHAR(250), IN `_descricao` VARCHAR(250), IN `_visualizada` BIT)  NO SQL
INSERT INTO notificacao(pessoa, descricao, visualizada)
VALUES(
    _pessoa,
    _descricao,
    _visualizada
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarEscola` (IN `_cnpj` BIGINT, IN `_nome` VARCHAR(250), IN `_estado` VARCHAR(250), IN `_municipio` INT(250), IN `_bairro` VARCHAR(250), IN `_endereco` VARCHAR(250), IN `_numero` VARCHAR(250), IN `_cep` VARCHAR(10))  NO SQL
INSERT INTO escola(
    cnpj,
    nome,
    estado,
    municipio,
    bairro,
    endereco,
    numero,
    cep
)
VALUES(
    _cnpj,
    _nome,
    _estado,
    _municipio,
    _bairro,
    _endereco,
    _numero,
    _cep
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarMensagem` (IN `_fk_professor` BIGINT, IN `_fk_responsavel` BIGINT, IN `_corpoTexto` TEXT, IN `_liberacao` BIT, IN `_visualizada` BIT)  NO SQL
INSERT INTO mensagens(
    fk_professor,
    fk_responsavel,
    corpoTexto,
    dataHora,
    liberacao,
    visualizada
)
VALUES(
    _fk_professor,
    _fk_responsavel,
    _corpoTexto,
    now(),
    _liberacao,
    _visualizada
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarPessoa` (IN `_email` VARCHAR(250), IN `_nome` VARCHAR(250), IN `_sobrenome` VARCHAR(250), IN `_estado` VARCHAR(250), IN `_municipio` VARCHAR(250), IN `_bairro` VARCHAR(250), IN `_endereco` VARCHAR(250), IN `_numero` VARCHAR(250), IN `_cep` VARCHAR(10), IN `_imagem` VARCHAR(250))  NO SQL
INSERT INTO pessoa(email, nome, sobrenome, estado, municipio, bairro, endereco, numero, cep, imagem) VALUES 
( _email, _nome, _sobrenome, _estado, _municipio, _bairro, _endereco, _numero, _cep, _imagem)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarPostagem` (IN `_fk_professor` BIGINT, IN `_fk_componentecurricular` BIGINT, IN `_corpoTexto` TEXT)  NO SQL
INSERT INTO postagem(
    fk_professor,
    fk_componentecurricular,
    corpoTexto,
    dataHora
)
VALUES(
    _fk_professor,
    _fk_componentecurricular,
    _corpoTexto,
    now()
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarProfessor` (IN `_cpf` BIGINT, IN `_senha` VARCHAR(250), IN `_fk_pessoa` VARCHAR(250))  NO SQL
INSERT INTO `professor`(`cpf`, `senha`, `fk_pessoa`) VALUES (_cpf,_senha,_fk_pessoa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_CadastrarProf_ministra_cc` (IN `_fk_professor` BIGINT, IN `_fk_componentecurricular` BIGINT)  NO SQL
INSERT INTO `prof_ministra_cc`(`fk_professor`, `fk_componentecurricular`) VALUES (_fk_professor,_fk_componentecurricular)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarResponsavel` (IN `_cpf` BIGINT, IN `_senha` VARCHAR(250), IN `_fk_pessoa` VARCHAR(250))  NO SQL
INSERT INTO  responsavel (`cpf`, `senha`, `fk_pessoa`) VALUES (_cpf,_senha,_fk_pessoa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarResponsavelParaAluno` (IN `_fk_Responsavel` BIGINT, IN `_ra` BIGINT)  NO SQL
UPDATE `aluno` SET`fk_responsavel`=_fk_Responsavel WHERE aluno.ra = _ra$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarTelefone_escola` (IN `_telefone` VARCHAR(250), IN `_fk_escola` BIGINT)  NO SQL
INSERT INTO `telefone_escola`(`telefone`, `fk_escola`) VALUES (_telefone,_fk_escola)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarTelefone_pessoa` (IN `_telefone` VARCHAR(250), IN `_fk_pessoa` VARCHAR(250))  NO SQL
INSERT INTO telefone_pessoa(`telefone`, `fk_escola`) VALUES (_telefone,_fk_pessoa)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarTrabalho` (IN `_fk_professor` BIGINT, IN `_fk_componentecurricular` BIGINT, IN `_corpoTexto` TEXT, IN `_prazo_entrega` DATE)  NO SQL
INSERT INTO trabalho(
    fk_professor,
    fk_componentecurricular,
    corpoTexto,
    data_postagem,
    prazo_entrega
)
VALUES(
    _fk_professor,
    _fk_componentecurricular,
    _corpoTexto,
    now(),
    _prazo_entrega
)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_cadastrarTurma` (IN `_fk_curso` BIGINT, IN `_numeroTurma` VARCHAR(250), IN `_ano` INT)  NO SQL
INSERT INTO `turma`( `fk_curso`, `numeroTurma`, `ano`) VALUES (_fk_curso,_numeroTurma,_ano)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarAlunoPorRa` (IN `_ra` BIGINT)  NO SQL
SELECT * from aluno WHERE aluno.ra = _ra$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarAlunosMatriculadosEmTurma` (IN `_turma` BIGINT)  NO SQL
SELECT * FROM `aluno_matric_turma` WHERE aluno_matric_turma.fk_turma = _turma$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarComponenteCurricular` (IN `_id` BIGINT)  NO SQL
SELECT * FROM `componentecurricular` WHERE componentecurricular.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarCoordenador_de_curso` (IN `_id` BIGINT)  NO SQL
SELECT
    *
FROM
    `coordenador_de_curso`
WHERE
    coordenador_de_curso.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarCurso` (IN `_id` INT)  NO SQL
SELECT
    `id`,
    `fk_escola`,
    `nome`,
    `cargaHora`,
    `numeroDeVagas`
FROM
    `curso`
WHERE
    curso.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarEmail_escola` (IN `_fk_escola` BIGINT)  NO SQL
SELECT * FROM `email_escola` WHERE  email_escola.fk_escola = _fk_escola$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarEscola` (IN `_cnpj` BIGINT)  NO SQL
SELECT * FROM `escola` WHERE escola.cnpj = _cnpj$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarMensagem` (IN `_id` BIGINT)  NO SQL
SELECT
    *
FROM
    `mensagens`
WHERE
    mensagens.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarNotificacao` (IN `_pessoa` VARCHAR(250))  NO SQL
SELECT * FROM notificacao WHERE notificacao.pessoa = _pessoa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarPessoaPorEmail` (IN `_email` VARCHAR(250))  NO SQL
SELECT * FROM `pessoa` WHERE pessoa.email = _email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarPostagem` (IN `_id` BIGINT)  NO SQL
SELECT * FROM `postagem` WHERE postagem.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarProfessor` (IN `_cpf` BIGINT)  NO SQL
SELECT * FROM `professor` WHERE professor.cpf = _cpf$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarProf_ministra_cc` (IN `_fk_professor` BIGINT)  NO SQL
SELECT * FROM `prof_ministra_cc` WHERE prof_ministra_cc.fk_professor = _fk_professor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarResponsavel` (IN `_cpf` BIGINT)  NO SQL
SELECT * FROM `responsavel` WHERE responsavel.cpf = _cpf$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarTelefone_Escola` (IN `_fk_Escola` BIGINT)  NO SQL
SELECT * FROM telefone_escola WHERE telefone_escola.fk_escola = _fk_Escola$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarTelefone_pessoa` (IN `_fk_pessoa` VARCHAR(250))  NO SQL
SELECT * FROM telefone_pessoa WHERE telefone_pessoa.fk_pessoa = _fk_pessoa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarTrabalho` (IN `_id` BIGINT)  NO SQL
SELECT * FROM trabalho WHERE trabalho.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_consultarTurma` (IN `_id` BIGINT)  NO SQL
SELECT
    *
FROM
    turma
WHERE
    turma.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarAluno` (IN `_ra` BIGINT)  NO SQL
DELETE FROM `aluno` WHERE aluno.ra = _ra$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarAluno_matric_turma` (IN `_data` DATE)  NO SQL
DELETE FROM `aluno_matric_turma` WHERE aluno_matric_turma.dataMatric = _data$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarComponenteCurricular` (IN `_id` BIGINT)  NO SQL
DELETE FROM `componentecurricular` WHERE componentecurricular.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarCoordenador_de_curso` (IN `_id` BIGINT)  NO SQL
DELETE
FROM
    `coordenador_de_curso`
WHERE
    coordenador_de_curso.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarCursos` (IN `_id` BIGINT)  NO SQL
DELETE FROM curso WHERE curso.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarEmail_escola` (IN `_email` VARCHAR(250))  NO SQL
DELETE FROM email_escola WHERE email_escola.email = _email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarEscola` (IN `_cnpj` BIGINT)  NO SQL
DELETE FROM escola WHERE escola.cnpj = _cnpj$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarMensagem` (IN `_id` BIGINT)  NO SQL
DELETE FROM mensagens WHERE mensagens.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarPessoa` (IN `_email` VARCHAR(250))  NO SQL
DELETE FROM `pessoa` WHERE pessoa.email = _email$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarPostagem` (IN `_id` BIGINT)  NO SQL
DELETE FROM postagem WHERE postagem.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarProfessor` (IN `_cpf` BIGINT)  NO SQL
DELETE FROM professor WHERE professor.cpf = _cpf$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarProf_ministra_cc` (IN `_fk_professor` BIGINT, IN `_fk_componentecurricular` BIGINT)  NO SQL
DELETE
FROM
    prof_ministra_cc
WHERE
    prof_ministra_cc.fk_professor = _fk_professor AND prof_ministra_cc.fk_componentecurricular = _fk_componentecurricular$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarResponsavel` (IN `_cpf` BIGINT)  NO SQL
DELETE FROM responsavel WHERE responsavel.cpf = _cpf$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarTelefone_escola` (IN `_telefone` VARCHAR(250))  NO SQL
DELETE FROM telefone_escola WHERE telefone_escola.telefone = _telefone$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarTelefone_pessoa` (IN `_telefone` VARCHAR(250))  NO SQL
DELETE FROM telefone_pessoa WHERE telefone_pessoa.telefone = _telefone$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarTrabalho` (IN `_id` BIGINT)  NO SQL
DELETE FROM trabalho WHERE trabalho.id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletarTurma` (IN `_id` BIGINT)  NO SQL
DELETE FROM turma WHERE turma.id = _id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE `aluno` (
  `ra` bigint(20) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `fk_pessoa` varchar(250) NOT NULL,
  `fk_responsavel` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`ra`, `senha`, `fk_pessoa`, `fk_responsavel`) VALUES
(1, 'a2', 'a', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_matric_turma`
--

CREATE TABLE `aluno_matric_turma` (
  `dataMatric` date NOT NULL,
  `fk_aluno` bigint(20) NOT NULL,
  `fk_turma` bigint(20) NOT NULL,
  `situacao` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno_responde_trab`
--

CREATE TABLE `aluno_responde_trab` (
  `id` int(11) NOT NULL,
  `fk_aluno` bigint(20) NOT NULL,
  `fk_trabalho` bigint(20) NOT NULL,
  `corpoTexto` text NOT NULL,
  `dataResposta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `componentecurricular`
--

CREATE TABLE `componentecurricular` (
  `id` bigint(20) NOT NULL,
  `fk_turma` bigint(20) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `carga_hora` double NOT NULL,
  `situacao` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordenador_de_curso`
--

CREATE TABLE `coordenador_de_curso` (
  `id` bigint(20) NOT NULL,
  `fk_curso` bigint(20) NOT NULL,
  `fk_professor` bigint(20) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

CREATE TABLE `curso` (
  `id` bigint(20) NOT NULL,
  `fk_escola` bigint(20) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `cargaHora` double NOT NULL,
  `numeroDeVagas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_escola`
--

CREATE TABLE `email_escola` (
  `email` varchar(250) DEFAULT NULL,
  `fk_escola` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `escola`
--

CREATE TABLE `escola` (
  `cnpj` bigint(20) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `bairro` varchar(250) NOT NULL,
  `endereco` varchar(250) NOT NULL,
  `numero` varchar(250) NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` bigint(20) NOT NULL,
  `fk_professor` bigint(20) NOT NULL,
  `fk_responsavel` bigint(20) NOT NULL,
  `corpoTexto` text NOT NULL,
  `dataHora` datetime NOT NULL,
  `liberacao` bit(1) NOT NULL,
  `visualizada` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacao`
--

CREATE TABLE `notificacao` (
  `pessoa` varchar(250) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `visualizada` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `email` varchar(250) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `sobrenome` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `bairro` varchar(250) NOT NULL,
  `endereco` varchar(250) NOT NULL,
  `numero` varchar(250) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `imagem` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`email`, `nome`, `sobrenome`, `estado`, `municipio`, `bairro`, `endereco`, `numero`, `cep`, `imagem`) VALUES
('a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Estrutura da tabela `postagem`
--

CREATE TABLE `postagem` (
  `id` bigint(20) NOT NULL,
  `fk_professor` bigint(20) NOT NULL,
  `fk_componentecurricular` bigint(20) NOT NULL,
  `corpoTexto` text NOT NULL,
  `dataHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professor`
--

CREATE TABLE `professor` (
  `cpf` bigint(20) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `fk_pessoa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_ministra_cc`
--

CREATE TABLE `prof_ministra_cc` (
  `fk_professor` bigint(20) NOT NULL,
  `fk_componentecurricular` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsavel`
--

CREATE TABLE `responsavel` (
  `cpf` bigint(20) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `fk_pessoa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_escola`
--

CREATE TABLE `telefone_escola` (
  `telefone` varchar(250) DEFAULT NULL,
  `fk_escola` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_pessoa`
--

CREATE TABLE `telefone_pessoa` (
  `telefone` varchar(250) NOT NULL,
  `fk_pessoa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalho`
--

CREATE TABLE `trabalho` (
  `id` bigint(20) NOT NULL,
  `fk_professor` bigint(20) NOT NULL,
  `fk_componentecurricular` bigint(20) NOT NULL,
  `corpoTexto` text NOT NULL,
  `data_postagem` datetime NOT NULL,
  `prazo_entrega` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turma`
--

CREATE TABLE `turma` (
  `id` bigint(20) NOT NULL,
  `fk_curso` bigint(20) NOT NULL,
  `numeroTurma` varchar(250) NOT NULL,
  `ano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`ra`),
  ADD KEY `fk_pessoa` (`fk_pessoa`),
  ADD KEY `fk_responsavel` (`fk_responsavel`);

--
-- Indexes for table `aluno_matric_turma`
--
ALTER TABLE `aluno_matric_turma`
  ADD PRIMARY KEY (`dataMatric`,`fk_aluno`,`fk_turma`),
  ADD KEY `fk_turma` (`fk_turma`),
  ADD KEY `fk_aluno` (`fk_aluno`);

--
-- Indexes for table `aluno_responde_trab`
--
ALTER TABLE `aluno_responde_trab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aluno` (`fk_aluno`),
  ADD KEY `fk_trabalho` (`fk_trabalho`);

--
-- Indexes for table `componentecurricular`
--
ALTER TABLE `componentecurricular`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_turma` (`fk_turma`);

--
-- Indexes for table `coordenador_de_curso`
--
ALTER TABLE `coordenador_de_curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_curso` (`fk_curso`),
  ADD KEY `fk_professor` (`fk_professor`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_escola` (`fk_escola`);

--
-- Indexes for table `email_escola`
--
ALTER TABLE `email_escola`
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_escola` (`fk_escola`);

--
-- Indexes for table `escola`
--
ALTER TABLE `escola`
  ADD PRIMARY KEY (`cnpj`);

--
-- Indexes for table `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_professor` (`fk_professor`),
  ADD KEY `fk_responsavel` (`fk_responsavel`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `postagem`
--
ALTER TABLE `postagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_professor` (`fk_professor`),
  ADD KEY `fk_componentecurricular` (`fk_componentecurricular`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `fk_pessoa` (`fk_pessoa`);

--
-- Indexes for table `prof_ministra_cc`
--
ALTER TABLE `prof_ministra_cc`
  ADD PRIMARY KEY (`fk_professor`,`fk_componentecurricular`),
  ADD KEY `fk_componentecurricular` (`fk_componentecurricular`);

--
-- Indexes for table `responsavel`
--
ALTER TABLE `responsavel`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `fk_pessoa` (`fk_pessoa`);

--
-- Indexes for table `telefone_escola`
--
ALTER TABLE `telefone_escola`
  ADD UNIQUE KEY `telefone` (`telefone`),
  ADD KEY `fk_escola` (`fk_escola`);

--
-- Indexes for table `telefone_pessoa`
--
ALTER TABLE `telefone_pessoa`
  ADD KEY `fk_pessoa` (`fk_pessoa`);

--
-- Indexes for table `trabalho`
--
ALTER TABLE `trabalho`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_professor` (`fk_professor`),
  ADD KEY `fk_componentecurricular` (`fk_componentecurricular`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_curso` (`fk_curso`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aluno_responde_trab`
--
ALTER TABLE `aluno_responde_trab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `componentecurricular`
--
ALTER TABLE `componentecurricular`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coordenador_de_curso`
--
ALTER TABLE `coordenador_de_curso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postagem`
--
ALTER TABLE `postagem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trabalho`
--
ALTER TABLE `trabalho`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`fk_pessoa`) REFERENCES `pessoa` (`email`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`fk_responsavel`) REFERENCES `responsavel` (`cpf`);

--
-- Limitadores para a tabela `aluno_matric_turma`
--
ALTER TABLE `aluno_matric_turma`
  ADD CONSTRAINT `aluno_matric_turma_ibfk_1` FOREIGN KEY (`fk_turma`) REFERENCES `turma` (`id`),
  ADD CONSTRAINT `aluno_matric_turma_ibfk_2` FOREIGN KEY (`fk_aluno`) REFERENCES `aluno` (`ra`);

--
-- Limitadores para a tabela `aluno_responde_trab`
--
ALTER TABLE `aluno_responde_trab`
  ADD CONSTRAINT `aluno_responde_trab_ibfk_1` FOREIGN KEY (`fk_aluno`) REFERENCES `aluno` (`ra`),
  ADD CONSTRAINT `aluno_responde_trab_ibfk_2` FOREIGN KEY (`fk_trabalho`) REFERENCES `trabalho` (`id`);

--
-- Limitadores para a tabela `componentecurricular`
--
ALTER TABLE `componentecurricular`
  ADD CONSTRAINT `componentecurricular_ibfk_1` FOREIGN KEY (`fk_turma`) REFERENCES `turma` (`id`);

--
-- Limitadores para a tabela `coordenador_de_curso`
--
ALTER TABLE `coordenador_de_curso`
  ADD CONSTRAINT `coordenador_de_curso_ibfk_1` FOREIGN KEY (`fk_curso`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `coordenador_de_curso_ibfk_2` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`cpf`);

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`fk_escola`) REFERENCES `escola` (`cnpj`);

--
-- Limitadores para a tabela `email_escola`
--
ALTER TABLE `email_escola`
  ADD CONSTRAINT `email_escola_ibfk_1` FOREIGN KEY (`fk_escola`) REFERENCES `escola` (`cnpj`);

--
-- Limitadores para a tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`cpf`),
  ADD CONSTRAINT `mensagens_ibfk_2` FOREIGN KEY (`fk_responsavel`) REFERENCES `responsavel` (`cpf`);

--
-- Limitadores para a tabela `postagem`
--
ALTER TABLE `postagem`
  ADD CONSTRAINT `postagem_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`cpf`),
  ADD CONSTRAINT `postagem_ibfk_2` FOREIGN KEY (`fk_componentecurricular`) REFERENCES `componentecurricular` (`id`);

--
-- Limitadores para a tabela `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`fk_pessoa`) REFERENCES `pessoa` (`email`);

--
-- Limitadores para a tabela `prof_ministra_cc`
--
ALTER TABLE `prof_ministra_cc`
  ADD CONSTRAINT `prof_ministra_cc_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`cpf`),
  ADD CONSTRAINT `prof_ministra_cc_ibfk_2` FOREIGN KEY (`fk_componentecurricular`) REFERENCES `componentecurricular` (`id`);

--
-- Limitadores para a tabela `responsavel`
--
ALTER TABLE `responsavel`
  ADD CONSTRAINT `responsavel_ibfk_1` FOREIGN KEY (`fk_pessoa`) REFERENCES `pessoa` (`email`);

--
-- Limitadores para a tabela `telefone_escola`
--
ALTER TABLE `telefone_escola`
  ADD CONSTRAINT `telefone_escola_ibfk_1` FOREIGN KEY (`fk_escola`) REFERENCES `escola` (`cnpj`);

--
-- Limitadores para a tabela `telefone_pessoa`
--
ALTER TABLE `telefone_pessoa`
  ADD CONSTRAINT `telefone_pessoa_ibfk_1` FOREIGN KEY (`fk_pessoa`) REFERENCES `pessoa` (`email`);

--
-- Limitadores para a tabela `trabalho`
--
ALTER TABLE `trabalho`
  ADD CONSTRAINT `trabalho_ibfk_1` FOREIGN KEY (`fk_professor`) REFERENCES `professor` (`cpf`),
  ADD CONSTRAINT `trabalho_ibfk_2` FOREIGN KEY (`fk_componentecurricular`) REFERENCES `componentecurricular` (`id`);

--
-- Limitadores para a tabela `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `turma_ibfk_1` FOREIGN KEY (`fk_curso`) REFERENCES `curso` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
