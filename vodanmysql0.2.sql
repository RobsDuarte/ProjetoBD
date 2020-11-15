-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Nov-2020 às 21:54
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetobd`
--

DELIMITER $$
--
-- Funções
--
CREATE DEFINER=`root`@`localhost` FUNCTION `ontologyuri` (`ontologyacronym` VARCHAR(500), `tablename` VARCHAR(500), `identifier` INTEGER) RETURNS VARCHAR(500) CHARSET utf8 BEGIN
   declare v_ontologyURI character varying (255);
   
	  
   SELECT t3.ontologyuri into v_ontologyURI
   from 
       tb_QuestionnairePartsTable t2, tb_QuestionnairePartsOntology t3, tb_ontology t4
   where
	t4.acronym = ontologyAcronym and -- Identifica a ontologia que se deseja relacionar
	t2.description = tableName and
	t3.ontologyID = t4.OntologyID and
	t3.questionnairepartstableid = t2.questionnairepartstableid and
	t3.questionnairepartsid = identifier;
  
    if (v_ontologyURI is null) then  
        SET v_ontologyURI = '';
    END IF;
	  
    RETURN v_ontologyURI;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `translate` (`lng` VARCHAR(255), `val` VARCHAR(500)) RETURNS VARCHAR(500) CHARSET utf8 BEGIN
   declare descriptionLNG varchar (500);
 
	
      select t1.descriptionlang into descriptionLNG
      from tb_multilanguage t1, tb_language t2 
	  where t2.description = lng and t1.languageId = t2.languageID and upper(t1.description) = upper(val);
  
      if (descriptionLNG is null) then  
	    SET descriptionLNG = '';
	  END IF;
	  
      RETURN descriptionLNG;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `adultos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `adultos` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `altasfumantes`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `altasfumantes` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `altashomem`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `altashomem` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `altasmulher`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `altasmulher` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `asmaticos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `asmaticos` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `fem`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `fem` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `fumantes`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `fumantes` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `fumantes2`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `fumantes2` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `hipertensos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `hipertensos` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `idades`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `idades` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `idosos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `idosos` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `jovens`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `jovens` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `leitos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `leitos` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `masc`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `masc` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `mortos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `mortos` (
`pacid_mortos` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `mortos2`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `mortos2` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `obitosadultos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `obitosadultos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `obitosasmaticos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `obitosasmaticos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `obitosfumantes`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `obitosfumantes` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `obitoshipertensos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `obitoshipertensos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `obitoshomens`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `obitoshomens` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `obitosidosos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `obitosidosos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `obitosmulher`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `obitosmulher` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacantiviral`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacantiviral` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacidazit`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacidazit` (
`pacazitrom` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacidazitrom`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacidazitrom` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacidclor`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacidclor` (
`pacid` int(10)
,`formrecordID` int(10)
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacidcloro`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacidcloro` (
`pacidcloro` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacidcloro2`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacidcloro2` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacidlop`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacidlop` (
`pacidlop` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pacidlop2`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `pacidlop2` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `r`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `r` (
`formRecordID` int(10)
,`crfFormsID` int(10)
,`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `sexofem`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `sexofem` (
`pacfem` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `sexomasc`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `sexomasc` (
`pacmasc` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_assessmentquestionnaire`
--

CREATE TABLE `tb_assessmentquestionnaire` (
  `participantID` int(10) NOT NULL COMMENT '(pt-br)  Chave estrangeira para a tabela tb_Patient.\r\n(en) Foreign key to the tb_Patient table.',
  `hospitalUnitID` int(10) NOT NULL COMMENT '(pt-br) Chave estrangeira para tabela tb_HospitalUnit.\r\n(en) Foreign key for the tp_HospitalUnit table.',
  `questionnaireID` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_assessmentquestionnaire`
--

INSERT INTO `tb_assessmentquestionnaire` (`participantID`, `hospitalUnitID`, `questionnaireID`) VALUES
(88, 1, 1),
(89, 1, 1),
(90, 1, 1),
(91, 1, 1),
(92, 1, 1),
(93, 1, 1),
(94, 1, 1),
(95, 1, 1),
(96, 1, 1),
(97, 1, 1),
(98, 1, 1),
(99, 1, 1),
(100, 1, 1),
(101, 1, 1),
(102, 1, 1),
(103, 1, 1),
(104, 1, 1),
(105, 1, 1),
(106, 1, 1),
(107, 1, 1),
(108, 1, 1),
(109, 1, 1),
(110, 1, 1),
(111, 1, 1),
(112, 1, 1),
(113, 1, 1),
(114, 1, 1),
(115, 1, 1),
(116, 1, 1),
(117, 1, 1),
(118, 1, 1),
(119, 1, 1),
(120, 1, 1),
(121, 1, 1),
(122, 1, 1),
(123, 1, 1),
(124, 1, 1),
(125, 1, 1),
(126, 1, 1),
(127, 1, 1),
(128, 1, 1),
(129, 1, 1),
(130, 1, 1),
(131, 1, 1),
(132, 1, 1),
(133, 1, 1),
(134, 1, 1),
(135, 1, 1),
(136, 1, 1),
(137, 1, 1),
(138, 1, 1),
(139, 1, 1),
(140, 1, 1),
(141, 1, 1),
(142, 1, 1),
(143, 1, 1),
(144, 1, 1),
(145, 1, 1),
(146, 1, 1),
(147, 1, 1),
(148, 1, 1),
(149, 1, 1),
(150, 1, 1),
(151, 1, 1),
(152, 1, 1),
(153, 1, 1),
(154, 1, 1),
(155, 1, 1),
(156, 1, 1),
(157, 1, 1),
(158, 1, 1),
(159, 1, 1),
(160, 1, 1),
(161, 1, 1),
(162, 1, 1),
(163, 1, 1),
(164, 1, 1),
(165, 1, 1),
(166, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_crfforms`
--

CREATE TABLE `tb_crfforms` (
  `crfFormsID` int(10) NOT NULL,
  `questionnaireID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição .\r\n(en) description.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='(pt-br)\r\ntb_CRFForms identifica o tipo do formulario refere-se ao Questionnaire Subsection da Ontologia:\r\nAdmissão - Modulo 1\r\nAcompanhamento - Modulo 2\r\nDesfecho - Modulo 3\r\n(en)\r\ntb_CRFForms identifies the type of the form refers to the Questionnaire Subsection of Ontology: Admission - Module 1 Monitoring - Module 2 Outcome - Module 3';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_formrecord`
--

CREATE TABLE `tb_formrecord` (
  `formRecordID` int(10) NOT NULL,
  `participantID` int(10) NOT NULL,
  `hospitalUnitID` int(10) NOT NULL,
  `questionnaireID` int(10) NOT NULL,
  `crfFormsID` int(10) NOT NULL,
  `dtRegistroForm` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_formrecord`
--

INSERT INTO `tb_formrecord` (`formRecordID`, `participantID`, `hospitalUnitID`, `questionnaireID`, `crfFormsID`, `dtRegistroForm`) VALUES
(1, 116, 1, 1, 1, '2020-11-01 13:38:16'),
(2, 116, 1, 1, 2, '2020-11-01 13:38:16'),
(3, 116, 1, 1, 3, '2020-11-01 13:38:16'),
(4, 98, 1, 1, 1, '2020-11-01 13:38:16'),
(5, 98, 1, 1, 2, '2020-11-01 13:38:16'),
(6, 98, 1, 1, 3, '2020-11-01 13:38:16'),
(7, 120, 1, 1, 1, '2020-11-01 13:38:16'),
(8, 120, 1, 1, 2, '2020-11-01 13:38:16'),
(9, 120, 1, 1, 3, '2020-11-01 13:38:16'),
(10, 93, 1, 1, 1, '2020-11-01 13:38:16'),
(11, 93, 1, 1, 2, '2020-11-01 13:38:16'),
(12, 93, 1, 1, 3, '2020-11-01 13:38:16'),
(13, 122, 1, 1, 1, '2020-11-01 13:38:16'),
(14, 122, 1, 1, 2, '2020-11-01 13:38:16'),
(15, 122, 1, 1, 3, '2020-11-01 13:38:16'),
(16, 123, 1, 1, 1, '2020-11-01 13:38:16'),
(17, 123, 1, 1, 2, '2020-11-01 13:38:16'),
(18, 123, 1, 1, 3, '2020-11-01 13:38:16'),
(19, 105, 1, 1, 1, '2020-11-01 13:38:16'),
(20, 105, 1, 1, 2, '2020-11-01 13:38:16'),
(21, 105, 1, 1, 3, '2020-11-01 13:38:16'),
(22, 113, 1, 1, 1, '2020-11-01 13:38:16'),
(23, 113, 1, 1, 2, '2020-11-01 13:38:16'),
(24, 113, 1, 1, 3, '2020-11-01 13:38:16'),
(25, 104, 1, 1, 1, '2020-11-01 13:38:16'),
(26, 104, 1, 1, 2, '2020-11-01 13:38:16'),
(27, 104, 1, 1, 3, '2020-11-01 13:38:16'),
(28, 124, 1, 1, 1, '2020-11-01 13:38:16'),
(29, 124, 1, 1, 2, '2020-11-01 13:38:16'),
(30, 124, 1, 1, 3, '2020-11-01 13:38:16'),
(31, 125, 1, 1, 1, '2020-11-01 13:38:16'),
(32, 125, 1, 1, 2, '2020-11-01 13:38:16'),
(33, 125, 1, 1, 3, '2020-11-01 13:38:16'),
(34, 126, 1, 1, 1, '2020-11-01 13:38:16'),
(35, 126, 1, 1, 2, '2020-11-01 13:38:16'),
(36, 126, 1, 1, 3, '2020-11-01 13:38:16'),
(37, 127, 1, 1, 1, '2020-11-01 13:38:16'),
(38, 127, 1, 1, 2, '2020-11-01 13:38:16'),
(39, 127, 1, 1, 3, '2020-11-01 13:38:16'),
(40, 99, 1, 1, 1, '2020-11-01 13:38:16'),
(41, 99, 1, 1, 2, '2020-11-01 13:38:16'),
(42, 99, 1, 1, 3, '2020-11-01 13:38:16'),
(43, 128, 1, 1, 1, '2020-11-01 13:38:16'),
(44, 128, 1, 1, 2, '2020-11-01 13:38:16'),
(45, 128, 1, 1, 3, '2020-11-01 13:38:16'),
(46, 129, 1, 1, 1, '2020-11-01 13:38:16'),
(47, 129, 1, 1, 2, '2020-11-01 13:38:16'),
(48, 129, 1, 1, 3, '2020-11-01 13:38:16'),
(49, 130, 1, 1, 1, '2020-11-01 13:38:16'),
(50, 130, 1, 1, 2, '2020-11-01 13:38:16'),
(51, 130, 1, 1, 3, '2020-11-01 13:38:16'),
(52, 131, 1, 1, 1, '2020-11-01 13:38:16'),
(53, 131, 1, 1, 2, '2020-11-01 13:38:16'),
(54, 131, 1, 1, 3, '2020-11-01 13:38:16'),
(55, 95, 1, 1, 1, '2020-11-01 13:38:16'),
(56, 95, 1, 1, 2, '2020-11-01 13:38:16'),
(57, 95, 1, 1, 3, '2020-11-01 13:38:16'),
(58, 132, 1, 1, 1, '2020-11-01 13:38:16'),
(59, 132, 1, 1, 2, '2020-11-01 13:38:16'),
(60, 132, 1, 1, 3, '2020-11-01 13:38:16'),
(61, 133, 1, 1, 1, '2020-11-01 13:38:16'),
(62, 133, 1, 1, 2, '2020-11-01 13:38:16'),
(63, 133, 1, 1, 3, '2020-11-01 13:38:16'),
(64, 94, 1, 1, 1, '2020-11-01 13:38:16'),
(65, 94, 1, 1, 2, '2020-11-01 13:38:16'),
(66, 94, 1, 1, 3, '2020-11-01 13:38:16'),
(67, 101, 1, 1, 1, '2020-11-01 13:38:16'),
(68, 101, 1, 1, 2, '2020-11-01 13:38:16'),
(69, 101, 1, 1, 3, '2020-11-01 13:38:16'),
(70, 134, 1, 1, 1, '2020-11-01 13:38:16'),
(71, 134, 1, 1, 2, '2020-11-01 13:38:16'),
(72, 134, 1, 1, 3, '2020-11-01 13:38:16'),
(73, 135, 1, 1, 1, '2020-11-01 13:38:16'),
(74, 135, 1, 1, 2, '2020-11-01 13:38:16'),
(75, 135, 1, 1, 3, '2020-11-01 13:38:16'),
(76, 136, 1, 1, 1, '2020-11-01 13:38:16'),
(77, 136, 1, 1, 2, '2020-11-01 13:38:16'),
(78, 136, 1, 1, 3, '2020-11-01 13:38:16'),
(79, 119, 1, 1, 1, '2020-11-01 13:38:16'),
(80, 119, 1, 1, 2, '2020-11-01 13:38:16'),
(81, 119, 1, 1, 3, '2020-11-01 13:38:16'),
(82, 88, 1, 1, 1, '2020-11-01 13:38:16'),
(83, 88, 1, 1, 2, '2020-11-01 13:38:16'),
(84, 88, 1, 1, 3, '2020-11-01 13:38:16'),
(85, 137, 1, 1, 1, '2020-11-01 13:38:16'),
(86, 137, 1, 1, 2, '2020-11-01 13:38:16'),
(87, 137, 1, 1, 3, '2020-11-01 13:38:16'),
(88, 138, 1, 1, 1, '2020-11-01 13:38:16'),
(89, 138, 1, 1, 2, '2020-11-01 13:38:16'),
(90, 138, 1, 1, 3, '2020-11-01 13:38:16'),
(91, 139, 1, 1, 1, '2020-11-01 13:38:16'),
(92, 139, 1, 1, 2, '2020-11-01 13:38:16'),
(93, 139, 1, 1, 3, '2020-11-01 13:38:16'),
(94, 97, 1, 1, 1, '2020-11-01 13:38:16'),
(95, 97, 1, 1, 2, '2020-11-01 13:38:16'),
(96, 97, 1, 1, 3, '2020-11-01 13:38:16'),
(97, 96, 1, 1, 1, '2020-11-01 13:38:16'),
(98, 96, 1, 1, 2, '2020-11-01 13:38:16'),
(99, 96, 1, 1, 3, '2020-11-01 13:38:16'),
(100, 140, 1, 1, 1, '2020-11-01 13:38:16'),
(101, 140, 1, 1, 2, '2020-11-01 13:38:16'),
(102, 140, 1, 1, 3, '2020-11-01 13:38:16'),
(103, 102, 1, 1, 1, '2020-11-01 13:38:16'),
(104, 102, 1, 1, 2, '2020-11-01 13:38:16'),
(105, 102, 1, 1, 3, '2020-11-01 13:38:16'),
(106, 141, 1, 1, 1, '2020-11-01 13:38:16'),
(107, 141, 1, 1, 2, '2020-11-01 13:38:16'),
(108, 141, 1, 1, 3, '2020-11-01 13:38:16'),
(109, 111, 1, 1, 1, '2020-11-01 13:38:16'),
(110, 111, 1, 1, 2, '2020-11-01 13:38:16'),
(111, 111, 1, 1, 3, '2020-11-01 13:38:16'),
(112, 117, 1, 1, 1, '2020-11-01 13:38:16'),
(113, 117, 1, 1, 2, '2020-11-01 13:38:16'),
(114, 117, 1, 1, 3, '2020-11-01 13:38:16'),
(115, 118, 1, 1, 1, '2020-11-01 13:38:16'),
(116, 118, 1, 1, 2, '2020-11-01 13:38:16'),
(117, 118, 1, 1, 3, '2020-11-01 13:38:16'),
(118, 110, 1, 1, 1, '2020-11-01 13:38:16'),
(119, 110, 1, 1, 2, '2020-11-01 13:38:16'),
(120, 110, 1, 1, 3, '2020-11-01 13:38:16'),
(121, 143, 1, 1, 1, '2020-11-01 13:38:16'),
(122, 143, 1, 1, 2, '2020-11-01 13:38:16'),
(123, 143, 1, 1, 3, '2020-11-01 13:38:16'),
(124, 142, 1, 1, 1, '2020-11-01 13:38:16'),
(125, 142, 1, 1, 2, '2020-11-01 13:38:16'),
(126, 142, 1, 1, 3, '2020-11-01 13:38:16'),
(127, 144, 1, 1, 1, '2020-11-01 13:38:16'),
(128, 144, 1, 1, 2, '2020-11-01 13:38:16'),
(129, 144, 1, 1, 3, '2020-11-01 13:38:16'),
(130, 145, 1, 1, 1, '2020-11-01 13:38:16'),
(131, 145, 1, 1, 2, '2020-11-01 13:38:16'),
(132, 145, 1, 1, 3, '2020-11-01 13:38:16'),
(133, 146, 1, 1, 1, '2020-11-01 13:38:16'),
(134, 146, 1, 1, 2, '2020-11-01 13:38:16'),
(135, 146, 1, 1, 3, '2020-11-01 13:38:16'),
(136, 147, 1, 1, 1, '2020-11-01 13:38:16'),
(137, 147, 1, 1, 2, '2020-11-01 13:38:16'),
(138, 147, 1, 1, 3, '2020-11-01 13:38:16'),
(139, 148, 1, 1, 1, '2020-11-01 13:38:16'),
(140, 148, 1, 1, 2, '2020-11-01 13:38:16'),
(141, 148, 1, 1, 3, '2020-11-01 13:38:16'),
(142, 112, 1, 1, 1, '2020-11-01 13:38:16'),
(143, 112, 1, 1, 2, '2020-11-01 13:38:16'),
(144, 112, 1, 1, 3, '2020-11-01 13:38:16'),
(145, 90, 1, 1, 1, '2020-11-01 13:38:16'),
(146, 90, 1, 1, 2, '2020-11-01 13:38:16'),
(147, 90, 1, 1, 3, '2020-11-01 13:38:16'),
(148, 92, 1, 1, 1, '2020-11-01 13:38:16'),
(149, 92, 1, 1, 2, '2020-11-01 13:38:16'),
(150, 92, 1, 1, 3, '2020-11-01 13:38:16'),
(151, 107, 1, 1, 1, '2020-11-01 13:38:16'),
(152, 107, 1, 1, 2, '2020-11-01 13:38:16'),
(153, 107, 1, 1, 3, '2020-11-01 13:38:16'),
(154, 115, 1, 1, 1, '2020-11-01 13:38:16'),
(155, 115, 1, 1, 2, '2020-11-01 13:38:16'),
(156, 115, 1, 1, 3, '2020-11-01 13:38:16'),
(157, 150, 1, 1, 1, '2020-11-01 13:38:16'),
(158, 150, 1, 1, 2, '2020-11-01 13:38:16'),
(159, 150, 1, 1, 3, '2020-11-01 13:38:16'),
(160, 149, 1, 1, 1, '2020-11-01 13:38:16'),
(161, 149, 1, 1, 2, '2020-11-01 13:38:16'),
(162, 149, 1, 1, 3, '2020-11-01 13:38:16'),
(163, 152, 1, 1, 1, '2020-11-01 13:38:16'),
(164, 152, 1, 1, 2, '2020-11-01 13:38:16'),
(165, 152, 1, 1, 3, '2020-11-01 13:38:16'),
(166, 151, 1, 1, 1, '2020-11-01 13:38:16'),
(167, 151, 1, 1, 2, '2020-11-01 13:38:16'),
(168, 151, 1, 1, 3, '2020-11-01 13:38:16'),
(169, 109, 1, 1, 1, '2020-11-01 13:38:16'),
(170, 109, 1, 1, 2, '2020-11-01 13:38:16'),
(171, 109, 1, 1, 3, '2020-11-01 13:38:16'),
(172, 153, 1, 1, 1, '2020-11-01 13:38:16'),
(173, 153, 1, 1, 2, '2020-11-01 13:38:16'),
(174, 153, 1, 1, 3, '2020-11-01 13:38:16'),
(175, 154, 1, 1, 1, '2020-11-01 13:38:16'),
(176, 154, 1, 1, 2, '2020-11-01 13:38:16'),
(177, 154, 1, 1, 3, '2020-11-01 13:38:16'),
(178, 156, 1, 1, 1, '2020-11-01 13:38:16'),
(179, 156, 1, 1, 2, '2020-11-01 13:38:16'),
(180, 156, 1, 1, 3, '2020-11-01 13:38:16'),
(181, 157, 1, 1, 1, '2020-11-01 13:38:16'),
(182, 157, 1, 1, 2, '2020-11-01 13:38:16'),
(183, 157, 1, 1, 3, '2020-11-01 13:38:16'),
(184, 103, 1, 1, 1, '2020-11-01 13:38:16'),
(185, 103, 1, 1, 2, '2020-11-01 13:38:16'),
(186, 103, 1, 1, 3, '2020-11-01 13:38:16'),
(187, 155, 1, 1, 1, '2020-11-01 13:38:16'),
(188, 155, 1, 1, 2, '2020-11-01 13:38:16'),
(189, 155, 1, 1, 3, '2020-11-01 13:38:16'),
(190, 158, 1, 1, 1, '2020-11-01 13:38:16'),
(191, 158, 1, 1, 2, '2020-11-01 13:38:16'),
(192, 158, 1, 1, 3, '2020-11-01 13:38:16'),
(193, 91, 1, 1, 1, '2020-11-01 13:38:16'),
(194, 91, 1, 1, 2, '2020-11-01 13:38:16'),
(195, 91, 1, 1, 3, '2020-11-01 13:38:16'),
(196, 106, 1, 1, 1, '2020-11-01 13:38:16'),
(197, 106, 1, 1, 2, '2020-11-01 13:38:16'),
(198, 106, 1, 1, 3, '2020-11-01 13:38:16'),
(199, 159, 1, 1, 1, '2020-11-01 13:38:16'),
(200, 159, 1, 1, 2, '2020-11-01 13:38:16'),
(201, 159, 1, 1, 3, '2020-11-01 13:38:16'),
(202, 100, 1, 1, 1, '2020-11-01 13:38:16'),
(203, 100, 1, 1, 2, '2020-11-01 13:38:16'),
(204, 100, 1, 1, 3, '2020-11-01 13:38:16'),
(205, 160, 1, 1, 1, '2020-11-01 13:38:16'),
(206, 160, 1, 1, 2, '2020-11-01 13:38:16'),
(207, 160, 1, 1, 3, '2020-11-01 13:38:16'),
(208, 161, 1, 1, 1, '2020-11-01 13:38:16'),
(209, 161, 1, 1, 2, '2020-11-01 13:38:16'),
(210, 161, 1, 1, 3, '2020-11-01 13:38:16'),
(211, 162, 1, 1, 1, '2020-11-01 13:38:16'),
(212, 162, 1, 1, 2, '2020-11-01 13:38:16'),
(213, 162, 1, 1, 3, '2020-11-01 13:38:16'),
(214, 108, 1, 1, 1, '2020-11-01 13:38:16'),
(215, 108, 1, 1, 2, '2020-11-01 13:38:16'),
(216, 108, 1, 1, 3, '2020-11-01 13:38:16'),
(217, 114, 1, 1, 1, '2020-11-01 13:38:16'),
(218, 114, 1, 1, 2, '2020-11-01 13:38:16'),
(219, 114, 1, 1, 3, '2020-11-01 13:38:16'),
(220, 89, 1, 1, 1, '2020-11-01 13:38:16'),
(221, 89, 1, 1, 2, '2020-11-01 13:38:16'),
(222, 89, 1, 1, 3, '2020-11-01 13:38:16'),
(223, 121, 1, 1, 1, '2020-11-01 13:38:16'),
(224, 121, 1, 1, 2, '2020-11-01 13:38:16'),
(225, 121, 1, 1, 3, '2020-11-01 13:38:16'),
(226, 163, 1, 1, 1, '2020-11-01 13:38:16'),
(227, 163, 1, 1, 2, '2020-11-01 13:38:16'),
(228, 163, 1, 1, 3, '2020-11-01 13:38:16'),
(229, 164, 1, 1, 1, '2020-11-01 13:38:16'),
(230, 164, 1, 1, 2, '2020-11-01 13:38:16'),
(231, 164, 1, 1, 3, '2020-11-01 13:38:16'),
(232, 165, 1, 1, 1, '2020-11-01 13:38:16'),
(233, 165, 1, 1, 2, '2020-11-01 13:38:16'),
(234, 165, 1, 1, 3, '2020-11-01 13:38:16'),
(235, 166, 1, 1, 1, '2020-11-01 13:38:16'),
(236, 166, 1, 1, 2, '2020-11-01 13:38:16'),
(237, 166, 1, 1, 3, '2020-11-01 13:38:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_grouprole`
--

CREATE TABLE `tb_grouprole` (
  `groupRoleID` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_grouprole`
--

INSERT INTO `tb_grouprole` (`groupRoleID`, `description`) VALUES
(1, 'Administrador'),
(2, 'ETL - Arquivos'),
(3, 'ETL - BD a BD'),
(4, 'Gestor de Ontologia'),
(5, 'Gestor de Repositório'),
(6, 'Notificador Médico'),
(7, 'Notificador Profissional de Saúde');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_grouprolepermission`
--

CREATE TABLE `tb_grouprolepermission` (
  `groupRoleID` int(11) NOT NULL,
  `permissionID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_hospitalunit`
--

CREATE TABLE `tb_hospitalunit` (
  `hospitalUnitID` int(10) NOT NULL,
  `hospitalUnitName` varchar(500) NOT NULL COMMENT '(pt-br) Nome da unidade hospitalar.\r\n(en) Name of the hospital unit.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='(pt-br) Tabela para identificação de unidades hospitalares.\r\n(en) Table for hospital units identification.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_language`
--

CREATE TABLE `tb_language` (
  `languageID` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_language`
--

INSERT INTO `tb_language` (`languageID`, `description`) VALUES
(1, 'pt-br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_listofvalues`
--

CREATE TABLE `tb_listofvalues` (
  `listOfValuesID` int(10) NOT NULL,
  `listTypeID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='(pt-br) Representa todos os valores padronizados do formulário.\r\n(en) Represents all standard values on the form.';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_listtype`
--

CREATE TABLE `tb_listtype` (
  `listTypeID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_multilanguage`
--

CREATE TABLE `tb_multilanguage` (
  `languageID` int(11) NOT NULL,
  `description` varchar(300) NOT NULL,
  `descriptionLang` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_multilanguage`
--

INSERT INTO `tb_multilanguage` (`languageID`, `description`, `descriptionLang`) VALUES
(1, '>15 L/min', '> 15 L/min'),
(1, '1-5 L/min', '1-5 L/min'),
(1, '11-15 L/min', '11-15 L/min'),
(1, '6-10 L/min', '6-10 L/min'),
(1, 'A class of questions with date answers.', 'Uma classe de perguntas com respostas na forma de data.'),
(1, 'A history of self-reported feverishness or measured fever of ≥ 38 degrees Celsius', 'Um histórico de febre autorelatado ou febre medida de ≥ 38oC'),
(1, 'A question where the possible answers are: Yes, No or Unknown.', 'Uma pergunta onde a resposta pode ser: Sim, Não ou Desconhecido'),
(1, 'A single question of a questionaire. The rdfs:label of the sub-classes reflect the exact questions text from the WHO CRF.', 'Uma pergunta de um questionário. As propriedades rdfs:label das sub-classes refletem exatamente as perguntas definidas no FRC da OMS.'),
(1, 'A term used to indicate that information on a specific question or subject can not be provided because there is no relevance.', 'Termo usado para indicar que a resposta a uma pergunta ou a informação sobre um assunto não pode ser dada porque não é aplicável.'),
(1, 'Abdominal pain', 'Dor abdominal'),
(1, 'Ability to self-care at discharge versus before illness', 'Habilidade de autocuidado na alta em comparação com antes da doença'),
(1, 'Acute renal injury', 'Lesão renal aguda'),
(1, 'Acute Respiratory Distress Syndrome', 'Síndrome Respiratória Aguda'),
(1, 'Admission date at this facility', 'Data de admissão nesta unidade'),
(1, 'Admission form', 'Formulário de Admissão'),
(1, 'Afghanistan', 'Afghanistan'),
(1, 'Age', 'Idade'),
(1, 'Age (months)', 'Idade (meses)'),
(1, 'Age (years)', 'Idade (anos)'),
(1, 'Aland Islands', 'Aland Islands'),
(1, 'Albania', 'Albania'),
(1, 'Alert', 'Alerta'),
(1, 'Algeria', 'Algeria'),
(1, 'ALT/SGPT measurement', 'ALT/TGP'),
(1, 'Altered consciousness/confusion', 'Consciência alterada/confusão'),
(1, 'American Samoa', 'American Samoa'),
(1, 'Anaemia', 'Anemia'),
(1, 'Andorra', 'Andorra'),
(1, 'Angiotensin converting enzyme inhibitors (ACE inhibitors)', 'Inibidores da enzima de conversão da angiotensina (inibidores da ECA)'),
(1, 'Angiotensin II receptor blockers (ARBs)', 'Bloqueadores dos receptores de angiotensina II (BRAs)'),
(1, 'Angola', 'Angola'),
(1, 'Anguilla', 'Anguilla'),
(1, 'Antarctica', 'Antarctica'),
(1, 'Antibiotic', 'Antibiótico'),
(1, 'Antifungal agent', 'Agente antifungal'),
(1, 'Antigua and Barbuda', 'Antigua and Barbuda'),
(1, 'Antimalarial agent', 'Agente antimalárico'),
(1, 'Antiviral', 'Antiviral'),
(1, 'Antiviral list', 'Lista Antiviral'),
(1, 'APTT/APTR measurement', 'TTPA/APTR'),
(1, 'Argentina', 'Argentina'),
(1, 'Armenia', 'Armenia'),
(1, 'Aruba', 'Aruba'),
(1, 'Ashtma', 'Asma'),
(1, 'Asplenia', 'Asplenia'),
(1, 'AST/SGOT measurement', 'AST/TGO'),
(1, 'Australia', 'Australia'),
(1, 'Austria', 'Austria'),
(1, 'AVPU list', 'Lista AVDI'),
(1, 'AVPU scale', 'Escala A V D I'),
(1, 'Azerbaijan', 'Azerbaijan'),
(1, 'Azithromycin', 'Azitromicina'),
(1, 'Bacteraemia', 'Bacteremia'),
(1, 'Bahamas', 'Bahamas'),
(1, 'Bahrain', 'Bahrain'),
(1, 'Bangladesh', 'Bangladesh'),
(1, 'Barbados', 'Barbados'),
(1, 'Belarus', 'Belarus'),
(1, 'Belgium', 'Belgium'),
(1, 'Belize', 'Belize'),
(1, 'Benin', 'Benin'),
(1, 'Bermuda', 'Bermuda'),
(1, 'Better', 'Melhor'),
(1, 'Bhutan', 'Bhutan'),
(1, 'Bleeding', 'Sangramento (hemorragia)'),
(1, 'Bleeding (Haemorrhage)', 'Sangramento (hemorragia)'),
(1, 'Bolivia, Plurinational State of', 'Bolivia, Plurinational State of'),
(1, 'Boolean_Question', 'Questão booleana'),
(1, 'Bosnia and Herzegovina', 'Bosnia and Herzegovina'),
(1, 'Botswana', 'Botswana'),
(1, 'Bouvet Island', 'Bouvet Island'),
(1, 'BP (diastolic)', 'Pressão arterial (diastólica)'),
(1, 'BP (systolic)', 'Pressão arterial (sistólica)'),
(1, 'Brazil', 'Brazil'),
(1, 'British Indian Ocean Territory', 'British Indian Ocean Territory'),
(1, 'Bronchiolitis', 'Bronquiolite'),
(1, 'Brunei Darussalam', 'Brunei Darussalam'),
(1, 'Bulgaria', 'Bulgaria'),
(1, 'Burkina Faso', 'Burkina Faso'),
(1, 'Burundi', 'Burundi'),
(1, 'Cambodia', 'Cambodia'),
(1, 'Cameroon', 'Cameroon'),
(1, 'Canada', 'Canada'),
(1, 'Cape Verde', 'Cape Verde'),
(1, 'Cardiac arrest', 'Parada cardíaca'),
(1, 'Cardiac arrhythmia', 'Arritmia cardíaca'),
(1, 'Cardiomyopathy', 'Cardiomiopatia'),
(1, 'Cayman Islands', 'Cayman Islands'),
(1, 'Central African Republic', 'Central African Republic'),
(1, 'Chad', 'Chad'),
(1, 'Chest pain', 'Dor no peito'),
(1, 'Chest X-Ray /CT performed', 'Radiografia/tomografia computadorizada do tórax feita'),
(1, 'Chile', 'Chile'),
(1, 'China', 'China'),
(1, 'Chloroquine/hydroxychloroquine', 'Cloroquina / hidroxicloroquina'),
(1, 'Christmas Island', 'Christmas Island'),
(1, 'Chronic cardiac disease (not hypertension)', 'Doença cardíaca crônica (não hipertensão)'),
(1, 'Chronic kidney disease', 'Doença renal crônica'),
(1, 'Chronic liver disease', 'Doença hepática crônica'),
(1, 'Chronic neurological disorder', 'Doença neurológica crônica'),
(1, 'Chronic pulmonary disease', 'Doença pulmonar crônica'),
(1, 'Clinical inclusion criteria', 'Critérios Clínicos para Inclusão'),
(1, 'Clinical suspicion of ARI despite not meeting criteria above', 'Suspeita clínica de IRA apesar de não apresentar os sintomas acima'),
(1, 'Co-morbidities', 'Comorbidades'),
(1, 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands'),
(1, 'Colombia', 'Colombia'),
(1, 'Comoros', 'Comoros'),
(1, 'Complications', 'Complicações'),
(1, 'Concentrator', 'Concentrador'),
(1, 'Confusion', 'Confusão'),
(1, 'Congo', 'Congo'),
(1, 'Congo, the Democratic Republic of the', 'Congo, the Democratic Republic of the'),
(1, 'Conjunctivitis', 'Conjuntivite'),
(1, 'Cook Islands', 'Cook Islands'),
(1, 'Coronavirus', 'Coronavírus'),
(1, 'Coronavirus list', 'Lista Coronavirus'),
(1, 'Corticosteroid', 'Corticosteroide'),
(1, 'Corticosteroid list', 'Lista Corticosteroid'),
(1, 'Costa Rica', 'Costa Rica'),
(1, 'Cote d\'Ivoire', 'Cote d\'Ivoire'),
(1, 'Cough', 'Tosse'),
(1, 'Cough with haemoptysis', 'Tosse com hemóptise'),
(1, 'Cough with sputum', 'Tosse com expectoração'),
(1, 'Cough with sputum production', 'Tosse com expectoração'),
(1, 'Country', 'País'),
(1, 'Country list', 'Lista Paises'),
(1, 'CPAP/NIV mask', 'Máscara CPAP/VNI'),
(1, 'Creatine kinase measurement', 'Creatina quinase'),
(1, 'Creatinine measurement', 'Creatinina'),
(1, 'CRF section grouping questions about clinical inclusion criteria.', 'Parte do FRC que agrupa perguntas sobre os critérios clínicos para inclusão.'),
(1, 'Croatia', 'Croatia'),
(1, 'CRP measurement', 'PCR'),
(1, 'Cuba', 'Cuba'),
(1, 'Current smoking', 'Fumante'),
(1, 'Cylinder', 'Cilindro'),
(1, 'Cyprus', 'Cyprus'),
(1, 'Czech Republic', 'Czech Republic'),
(1, 'D-dimer measurement', 'Dimero D'),
(1, 'Daily clinical features', 'Sintomas diários'),
(1, 'Date of Birth', 'Data de nascimento'),
(1, 'Date of enrolment', 'Data de inscrição'),
(1, 'Date of follow up', 'Data do acompanhamento'),
(1, 'Date of ICU/HDU admission', 'Data de Admissão no CTI/UTI'),
(1, 'Date of onset and admission vital signs', 'Início da doença e sinais vitais na admissão'),
(1, 'Date question', 'Pergunta sobre data'),
(1, 'Death', 'Óbito'),
(1, 'Demographics', 'Dados demográficos'),
(1, 'Denmark', 'Denmark'),
(1, 'Diabetes', 'Diabete'),
(1, 'Diagnostic/pathogen testing', 'DIagnóstico/teste de patógenos'),
(1, 'Diarrhoea', 'Diarréia'),
(1, 'Discharge sub-section of the WHO COVID-19 CRF. This sub-section is provided when the patient is discharged from the health center or in the case of death.', 'Sub-seção de alta do FRC para o COVID-19 da OMS. Essa sub-seção é fornecida quando o paciente recebe alta do centro médica or em caso de óbito.'),
(1, 'Discharge/death form', 'Formulário de alta/óbito'),
(1, 'Discharged alive', 'Alta'),
(1, 'Djibouti', 'Djibouti'),
(1, 'Dominica', 'Dominica'),
(1, 'Dominican Republic', 'Dominican Republic'),
(1, 'duration in days', 'duração em dias'),
(1, 'duration in weeks', 'duração em semanas'),
(1, 'Dyspnoea (shortness of breath) OR Tachypnoea', 'Dispneia (falta de ar) ou Taquipneia'),
(1, 'e.g.BIPAP/CPAP', 'p.ex. BIPAP, CPAP'),
(1, 'Ecuador', 'Ecuador'),
(1, 'Egypt', 'Egypt'),
(1, 'El Salvador', 'El Salvador'),
(1, 'Endocarditis', 'Endocardite'),
(1, 'Equatorial Guinea', 'Equatorial Guinea'),
(1, 'Eritrea', 'Eritrea'),
(1, 'ESR measurement', 'VHS'),
(1, 'Estonia', 'Estonia'),
(1, 'Ethiopia', 'Ethiopia'),
(1, 'Existing conditions prior to admission.', 'Comorbidades existentes antes da admissão.'),
(1, 'Experimental agent', 'Agente experimental'),
(1, 'Extracorporeal (ECMO) support', 'Suporte extracorpóreo (ECMO)'),
(1, 'Facility name', 'Nome da Instalação'),
(1, 'Falciparum malaria', 'Malária Falciparum'),
(1, 'Falkland Islands (Malvinas)', 'Falkland Islands (Malvinas)'),
(1, 'Faroe Islands', 'Faroe Islands'),
(1, 'Fatigue/Malaise', 'Fadiga/mal estar'),
(1, 'Favipiravir', 'Favipiravir'),
(1, 'Female', 'Feminino'),
(1, 'Ferritin measurement', 'Ferritina'),
(1, 'Fiji', 'Fiji'),
(1, 'Finland', 'Finland'),
(1, 'FiO2 value', 'Fração de oxigênio inspirado'),
(1, 'first available data at presentation/admission', 'primeiros dados disponíveis na admissão'),
(1, 'Follow-up', 'Acompanhamento'),
(1, 'Follow-up sub-section of the WHO COVID-19 CRF. The completion frequency of this sub-section is determined by available resources.', 'Sub-seção do FRC para o COVID-19 da OMS. A frequência de preenchimento dessa sub-seção é determinada pelos recursos disponíveis.'),
(1, 'France', 'France'),
(1, 'French Guiana', 'French Guiana'),
(1, 'French Polynesia', 'French Polynesia'),
(1, 'French Southern Territories', 'French Southern Territories'),
(1, 'Gabon', 'Gabon'),
(1, 'Gambia', 'Gambia'),
(1, 'Georgia', 'Georgia'),
(1, 'Germany', 'Germany'),
(1, 'Gestational weeks assessment', 'Tempo de gravidez'),
(1, 'Ghana', 'Ghana'),
(1, 'Gibraltar', 'Gibraltar'),
(1, 'Glasgow Coma Score (GCS /15)', 'Escala de Coma de Glasgow (GCS /15)'),
(1, 'Greece', 'Greece'),
(1, 'Greenland', 'Greenland'),
(1, 'Grenada', 'Grenada'),
(1, 'Guadeloupe', 'Guadeloupe'),
(1, 'Guam', 'Guam'),
(1, 'Guatemala', 'Guatemala'),
(1, 'Guernsey', 'Guernsey'),
(1, 'Guinea', 'Guinea'),
(1, 'Guinea-Bissau', 'Guinea-Bissau'),
(1, 'Guyana', 'Guyana'),
(1, 'Haematocrit measurement', 'Hematócrito'),
(1, 'Haemoglobin measurement', 'Hemoglobina'),
(1, 'Haiti', 'Haiti'),
(1, 'Headache', 'Dor de cabeça'),
(1, 'Healthcare worker', 'Profissional de Saúde'),
(1, 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands'),
(1, 'Heart rate', 'Frequência cardíaca'),
(1, 'Height', 'Altura'),
(1, 'HF nasal cannula', 'Cânula nasal de alto fluxo'),
(1, 'History of fever', 'Histórico de febre'),
(1, 'HIV', 'HIV'),
(1, 'HIV list', 'Lista HIV'),
(1, 'Holy See (Vatican City State)', 'Holy See (Vatican City State)'),
(1, 'Honduras', 'Honduras'),
(1, 'Hong Kong', 'Hong Kong'),
(1, 'Hospitalized', 'Internado'),
(1, 'Hungary', 'Hungary'),
(1, 'Hypertension', 'Hipertensão'),
(1, 'Iceland', 'Iceland'),
(1, 'ICU or High Dependency Unit admission', 'UTI ou UCE'),
(1, 'ICU/HDU discharge date', 'Data de Alta do CTI/UTI'),
(1, 'If bleeding: specify site(s)', 'Caso afirmativo: especifique o(s) local(is)'),
(1, 'If yes, specify', 'Caso afirmativo, especifique'),
(1, 'IL-6 measurement', 'IL-6'),
(1, 'Inability to walk', 'Incapaz de andar'),
(1, 'India', 'India'),
(1, 'Indonesia', 'Indonesia'),
(1, 'Infiltrates present', 'Presença de infiltrados'),
(1, 'Influenza virus', 'Vírus influenza'),
(1, 'Influenza virus type', 'tipo de vírus influenza'),
(1, 'Inhaled', 'Inalatória'),
(1, 'Inotropes/vasopressors', 'Inotrópicos/vasopressores'),
(1, 'INR measurement', 'INR'),
(1, 'Interface list', 'Lista Interface de O2'),
(1, 'Interferon alpha', 'Interferon alfa'),
(1, 'Interferon beta', 'Interferon beta'),
(1, 'Intravenous', 'Intravenosa'),
(1, 'Intravenous fluids', 'Hidratação venosa'),
(1, 'Invasive ventilation', 'Ventilação invasiva'),
(1, 'Iran, Islamic Republic of', 'Iran, Islamic Republic of'),
(1, 'Iraq', 'Iraq'),
(1, 'Ireland', 'Ireland'),
(1, 'Is the patient CURRENTLY receiving any of the following?', 'O paciente esta recebendo algum dos seguintes ATUALMENTE?'),
(1, 'Isle of Man', 'Isle of Man'),
(1, 'Israel', 'Israel'),
(1, 'Italy', 'Italy'),
(1, 'Jamaica', 'Jamaica'),
(1, 'Japan', 'Japan'),
(1, 'Jersey', 'Jersey'),
(1, 'Joint pain (arthralgia)', 'Dor articular (artralgia)'),
(1, 'Jordan', 'Jordan'),
(1, 'Kazakhstan', 'Kazakhstan'),
(1, 'Kenya', 'Kenya'),
(1, 'Kiribati', 'Kiribati'),
(1, 'Korea, Democratic People\'s Republic of', 'Korea, Democratic People\'s Republic of'),
(1, 'Korea, Republic of', 'Korea, Republic of'),
(1, 'Kuwait', 'Kuwait'),
(1, 'Kyrgyzstan', 'Kyrgyzstan'),
(1, 'Laboratory question', 'Pergunta laboratorial'),
(1, 'Laboratory results', 'Resultados laboratoriais'),
(1, 'Laboratory Worker', 'Profissional de Laboratório'),
(1, 'Lactate measurement', 'Lactose'),
(1, 'Lao People\'s Democratic Republic', 'Lao People\'s Democratic Republic'),
(1, 'Latvia', 'Latvia'),
(1, 'LDH measurement', 'LDH'),
(1, 'Lebanon', 'Lebanon'),
(1, 'Lesotho', 'Lesotho'),
(1, 'Liberia', 'Liberia'),
(1, 'Libyan Arab Jamahiriya', 'Libyan Arab Jamahiriya'),
(1, 'Liechtenstein', 'Liechtenstein'),
(1, 'List of instances of the answers for the \'Sex at Birth\' question. In the WHO CRF, the three possible answers are: male, female or not specified.', 'Lista de instâncias das possíveis respostas para a pergunta \'Sexo as nascer\'. No FRC da OMS as três possíveis respostas são: masculino, feminino ou não especificado.'),
(1, 'List question', 'Questão com respostas em lista padronizada'),
(1, 'Lithuania', 'Lithuania'),
(1, 'Liver dysfunction', 'Disfunção hepática'),
(1, 'Lopinavir/Ritonavir', 'Lopinavir/Ritonavir'),
(1, 'Loss of smell', 'Perda do Olfato'),
(1, 'Loss of smell daily', 'Perda do Olfato'),
(1, 'Loss of smell signs', 'Perda do Olfato'),
(1, 'Loss of taste', 'Perda do paladar'),
(1, 'Loss of taste daily', 'Perda do paladar'),
(1, 'Loss of taste signs', 'Perda do paladar'),
(1, 'Lower chest wall indrawing', 'Retração toráxica'),
(1, 'Luxembourg', 'Luxembourg'),
(1, 'Lymphadenopathy', 'Linfadenopatia'),
(1, 'Macao', 'Macao'),
(1, 'Macedonia, the former Yugoslav Republic of', 'Macedonia, the former Yugoslav Republic of'),
(1, 'Madagascar', 'Madagascar'),
(1, 'Malawi', 'Malawi'),
(1, 'Malaysia', 'Malaysia'),
(1, 'Maldives', 'Maldives'),
(1, 'Male', 'Masculino'),
(1, 'Mali', 'Mali'),
(1, 'Malignant neoplasm', 'Neoplasma maligno'),
(1, 'Malnutrition', 'Desnutrição'),
(1, 'Malta', 'Malta'),
(1, 'Marshall Islands', 'Marshall Islands'),
(1, 'Martinique', 'Martinique'),
(1, 'Mask', 'Máscara'),
(1, 'Mask with reservoir', 'Máscara com reservatório'),
(1, 'Mauritania', 'Mauritania'),
(1, 'Mauritius', 'Mauritius'),
(1, 'Maximum daily corticosteroid dose', 'Dose diária máxima de corticosteroide'),
(1, 'Mayotte', 'Mayotte'),
(1, 'Medication', 'Medicação'),
(1, 'Meningitis/Encephalitis', 'Meningite/encefalite'),
(1, 'MERS-CoV', 'MERS-CoV'),
(1, 'Mexico', 'Mexico'),
(1, 'Micronesia, Federated States of', 'Micronesia, Federated States of'),
(1, 'Mid-upper arm circumference', 'Circunferência braquial'),
(1, 'Moldova, Republic of', 'Moldova, Republic of'),
(1, 'Monaco', 'Monaco'),
(1, 'Mongolia', 'Mongolia'),
(1, 'Montenegro', 'Montenegro'),
(1, 'Montserrat', 'Montserrat'),
(1, 'Morocco', 'Morocco'),
(1, 'Mozambique', 'Mozambique'),
(1, 'Muscle aches (myalgia)', 'Dor muscular (mialgia)'),
(1, 'Myanmar', 'Myanmar'),
(1, 'Myocarditis/Pericarditis', 'Miocardite/Pericardite'),
(1, 'N/A', 'Não informado'),
(1, 'Namibia', 'Namibia'),
(1, 'Nauru', 'Nauru'),
(1, 'Negative', 'Negativo'),
(1, 'Nepal', 'Nepal'),
(1, 'Netherlands', 'Netherlands'),
(1, 'Netherlands Antilles', 'Netherlands Antilles'),
(1, 'Neuraminidase inhibitor', 'Inibidor de neuraminidase'),
(1, 'New Caledonia', 'New Caledonia'),
(1, 'New Zealand', 'New Zealand'),
(1, 'Nicaragua', 'Nicaragua'),
(1, 'Niger', 'Niger'),
(1, 'Nigeria', 'Nigeria'),
(1, 'Niue', 'Niue'),
(1, 'No', 'Não'),
(1, 'Non-Falciparum malaria', 'Malária Não Falciparum'),
(1, 'Non-invasive ventilation', 'Ventilação não-invasiva'),
(1, 'Non-steroidal anti-inflammatory (NSAID)', 'Antiinflamatório não esteroide (AINE)'),
(1, 'Norfolk Island', 'Norfolk Island'),
(1, 'Northern Mariana Islands', 'Northern Mariana Islands'),
(1, 'Norway', 'Norway'),
(1, 'Not done', 'Não realizado'),
(1, 'Not known, not observed, not recorded, or refused.', 'Desconhecido, não observado, não registrato or recusado.'),
(1, 'Not Specified', 'Não especificado'),
(1, 'Number question', 'Pergunta numérica'),
(1, 'O2 flow', 'Vazão de O2'),
(1, 'O2 flow list', 'Lista fluxo de O2'),
(1, 'Oman', 'Oman'),
(1, 'Oral', 'Oral'),
(1, 'Oral/orogastric fluids', 'Hidratação oral/orogástrica'),
(1, 'Other co-morbidities', 'Outras comorbidades'),
(1, 'Other complication', 'Outra complicação'),
(1, 'Other corona virus', 'Outro coronavírus'),
(1, 'Other respiratory pathogen', 'Outro patógeno respiratório'),
(1, 'Other signs or symptoms', 'Outros'),
(1, 'Outcome', 'Desfecho'),
(1, 'Outcome date', 'Data do desfecho'),
(1, 'Outcome list', 'Lista de desfecho'),
(1, 'Outcome saturation list', 'Lista de Saturação de desfecho'),
(1, 'Oxygen interface', 'Interface de oxigenoterapia'),
(1, 'Oxygen saturation', 'Saturação de oxigênio'),
(1, 'Oxygen saturation expl', 'em'),
(1, 'Oxygen therapy', 'Oxigenoterapia'),
(1, 'PaCO2 value', 'Pressão parcial do CO2'),
(1, 'Pain', 'Dor'),
(1, 'Pakistan', 'Pakistan'),
(1, 'Palau', 'Palau'),
(1, 'Palestinian Territory, Occupied', 'Palestinian Territory, Occupied'),
(1, 'Palliative discharge', 'Alta paliativa'),
(1, 'Panama', 'Panama'),
(1, 'Pancreatitis', 'Pancreatite'),
(1, 'PaO2 value', 'Pressão parcial do O2'),
(1, 'Papua New Guinea', 'Papua New Guinea'),
(1, 'Paraguay', 'Paraguay'),
(1, 'PEEP value', 'Pressão expiratória final positiva'),
(1, 'Peru', 'Peru'),
(1, 'Philippines', 'Philippines'),
(1, 'Piped', 'Canalizado'),
(1, 'Pitcairn', 'Pitcairn'),
(1, 'Plateau pressure value', 'Pressão do plato'),
(1, 'Platelets measurement', 'Plaquetas'),
(1, 'Pneumonia', 'Pneumonia'),
(1, 'PNNot_done_Question', 'Questão com resposta Positivo Negativo ou não realizada'),
(1, 'pnnotdone_list', 'Lista PNNotDone'),
(1, 'Poland', 'Poland'),
(1, 'Portugal', 'Portugal'),
(1, 'Positive', 'Positivo'),
(1, 'Potassium measurement', 'Potássio'),
(1, 'Pre-admission & chronic medication', 'Pré-admissão e medicamentos de uso contínuo'),
(1, 'Pregnant', 'Grávida'),
(1, 'Procalcitonin measurement', 'Procalcitonina'),
(1, 'Prone position', 'Posição prona'),
(1, 'Proven or suspected infection with pathogen of Public Health Interest', 'Quadro de infecção comprovada ou suspeita com patógeno de interesse para a Saúde Pública'),
(1, 'PT measurement', 'TP'),
(1, 'Puerto Rico', 'Puerto Rico'),
(1, 'Qatar', 'Qatar'),
(1, 'Renal replacement therapy (RRT) or dialysis', 'Terapia de substituição renal ou diálise'),
(1, 'Respiratory rate', 'Frequência respiratória'),
(1, 'Reunion ﻿ Réunion', 'Reunion ﻿ Réunion'),
(1, 'Ribavirin', 'Ribavirina'),
(1, 'Romania', 'Romania'),
(1, 'Room air', 'ar ambiente'),
(1, 'Runny nose (rhinorrhoea)', 'Coriza (rinorréia)'),
(1, 'Russian Federation', 'Russian Federation'),
(1, 'Rwanda', 'Rwanda'),
(1, 'Saint Barthélemy', 'Saint Barthélemy'),
(1, 'Saint Helena', 'Saint Helena'),
(1, 'Saint Kitts and Nevis', 'Saint Kitts and Nevis'),
(1, 'Saint Lucia', 'Saint Lucia'),
(1, 'Saint Martin (French part)', 'Saint Martin (French part)'),
(1, 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon'),
(1, 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines'),
(1, 'Same as before illness', 'Como antes da doença'),
(1, 'Samoa', 'Samoa'),
(1, 'San Marino', 'San Marino'),
(1, 'Sao Tome and Principe', 'Sao Tome and Principe'),
(1, 'SARS-CoV-2', 'SARS-CoV-2'),
(1, 'Saudi Arabia', 'Saudi Arabia'),
(1, 'Seizures', 'Convulsões'),
(1, 'self_care_list', 'Lista cuidados'),
(1, 'Senegal', 'Senegal'),
(1, 'Serbia', 'Serbia'),
(1, 'Severe dehydration', 'Desidratação severa'),
(1, 'Sex at Birth', 'Sexo ao Nascer'),
(1, 'sex at birth list', 'Lista de sexo'),
(1, 'Seychelles', 'Seychelles'),
(1, 'Shock', 'Choque'),
(1, 'Shortness of breath', 'Falta de ar'),
(1, 'Sierra Leone', 'Sierra Leone'),
(1, 'Signs and symptoms on admission', 'Sinais e sintomas na hora da admissão'),
(1, 'Singapore', 'Singapore'),
(1, 'Site name', 'Localidade'),
(1, 'Skin rash', 'Erupções cutâneas'),
(1, 'Skin ulcers', 'Úlceras cutâneas'),
(1, 'Slovakia', 'Slovakia'),
(1, 'Slovenia', 'Slovenia'),
(1, 'Sodium measurement', 'Sódio'),
(1, 'Solomon Islands', 'Solomon Islands'),
(1, 'Somalia', 'Somalia'),
(1, 'Sore throat', 'Dor de garganta'),
(1, 'Source of oxygen', 'Fonte de Oxigênio'),
(1, 'Source of oxygen list', 'lista de fonte de O2'),
(1, 'South Africa', 'South Africa'),
(1, 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands'),
(1, 'Spain', 'Spain'),
(1, 'specific response', 'resposta específica'),
(1, 'Sri Lanka', 'Sri Lanka'),
(1, 'Sternal capillary refill time >2seconds', 'Tempo de enchimento capilar >2 segundos'),
(1, 'Sudan', 'Sudan'),
(1, 'Supportive care', 'Cuidados'),
(1, 'Suriname', 'Suriname'),
(1, 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen'),
(1, 'Swaziland', 'Swaziland'),
(1, 'Sweden', 'Sweden'),
(1, 'Switzerland', 'Switzerland'),
(1, 'Symptom onset (date of first/earliest symptom)', 'Início de Sintomas (data do primeiro sintoma)'),
(1, 'Syrian Arab Republic', 'Syrian Arab Republic'),
(1, 'Systemic anticoagulation', 'Anticoagulação sistêmica'),
(1, 'Taiwan, Province of China', 'Taiwan, Province of China'),
(1, 'Tajikistan', 'Tajikistan'),
(1, 'Tanzania, United Republic of', 'Tanzania, United Republic of'),
(1, 'Temperature', 'Temperatura'),
(1, 'Text_Question', 'Questão com resposta textual'),
(1, 'Thailand', 'Thailand'),
(1, 'The affirmative response to a question.', 'A resposta afirmativa à uma pergunta.'),
(1, 'The country where the medical center is located.', 'O país onde o centro médico está localizado.'),
(1, 'The identifier of the person as a participant (the subject) of the reported case. According to WHO, this identifier should be a combination of the site code (the unique code of the health center) and the participant number (generated by the health center). Health center can obtain the site code and ', 'O identificador da pessoa enquanto participante (o objeto) do case relatado pelo FRC. De acordo com a OMS, esse identificador deve ser criado a partir da junção do código da localidade (o código único do centro médico) e do número do participante (gerado pelo centro médico). Centros médicos podem obter o código da localidade e se registrarem no sistema de gestão de dados da OMS contatando edcarn@who.int.'),
(1, 'The name of the health center in which the participant is being treated.', 'O centro médico onde o participante está sendo tratado.'),
(1, 'The non-affirmative response to a question.', 'A resposta negativa à uma pergunta.'),
(1, 'The number of breaths (inhalation and exhalation) taken per minute time.', 'O número de respirações medidos a cada minuto.'),
(1, 'The number of heartbeats measured per minute time.', 'O número de batimentos cardíacos medidos a cada minuto.'),
(1, 'The Person that is the case subject of the WHO CRF.', 'A Pessoa que é o objeto do caso relatado pelo FRC da OMS.'),
(1, 'This class represents the Rapid version of the World Health Organisation\'s (WHO) Case Record Form (CRF) for the COVID-19 outbreak.', 'Esta classe representa a versão Rapid do Formulário de Relato de Caso (FRC) para a epidemia COVID-19, criada pela Organização Mundial de Saúde.'),
(1, 'time in weeks', 'tempo em semanas'),
(1, 'Timor-Leste', 'Timor-Leste'),
(1, 'Togo', 'Togo'),
(1, 'Tokelau', 'Tokelau'),
(1, 'Tonga', 'Tonga'),
(1, 'Total bilirubin measurement', 'Bilirrubina total'),
(1, 'Total duration ECMO', 'duração em dias'),
(1, 'Total duration ICU/HCU', 'duração em dias'),
(1, 'Total duration Inotropes/vasopressors', 'duração em dias'),
(1, 'Total duration Invasive ventilation', 'duração em dias'),
(1, 'Total duration Non-invasive ventilation', 'duração em dias'),
(1, 'Total duration Oxygen Therapy', 'duração em dias'),
(1, 'Total duration Prone position', 'duração em dias'),
(1, 'Total duration RRT or dyalysis', 'duração em dias'),
(1, 'Transfer to other facility', 'Transferência para outra unidade'),
(1, 'Trinidad and Tobago', 'Trinidad and Tobago'),
(1, 'Troponin measurement', 'Troponina'),
(1, 'Tuberculosis', 'Tuberculose'),
(1, 'Tunisia', 'Tunisia'),
(1, 'Turkey', 'Turkey'),
(1, 'Turkmenistan', 'Turkmenistan'),
(1, 'Turks and Caicos Islands', 'Turks and Caicos Islands'),
(1, 'Tuvalu', 'Tuvalu'),
(1, 'Uganda', 'Uganda'),
(1, 'Ukraine', 'Ukraine'),
(1, 'United Arab Emirates', 'United Arab Emirates'),
(1, 'United Kingdom', 'United Kingdom'),
(1, 'United States', 'United States'),
(1, 'United States Minor Outlying Islands', 'United States Minor Outlying Islands'),
(1, 'Unknown', 'Desconhecido'),
(1, 'Unresponsive', 'Indiferente'),
(1, 'Urea (BUN) measurement', 'Uréia (BUN)'),
(1, 'Uruguay', 'Uruguay'),
(1, 'Uzbekistan', 'Uzbekistan'),
(1, 'Vanuatu', 'Vanuatu'),
(1, 'Venezuela, Bolivarian Republic of', 'Venezuela, Bolivarian Republic of'),
(1, 'Ventilation question', 'Questão sobre Ventilação'),
(1, 'Verbal', 'Verbal'),
(1, 'Viet Nam', 'Viet Nam'),
(1, 'Viral haemorrhagic fever', 'Febre viral hemorrágica'),
(1, 'Virgin Islands, British', 'Virgin Islands, British'),
(1, 'Virgin Islands, U.S.', 'Virgin Islands, U.S.'),
(1, 'Vital signs', 'Sinais Vitais'),
(1, 'Vomiting/Nausea', 'Vômito/náusea'),
(1, 'Wallis and Futuna', 'Wallis and Futuna'),
(1, 'Was pathogen testing done during this illness episode', 'Esse teste foi realizado durante este episódio da doença'),
(1, 'WBC count measurement', 'Leucócitos'),
(1, 'Weight', 'Peso'),
(1, 'Were any of the following taken within 14 days of admission?', 'Marque os usados nos 14 dias antes da admissão'),
(1, 'Western Sahara', 'Western Sahara'),
(1, 'Wheezing', 'Respiração sibilante'),
(1, 'Which antibiotic', 'Antibiótico'),
(1, 'Which antifungal agent', 'Qual agente antifungal'),
(1, 'Which antimalarial agent', 'Qual agente antimalárico'),
(1, 'Which antiviral', 'Qual antiviral'),
(1, 'Which complication', 'Qual complicação'),
(1, 'Which coronavirus', 'Qual coronavírus'),
(1, 'Which corticosteroid route', 'Qual via do corticosteroide'),
(1, 'Which experimental agent', 'Qual agente experimental'),
(1, 'Which NSAID', 'Qual AINE'),
(1, 'Which other antiviral', 'Qual outro antiviral'),
(1, 'Which other co-morbidities', 'Outras comorbidades'),
(1, 'Which other pathogen of public health interest detected', 'Qual outro patógeno'),
(1, 'Which respiratory pathogen', 'Qual patógeno respiratório'),
(1, 'Which sign or symptom', 'Qual sinal ou sintoma'),
(1, 'Which virus', 'Qual vírus'),
(1, 'WHO COVID-19 Rapid Version CRF', 'OMS-COVID-19-Rapid-FRC'),
(1, 'Worse', 'Pior'),
(1, 'Yemen', 'Yemen'),
(1, 'Yes', 'Sim'),
(1, 'Yes-not on ART', 'Sim-não toma antivirais'),
(1, 'Yes-on ART', 'Sim-toma antivirais'),
(1, 'ynu_list', 'Lista YNU'),
(1, 'YNU_Question', 'Questão com resposta Sim Não Desconhecido'),
(1, 'ynun_list', 'Lista YNUN'),
(1, 'YNUN_Question', 'Questão com resposta Sim Não Desconhecido Não Informado'),
(1, 'Zambia', 'Zambia'),
(1, 'Zimbabwe', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_notificationrecord`
--

CREATE TABLE `tb_notificationrecord` (
  `userID` int(11) NOT NULL,
  `profileID` int(11) NOT NULL,
  `hospitalUnitID` int(11) NOT NULL,
  `tableName` varchar(255) NOT NULL,
  `rowdID` int(11) NOT NULL,
  `changedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `operation` varchar(1) NOT NULL,
  `log` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ontology`
--

CREATE TABLE `tb_ontology` (
  `ontologyID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `acronym` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `dtRelease` timestamp NULL DEFAULT NULL,
  `license` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_ontologyterms`
--

CREATE TABLE `tb_ontologyterms` (
  `ontologyURI` varchar(255) NOT NULL,
  `ontologyID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_participant`
--

CREATE TABLE `tb_participant` (
  `participantID` int(10) NOT NULL,
  `medicalRecord` varchar(500) NOT NULL COMMENT '(pt-br) prontuário do paciente. \r\n(en) patient medical record.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='(pt-br) Tabela para registros de pacientes.\r\n(en) Table for patient records.';

--
-- Extraindo dados da tabela `tb_participant`
--

INSERT INTO `tb_participant` (`participantID`, `medicalRecord`) VALUES
(88, '100011583533'),
(89, '100015800495'),
(90, '100016037980'),
(91, '100016342133'),
(92, '100016403455'),
(93, '100016649438'),
(94, '100016712525'),
(95, '100017029697'),
(96, '100017201734'),
(97, '100017312028'),
(98, '100017339039'),
(99, '100017339997'),
(100, '100017446628'),
(101, '100017454192'),
(102, '100017494263'),
(103, '100017572316'),
(104, '100017600000'),
(105, '100017612534'),
(106, '100017612955'),
(107, '100017629702'),
(108, '100017632672'),
(109, '100017641384'),
(110, '100017643869'),
(111, '100017691801'),
(112, '100017737315'),
(113, '100017789100'),
(114, '100017821218'),
(115, '100017833114'),
(116, '100017857592'),
(117, '100017862519'),
(118, '100017882038'),
(119, '100017887391'),
(120, '100017895154'),
(121, '100017895352'),
(122, '100017895402'),
(123, '100017895436'),
(124, '100017895626'),
(125, '100017895659'),
(126, '100017895709'),
(127, '100017895774'),
(128, '100017895790'),
(129, '100017895808'),
(130, '100017895816'),
(131, '100017895824'),
(132, '100017895881'),
(133, '100017895915'),
(134, '100017895998'),
(135, '100017896053'),
(136, '100017896061'),
(137, '100017896244'),
(138, '100017896269'),
(139, '100017896285'),
(140, '100017896392'),
(141, '100017896442'),
(142, '100017896517'),
(143, '100017896525'),
(144, '100017896590'),
(145, '100017896673'),
(146, '100017896681'),
(147, '100017896699'),
(148, '100017896707'),
(149, '100017896822'),
(150, '100017896830'),
(151, '100017896863'),
(152, '100017896889'),
(153, '100017896988'),
(154, '100017897085'),
(155, '100017897101'),
(156, '100017897119'),
(157, '100017897143'),
(158, '100017897234'),
(159, '100017897333'),
(160, '100017897408'),
(161, '100017897473'),
(162, '100017897689'),
(163, '100017898349'),
(164, '100017898372'),
(165, '100017898521'),
(166, '100017898737');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_permission`
--

CREATE TABLE `tb_permission` (
  `permissionID` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_permission`
--

INSERT INTO `tb_permission` (`permissionID`, `description`) VALUES
(1, 'Insert'),
(2, 'Update'),
(3, 'Delete'),
(4, 'ALL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questiongroup`
--

CREATE TABLE `tb_questiongroup` (
  `questionGroupID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.',
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Relacionado ao Question Group da ontologia relaciona as diversas sessoes existentes nos formularios do CRF COVID-19';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questiongroupform`
--

CREATE TABLE `tb_questiongroupform` (
  `crfFormsID` int(10) NOT NULL,
  `questionID` int(10) NOT NULL,
  `questionOrder` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questiongroupformrecord`
--

CREATE TABLE `tb_questiongroupformrecord` (
  `questionGroupFormRecordID` int(10) NOT NULL,
  `formRecordID` int(10) NOT NULL,
  `crfFormsID` int(10) NOT NULL,
  `questionID` int(10) NOT NULL,
  `listOfValuesID` int(10) DEFAULT NULL,
  `answer` varchar(512) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='(pt-br) Tabela para registro da resposta associada a uma questão de um agrupamento de um formulário referente a um questionario de avaliação.\r\n(en) Form record table.';

--
-- Extraindo dados da tabela `tb_questiongroupformrecord`
--

INSERT INTO `tb_questiongroupformrecord` (`questionGroupFormRecordID`, `formRecordID`, `crfFormsID`, `questionID`, `listOfValuesID`, `answer`) VALUES
(1, 82, 1, 107, NULL, '18/11/1936'),
(2, 82, 1, 111, 284, NULL),
(3, 82, 1, 144, NULL, '83'),
(4, 82, 1, 166, 45, NULL),
(5, 82, 1, 167, NULL, '2020-04-30'),
(7, 83, 2, 35, 298, NULL),
(8, 83, 2, 101, 306, NULL),
(9, 83, 2, 101, 305, NULL),
(10, 83, 2, 150, 300, NULL),
(11, 83, 2, 168, NULL, '2020-04-30'),
(12, 84, 3, 35, 298, NULL),
(13, 84, 3, 101, 305, NULL),
(14, 84, 3, 101, 306, NULL),
(15, 84, 3, 123, 276, NULL),
(16, 84, 3, 124, NULL, '2020-05-13'),
(17, 220, 1, 107, NULL, '30/10/1926'),
(18, 220, 1, 111, 284, NULL),
(19, 220, 1, 144, NULL, '93'),
(20, 220, 1, 166, 45, NULL),
(21, 220, 1, 167, NULL, '2020-03-06'),
(23, 221, 2, 35, 298, NULL),
(24, 221, 2, 101, 305, NULL),
(25, 221, 2, 150, 298, NULL),
(26, 221, 2, 168, NULL, '2020-03-06'),
(27, 221, 2, 228, NULL, '2020-03-06'),
(28, 222, 3, 35, 298, NULL),
(29, 222, 3, 101, 305, NULL),
(30, 222, 3, 123, 275, NULL),
(31, 222, 3, 124, NULL, '2020-06-13'),
(32, 145, 1, 107, NULL, '29/07/1961'),
(33, 145, 1, 111, 285, NULL),
(34, 145, 1, 144, NULL, '58'),
(35, 145, 1, 166, 45, NULL),
(36, 145, 1, 167, NULL, '2020-05-13'),
(38, 146, 2, 35, 298, NULL),
(39, 146, 2, 101, 305, NULL),
(40, 146, 2, 150, 300, NULL),
(41, 146, 2, 168, NULL, '2020-05-13'),
(42, 147, 3, 35, 298, NULL),
(43, 147, 3, 101, 305, NULL),
(44, 147, 3, 123, 276, NULL),
(45, 147, 3, 124, NULL, '2020-05-19'),
(46, 193, 1, 107, NULL, '22/05/1989'),
(47, 193, 1, 111, 284, NULL),
(48, 193, 1, 144, NULL, '31'),
(49, 193, 1, 166, 45, NULL),
(50, 193, 1, 167, NULL, '2020-05-22'),
(52, 194, 2, 35, 298, NULL),
(53, 194, 2, 101, 305, NULL),
(54, 194, 2, 150, 300, NULL),
(55, 194, 2, 168, NULL, '2020-05-22'),
(56, 195, 3, 35, 298, NULL),
(57, 195, 3, 101, 305, NULL),
(58, 195, 3, 123, 276, NULL),
(59, 195, 3, 124, NULL, '2020-05-23'),
(60, 148, 1, 107, NULL, '26/04/1980'),
(61, 148, 1, 111, 285, NULL),
(62, 148, 1, 144, NULL, '40'),
(63, 148, 1, 166, 45, NULL),
(64, 148, 1, 167, NULL, '2020-05-13'),
(66, 149, 2, 35, 298, NULL),
(67, 149, 2, 101, 305, NULL),
(68, 149, 2, 101, 306, NULL),
(69, 149, 2, 150, 300, NULL),
(70, 149, 2, 168, NULL, '2020-05-13'),
(71, 150, 3, 35, 298, NULL),
(72, 150, 3, 101, 305, NULL),
(73, 150, 3, 101, 306, NULL),
(74, 150, 3, 123, 276, NULL),
(75, 150, 3, 124, NULL, '2020-05-14'),
(76, 10, 1, 107, NULL, '18/01/1955'),
(77, 10, 1, 111, 285, NULL),
(78, 10, 1, 144, NULL, '65'),
(79, 10, 1, 166, 45, NULL),
(80, 10, 1, 167, NULL, '2020-04-13'),
(82, 11, 2, 35, 298, NULL),
(83, 11, 2, 101, 306, NULL),
(84, 11, 2, 101, 305, NULL),
(85, 11, 2, 150, 298, NULL),
(86, 11, 2, 168, NULL, '2020-04-13'),
(87, 11, 2, 228, NULL, '2020-04-13'),
(88, 12, 3, 35, 298, NULL),
(89, 12, 3, 101, 305, NULL),
(90, 12, 3, 101, 306, NULL),
(91, 12, 3, 123, 275, NULL),
(92, 12, 3, 124, NULL, '2020-05-13'),
(93, 64, 1, 107, NULL, '24/01/1975'),
(94, 64, 1, 111, 284, NULL),
(95, 64, 1, 144, NULL, '45'),
(96, 64, 1, 166, 45, NULL),
(97, 64, 1, 167, NULL, '2020-04-26'),
(99, 65, 2, 35, 298, NULL),
(100, 65, 2, 101, 305, NULL),
(101, 65, 2, 101, 306, NULL),
(102, 65, 2, 150, 300, NULL),
(103, 65, 2, 168, NULL, '2020-04-26'),
(104, 66, 3, 35, 298, NULL),
(105, 66, 3, 101, 306, NULL),
(106, 66, 3, 101, 305, NULL),
(107, 66, 3, 123, 276, NULL),
(108, 66, 3, 124, NULL, '2020-04-29'),
(109, 55, 1, 107, NULL, '23/02/1949'),
(110, 55, 1, 111, 285, NULL),
(111, 55, 1, 144, NULL, '71'),
(112, 55, 1, 166, 45, NULL),
(113, 55, 1, 167, NULL, '2020-04-24'),
(115, 56, 2, 35, 298, NULL),
(116, 56, 2, 101, 305, NULL),
(117, 56, 2, 101, 306, NULL),
(118, 56, 2, 150, 300, NULL),
(119, 56, 2, 168, NULL, '2020-04-24'),
(120, 57, 3, 35, 298, NULL),
(121, 57, 3, 101, 305, NULL),
(122, 57, 3, 101, 306, NULL),
(123, 57, 3, 123, 276, NULL),
(124, 57, 3, 124, NULL, '2020-05-12'),
(125, 97, 1, 107, NULL, '03/01/1964'),
(126, 97, 1, 111, 285, NULL),
(127, 97, 1, 144, NULL, '56'),
(128, 97, 1, 166, 45, NULL),
(129, 97, 1, 167, NULL, '2020-04-05'),
(131, 98, 2, 35, 298, NULL),
(132, 98, 2, 101, 306, NULL),
(133, 98, 2, 101, 305, NULL),
(134, 98, 2, 150, 300, NULL),
(135, 98, 2, 168, NULL, '2020-04-05'),
(136, 99, 3, 35, 298, NULL),
(137, 99, 3, 101, 306, NULL),
(138, 99, 3, 101, 305, NULL),
(139, 99, 3, 123, 276, NULL),
(140, 99, 3, 124, NULL, '2020-05-07'),
(141, 94, 1, 107, NULL, '29/06/1974'),
(142, 94, 1, 111, 284, NULL),
(143, 94, 1, 144, NULL, '45'),
(144, 94, 1, 166, 45, NULL),
(145, 94, 1, 167, NULL, '2020-03-05'),
(147, 95, 2, 35, 298, NULL),
(148, 95, 2, 101, 305, NULL),
(149, 95, 2, 101, 306, NULL),
(150, 95, 2, 150, 300, NULL),
(151, 95, 2, 168, NULL, '2020-03-05'),
(152, 96, 3, 35, 298, NULL),
(153, 96, 3, 101, 305, NULL),
(154, 96, 3, 101, 306, NULL),
(155, 96, 3, 123, 276, NULL),
(156, 96, 3, 124, NULL, '2020-05-07'),
(157, 4, 1, 167, NULL, '2020-03-05'),
(158, 5, 2, 35, 298, NULL),
(159, 5, 2, 101, 305, NULL),
(160, 5, 2, 168, NULL, '2020-03-05'),
(161, 5, 2, 228, NULL, '2020-03-05'),
(162, 6, 3, 35, 298, NULL),
(163, 6, 3, 101, 305, NULL),
(164, 6, 3, 123, 275, NULL),
(165, 6, 3, 124, NULL, '2020-04-27'),
(166, 40, 1, 107, NULL, '25/05/1960'),
(167, 40, 1, 111, 285, NULL),
(168, 40, 1, 144, NULL, '60'),
(169, 40, 1, 166, 45, NULL),
(170, 40, 1, 167, NULL, '2020-04-22'),
(172, 41, 2, 35, 298, NULL),
(173, 41, 2, 101, 305, NULL),
(174, 41, 2, 101, 306, NULL),
(175, 41, 2, 150, 300, NULL),
(176, 41, 2, 168, NULL, '2020-04-22'),
(177, 42, 3, 35, 298, NULL),
(178, 42, 3, 101, 305, NULL),
(179, 42, 3, 101, 306, NULL),
(180, 42, 3, 123, 276, NULL),
(181, 42, 3, 124, NULL, '2020-02-05'),
(182, 202, 1, 107, NULL, '21/12/1951'),
(183, 202, 1, 111, 285, NULL),
(184, 202, 1, 144, NULL, '68'),
(185, 202, 1, 166, 45, NULL),
(186, 202, 1, 167, NULL, '2020-05-25'),
(188, 203, 2, 35, 298, NULL),
(189, 203, 2, 101, 305, NULL),
(190, 203, 2, 150, 300, NULL),
(191, 203, 2, 168, NULL, '2020-05-25'),
(192, 204, 3, 35, 298, NULL),
(193, 204, 3, 101, 305, NULL),
(194, 204, 3, 123, 276, NULL),
(195, 204, 3, 124, NULL, '2020-01-06'),
(196, 67, 1, 107, NULL, '30/08/1972'),
(197, 67, 1, 111, 284, NULL),
(198, 67, 1, 144, NULL, '47'),
(199, 67, 1, 166, 45, NULL),
(200, 67, 1, 167, NULL, '2020-04-27'),
(202, 68, 2, 35, 298, NULL),
(203, 68, 2, 101, 306, NULL),
(204, 68, 2, 101, 305, NULL),
(205, 68, 2, 150, 300, NULL),
(206, 68, 2, 168, NULL, '2020-04-27'),
(207, 69, 3, 35, 298, NULL),
(208, 69, 3, 101, 306, NULL),
(209, 69, 3, 101, 305, NULL),
(210, 69, 3, 123, 276, NULL),
(211, 69, 3, 124, NULL, '2020-05-06'),
(212, 103, 1, 107, NULL, '14/09/1959'),
(213, 103, 1, 111, 284, NULL),
(214, 103, 1, 144, NULL, '60'),
(215, 103, 1, 166, 45, NULL),
(216, 103, 1, 167, NULL, '2020-05-05'),
(218, 104, 2, 150, 300, NULL),
(219, 104, 2, 168, NULL, '2020-05-05'),
(220, 105, 3, 123, 276, NULL),
(221, 105, 3, 124, NULL, '2020-05-12'),
(222, 184, 1, 107, NULL, '10/11/1934'),
(223, 184, 1, 111, 285, NULL),
(224, 184, 1, 144, NULL, '85'),
(225, 184, 1, 166, 45, NULL),
(226, 184, 1, 167, NULL, '2020-05-21'),
(228, 185, 2, 150, 300, NULL),
(229, 185, 2, 168, NULL, '2020-05-21'),
(230, 186, 3, 123, 276, NULL),
(231, 186, 3, 124, NULL, '2020-06-13'),
(232, 25, 1, 107, NULL, '02/08/1974'),
(233, 25, 1, 111, 285, NULL),
(234, 25, 1, 144, NULL, '45'),
(235, 25, 1, 166, 45, NULL),
(236, 25, 1, 167, NULL, '2020-04-19'),
(238, 26, 2, 35, 298, NULL),
(239, 26, 2, 101, 306, NULL),
(240, 26, 2, 101, 305, NULL),
(241, 26, 2, 150, 300, NULL),
(242, 26, 2, 168, NULL, '2020-04-19'),
(243, 27, 3, 35, 298, NULL),
(244, 27, 3, 101, 305, NULL),
(245, 27, 3, 101, 306, NULL),
(246, 27, 3, 123, 276, NULL),
(247, 27, 3, 124, NULL, '2020-05-24'),
(248, 19, 1, 107, NULL, '18/01/1965'),
(249, 19, 1, 111, 285, NULL),
(250, 19, 1, 144, NULL, '55'),
(251, 19, 1, 166, 45, NULL),
(252, 19, 1, 167, NULL, '2020-04-15'),
(254, 20, 2, 35, 298, NULL),
(255, 20, 2, 101, 305, NULL),
(256, 20, 2, 101, 3, NULL),
(257, 20, 2, 101, 306, NULL),
(258, 20, 2, 150, 300, NULL),
(259, 20, 2, 168, NULL, '2020-04-15'),
(260, 21, 3, 35, 298, NULL),
(261, 21, 3, 101, 3, NULL),
(262, 21, 3, 101, 305, NULL),
(263, 21, 3, 101, 306, NULL),
(264, 21, 3, 123, 276, NULL),
(265, 21, 3, 124, NULL, '2020-04-20'),
(266, 196, 1, 107, NULL, '17/07/1962'),
(267, 196, 1, 111, 285, NULL),
(268, 196, 1, 144, NULL, '57'),
(269, 196, 1, 166, 45, NULL),
(270, 196, 1, 167, NULL, '2020-05-23'),
(272, 197, 2, 35, 298, NULL),
(273, 197, 2, 101, 305, NULL),
(274, 197, 2, 150, 300, NULL),
(275, 197, 2, 168, NULL, '2020-05-23'),
(276, 198, 3, 35, 298, NULL),
(277, 198, 3, 101, 305, NULL),
(278, 198, 3, 123, 276, NULL),
(279, 198, 3, 124, NULL, '2020-02-06'),
(280, 151, 1, 107, NULL, '25/12/1982'),
(281, 151, 1, 111, 284, NULL),
(282, 151, 1, 144, NULL, '37'),
(283, 151, 1, 166, 45, NULL),
(284, 151, 1, 167, NULL, '2020-05-14'),
(286, 152, 2, 35, 298, NULL),
(287, 152, 2, 101, 305, NULL),
(288, 152, 2, 150, 300, NULL),
(289, 152, 2, 168, NULL, '2020-05-14'),
(290, 153, 3, 35, 298, NULL),
(291, 153, 3, 101, 305, NULL),
(292, 153, 3, 123, 276, NULL),
(293, 153, 3, 124, NULL, '2020-05-16'),
(294, 214, 1, 107, NULL, '19/10/1961'),
(295, 214, 1, 111, 285, NULL),
(296, 214, 1, 144, NULL, '58'),
(297, 214, 1, 166, 45, NULL),
(298, 214, 1, 167, NULL, '2020-05-31'),
(300, 215, 2, 35, 298, NULL),
(301, 215, 2, 101, 305, NULL),
(302, 215, 2, 150, 300, NULL),
(303, 215, 2, 168, NULL, '2020-05-31'),
(304, 216, 3, 35, 298, NULL),
(305, 216, 3, 101, 305, NULL),
(306, 216, 3, 123, 276, NULL),
(307, 216, 3, 124, NULL, '2020-04-06'),
(308, 169, 1, 107, NULL, '18/06/1959'),
(309, 169, 1, 111, 285, NULL),
(310, 169, 1, 144, NULL, '61'),
(311, 169, 1, 166, 45, NULL),
(312, 169, 1, 167, NULL, '2020-05-18'),
(314, 170, 2, 35, 298, NULL),
(315, 170, 2, 101, 305, NULL),
(316, 170, 2, 150, 300, NULL),
(317, 170, 2, 168, NULL, '2020-05-18'),
(318, 171, 3, 35, 298, NULL),
(319, 171, 3, 101, 305, NULL),
(320, 171, 3, 123, 276, NULL),
(321, 171, 3, 124, NULL, '2020-05-26'),
(322, 118, 1, 107, NULL, '13/06/1936'),
(323, 118, 1, 111, 285, NULL),
(324, 118, 1, 144, NULL, '84'),
(325, 118, 1, 166, 45, NULL),
(326, 118, 1, 167, NULL, '2020-05-07'),
(328, 119, 2, 35, 298, NULL),
(329, 119, 2, 101, 306, NULL),
(330, 119, 2, 101, 305, NULL),
(331, 119, 2, 150, 300, NULL),
(332, 119, 2, 168, NULL, '2020-05-07'),
(333, 120, 3, 35, 298, NULL),
(334, 120, 3, 101, 305, NULL),
(335, 120, 3, 101, 306, NULL),
(336, 120, 3, 123, 276, NULL),
(337, 120, 3, 124, NULL, '2020-05-21'),
(338, 109, 1, 107, NULL, '10/08/1938'),
(339, 109, 1, 111, 284, NULL),
(340, 109, 1, 144, NULL, '81'),
(341, 109, 1, 166, 45, NULL),
(342, 109, 1, 167, NULL, '2020-05-06'),
(344, 110, 2, 35, 298, NULL),
(345, 110, 2, 101, 305, NULL),
(346, 110, 2, 101, 306, NULL),
(347, 110, 2, 150, 298, NULL),
(348, 110, 2, 168, NULL, '2020-05-06'),
(349, 110, 2, 228, NULL, '2020-05-06'),
(350, 111, 3, 35, 298, NULL),
(351, 111, 3, 101, 306, NULL),
(352, 111, 3, 101, 305, NULL),
(353, 111, 3, 123, 275, NULL),
(354, 111, 3, 124, NULL, '2020-05-13'),
(355, 142, 1, 107, NULL, '27/01/1957'),
(356, 142, 1, 111, 285, NULL),
(357, 142, 1, 144, NULL, '63'),
(358, 142, 1, 166, 45, NULL),
(359, 142, 1, 167, NULL, '2020-05-13'),
(361, 143, 2, 35, 298, NULL),
(362, 143, 2, 101, 305, NULL),
(363, 143, 2, 150, 300, NULL),
(364, 143, 2, 168, NULL, '2020-05-13'),
(365, 144, 3, 35, 298, NULL),
(366, 144, 3, 101, 305, NULL),
(367, 144, 3, 123, 276, NULL),
(368, 144, 3, 124, NULL, '2020-05-21'),
(369, 22, 1, 107, NULL, '21/12/1963'),
(370, 22, 1, 111, 285, NULL),
(371, 22, 1, 144, NULL, '56'),
(372, 22, 1, 166, 45, NULL),
(373, 22, 1, 167, NULL, '2020-04-17'),
(375, 23, 2, 35, 298, NULL),
(376, 23, 2, 101, 305, NULL),
(377, 23, 2, 101, 306, NULL),
(378, 23, 2, 150, 300, NULL),
(379, 23, 2, 168, NULL, '2020-04-17'),
(380, 24, 3, 35, 298, NULL),
(381, 24, 3, 101, 306, NULL),
(382, 24, 3, 101, 305, NULL),
(383, 24, 3, 123, 276, NULL),
(384, 24, 3, 124, NULL, '2020-04-29'),
(385, 217, 1, 107, NULL, '14/09/1938'),
(386, 217, 1, 111, 285, NULL),
(387, 217, 1, 144, NULL, '81'),
(388, 217, 1, 166, 45, NULL),
(389, 217, 1, 167, NULL, '2020-01-06'),
(391, 218, 2, 35, 298, NULL),
(392, 218, 2, 101, 305, NULL),
(393, 218, 2, 150, 300, NULL),
(394, 218, 2, 168, NULL, '2020-01-06'),
(395, 219, 3, 35, 298, NULL),
(396, 219, 3, 101, 305, NULL),
(397, 219, 3, 123, 276, NULL),
(398, 219, 3, 124, NULL, '2020-06-09'),
(399, 154, 1, 107, NULL, '13/01/1998'),
(400, 154, 1, 111, 285, NULL),
(401, 154, 1, 144, NULL, '22'),
(402, 154, 1, 166, 45, NULL),
(403, 154, 1, 167, NULL, '2020-05-14'),
(405, 155, 2, 35, 298, NULL),
(406, 155, 2, 101, 305, NULL),
(407, 155, 2, 150, 300, NULL),
(408, 155, 2, 168, NULL, '2020-05-14'),
(409, 156, 3, 35, 298, NULL),
(410, 156, 3, 101, 305, NULL),
(411, 156, 3, 123, 276, NULL),
(412, 156, 3, 124, NULL, '2020-05-22'),
(413, 1, 1, 167, NULL, '2020-01-24'),
(414, 2, 2, 35, 298, NULL),
(415, 2, 2, 101, 306, NULL),
(416, 2, 2, 168, NULL, '2020-01-24'),
(417, 3, 3, 35, 298, NULL),
(418, 3, 3, 101, 306, NULL),
(419, 3, 3, 123, 275, NULL),
(420, 3, 3, 124, NULL, '2020-05-12'),
(421, 112, 1, 107, NULL, '28/07/1994'),
(422, 112, 1, 111, 284, NULL),
(423, 112, 1, 144, NULL, '25'),
(424, 112, 1, 166, 45, NULL),
(425, 112, 1, 167, NULL, '2020-05-06'),
(427, 113, 2, 35, 298, NULL),
(428, 113, 2, 101, 305, NULL),
(429, 113, 2, 150, 300, NULL),
(430, 113, 2, 168, NULL, '2020-05-06'),
(431, 114, 3, 35, 298, NULL),
(432, 114, 3, 101, 305, NULL),
(433, 114, 3, 123, 276, NULL),
(434, 114, 3, 124, NULL, '2020-05-08'),
(435, 115, 1, 107, NULL, '16/09/1985'),
(436, 115, 1, 111, 285, NULL),
(437, 115, 1, 144, NULL, '34'),
(438, 115, 1, 166, 45, NULL),
(439, 115, 1, 167, NULL, '2020-05-07'),
(441, 116, 2, 35, 298, NULL),
(442, 116, 2, 101, 306, NULL),
(443, 116, 2, 150, 300, NULL),
(444, 116, 2, 168, NULL, '2020-05-07'),
(445, 117, 3, 35, 298, NULL),
(446, 117, 3, 101, 306, NULL),
(447, 117, 3, 123, 276, NULL),
(448, 117, 3, 124, NULL, '2020-05-11'),
(449, 79, 1, 107, NULL, '25/03/1952'),
(450, 79, 1, 111, 285, NULL),
(451, 79, 1, 144, NULL, '68'),
(452, 79, 1, 166, 45, NULL),
(453, 79, 1, 167, NULL, '2020-04-28'),
(455, 80, 2, 35, 298, NULL),
(456, 80, 2, 101, 306, NULL),
(457, 80, 2, 101, 305, NULL),
(458, 80, 2, 150, 300, NULL),
(459, 80, 2, 168, NULL, '2020-04-28'),
(460, 81, 3, 35, 298, NULL),
(461, 81, 3, 101, 306, NULL),
(462, 81, 3, 101, 305, NULL),
(463, 81, 3, 123, 276, NULL),
(464, 81, 3, 124, NULL, '2020-05-16'),
(465, 7, 1, 107, NULL, '18/11/1952'),
(466, 7, 1, 111, 284, NULL),
(467, 7, 1, 144, NULL, '67'),
(468, 7, 1, 166, 45, NULL),
(469, 7, 1, 167, NULL, '2020-04-10'),
(471, 8, 2, 35, 298, NULL),
(472, 8, 2, 101, 306, NULL),
(473, 8, 2, 101, 305, NULL),
(474, 8, 2, 150, 298, NULL),
(475, 8, 2, 168, NULL, '2020-04-10'),
(476, 8, 2, 228, NULL, '2020-04-10'),
(477, 9, 3, 35, 298, NULL),
(478, 9, 3, 101, 306, NULL),
(479, 9, 3, 101, 305, NULL),
(480, 9, 3, 123, 275, NULL),
(481, 9, 3, 124, NULL, '2020-05-07'),
(482, 223, 1, 107, NULL, '23/11/1989'),
(483, 223, 1, 111, 285, NULL),
(484, 223, 1, 144, NULL, '30'),
(485, 223, 1, 166, 45, NULL),
(486, 223, 1, 167, NULL, '2020-03-06'),
(488, 224, 2, 35, 298, NULL),
(489, 224, 2, 101, 305, NULL),
(490, 224, 2, 101, 3, NULL),
(491, 224, 2, 150, 298, NULL),
(492, 224, 2, 168, NULL, '2020-03-06'),
(493, 224, 2, 228, NULL, '2020-03-06'),
(494, 225, 3, 35, 298, NULL),
(495, 225, 3, 101, 3, NULL),
(496, 225, 3, 101, 305, NULL),
(497, 225, 3, 123, 275, NULL),
(498, 225, 3, 124, NULL, '2020-06-13'),
(499, 13, 1, 107, NULL, '18/11/1978'),
(500, 13, 1, 111, 285, NULL),
(501, 13, 1, 144, NULL, '41'),
(502, 13, 1, 166, 45, NULL),
(503, 13, 1, 167, NULL, '2020-04-14'),
(505, 14, 2, 35, 298, NULL),
(506, 14, 2, 101, 306, NULL),
(507, 14, 2, 101, 305, NULL),
(508, 14, 2, 150, 300, NULL),
(509, 14, 2, 168, NULL, '2020-04-14'),
(510, 15, 3, 35, 298, NULL),
(511, 15, 3, 101, 305, NULL),
(512, 15, 3, 101, 306, NULL),
(513, 15, 3, 123, 276, NULL),
(514, 15, 3, 124, NULL, '2020-04-20'),
(515, 16, 1, 107, NULL, '17/02/1976'),
(516, 16, 1, 111, 285, NULL),
(517, 16, 1, 144, NULL, '44'),
(518, 16, 1, 166, 45, NULL),
(519, 16, 1, 167, NULL, '2020-04-15'),
(521, 17, 2, 150, 300, NULL),
(522, 17, 2, 168, NULL, '2020-04-15'),
(523, 18, 3, 123, 276, NULL),
(524, 18, 3, 124, NULL, '2020-04-18'),
(525, 28, 1, 107, NULL, '14/02/1952'),
(526, 28, 1, 111, 285, NULL),
(527, 28, 1, 144, NULL, '68'),
(528, 28, 1, 166, 45, NULL),
(529, 28, 1, 167, NULL, '2020-04-19'),
(531, 29, 2, 150, 300, NULL),
(532, 29, 2, 168, NULL, '2020-04-19'),
(533, 30, 3, 123, 276, NULL),
(534, 30, 3, 124, NULL, '2020-04-20'),
(535, 31, 1, 107, NULL, '30/10/1944'),
(536, 31, 1, 111, 284, NULL),
(537, 31, 1, 144, NULL, '75'),
(538, 31, 1, 166, 45, NULL),
(539, 31, 1, 167, NULL, '2020-04-20'),
(541, 32, 2, 35, 298, NULL),
(542, 32, 2, 101, 306, NULL),
(543, 32, 2, 101, 305, NULL),
(544, 32, 2, 150, 298, NULL),
(545, 32, 2, 168, NULL, '2020-04-20'),
(546, 32, 2, 228, NULL, '2020-04-20'),
(547, 33, 3, 35, 298, NULL),
(548, 33, 3, 101, 305, NULL),
(549, 33, 3, 101, 306, NULL),
(550, 33, 3, 123, 275, NULL),
(551, 33, 3, 124, NULL, '2020-04-30'),
(552, 34, 1, 107, NULL, '04/07/1975'),
(553, 34, 1, 111, 284, NULL),
(554, 34, 1, 144, NULL, '44'),
(555, 34, 1, 166, 45, NULL),
(556, 34, 1, 167, NULL, '2020-04-20'),
(558, 35, 2, 35, 298, NULL),
(559, 35, 2, 101, 305, NULL),
(560, 35, 2, 101, 306, NULL),
(561, 35, 2, 150, 300, NULL),
(562, 35, 2, 168, NULL, '2020-04-20'),
(563, 36, 3, 35, 298, NULL),
(564, 36, 3, 101, 306, NULL),
(565, 36, 3, 101, 305, NULL),
(566, 36, 3, 123, 276, NULL),
(567, 36, 3, 124, NULL, '2020-04-28'),
(568, 37, 1, 107, NULL, '09/12/1947'),
(569, 37, 1, 111, 284, NULL),
(570, 37, 1, 144, NULL, '72'),
(571, 37, 1, 166, 45, NULL),
(572, 37, 1, 167, NULL, '2020-04-21'),
(574, 38, 2, 35, 298, NULL),
(575, 38, 2, 101, 305, NULL),
(576, 38, 2, 101, 306, NULL),
(577, 38, 2, 150, 298, NULL),
(578, 38, 2, 168, NULL, '2020-04-21'),
(579, 38, 2, 228, NULL, '2020-04-21'),
(580, 39, 3, 35, 298, NULL),
(581, 39, 3, 101, 305, NULL),
(582, 39, 3, 101, 306, NULL),
(583, 39, 3, 123, 275, NULL),
(584, 39, 3, 124, NULL, '2020-05-08'),
(585, 43, 1, 107, NULL, '28/08/1936'),
(586, 43, 1, 111, 285, NULL),
(587, 43, 1, 144, NULL, '83'),
(588, 43, 1, 166, 45, NULL),
(589, 43, 1, 167, NULL, '2020-04-22'),
(591, 44, 2, 35, 298, NULL),
(592, 44, 2, 101, 306, NULL),
(593, 44, 2, 150, 300, NULL),
(594, 44, 2, 168, NULL, '2020-04-22'),
(595, 45, 3, 35, 298, NULL),
(596, 45, 3, 101, 306, NULL),
(597, 45, 3, 123, 276, NULL),
(598, 45, 3, 124, NULL, '2020-04-28'),
(599, 46, 1, 107, NULL, '03/09/1973'),
(600, 46, 1, 111, 284, NULL),
(601, 46, 1, 144, NULL, '46'),
(602, 46, 1, 166, 45, NULL),
(603, 46, 1, 167, NULL, '2020-04-23'),
(605, 47, 2, 35, 298, NULL),
(606, 47, 2, 101, 306, NULL),
(607, 47, 2, 101, 305, NULL),
(608, 47, 2, 150, 300, NULL),
(609, 47, 2, 168, NULL, '2020-04-23'),
(610, 48, 3, 35, 298, NULL),
(611, 48, 3, 101, 306, NULL),
(612, 48, 3, 101, 305, NULL),
(613, 48, 3, 123, 276, NULL),
(614, 48, 3, 124, NULL, '2020-04-27'),
(615, 49, 1, 107, NULL, '03/01/1973'),
(616, 49, 1, 111, 285, NULL),
(617, 49, 1, 144, NULL, '47'),
(618, 49, 1, 166, 45, NULL),
(619, 49, 1, 167, NULL, '2020-04-23'),
(621, 50, 2, 35, 298, NULL),
(622, 50, 2, 101, 306, NULL),
(623, 50, 2, 150, 300, NULL),
(624, 50, 2, 168, NULL, '2020-04-23'),
(625, 51, 3, 35, 298, NULL),
(626, 51, 3, 101, 306, NULL),
(627, 51, 3, 123, 276, NULL),
(628, 51, 3, 124, NULL, '2020-04-27'),
(629, 52, 1, 107, NULL, '27/01/1974'),
(630, 52, 1, 111, 285, NULL),
(631, 52, 1, 144, NULL, '46'),
(632, 52, 1, 166, 45, NULL),
(633, 52, 1, 167, NULL, '2020-04-23'),
(635, 53, 2, 35, 298, NULL),
(636, 53, 2, 101, 305, NULL),
(637, 53, 2, 101, 306, NULL),
(638, 53, 2, 150, 300, NULL),
(639, 53, 2, 168, NULL, '2020-04-23'),
(640, 54, 3, 35, 298, NULL),
(641, 54, 3, 101, 305, NULL),
(642, 54, 3, 101, 306, NULL),
(643, 54, 3, 123, 276, NULL),
(644, 54, 3, 124, NULL, '2020-05-08'),
(645, 58, 1, 107, NULL, '01/04/1964'),
(646, 58, 1, 111, 285, NULL),
(647, 58, 1, 144, NULL, '56'),
(648, 58, 1, 166, 45, NULL),
(649, 58, 1, 167, NULL, '2020-04-24'),
(651, 59, 2, 35, 298, NULL),
(652, 59, 2, 101, 305, NULL),
(653, 59, 2, 101, 306, NULL),
(654, 59, 2, 150, 300, NULL),
(655, 59, 2, 168, NULL, '2020-04-24'),
(656, 60, 3, 35, 298, NULL),
(657, 60, 3, 101, 305, NULL),
(658, 60, 3, 101, 306, NULL),
(659, 60, 3, 123, 276, NULL),
(660, 60, 3, 124, NULL, '2020-05-05'),
(661, 61, 1, 107, NULL, '05/06/1984'),
(662, 61, 1, 111, 284, NULL),
(663, 61, 1, 144, NULL, '36'),
(664, 61, 1, 166, 45, NULL),
(665, 61, 1, 167, NULL, '2020-04-26'),
(667, 62, 2, 35, 298, NULL),
(668, 62, 2, 101, 305, NULL),
(669, 62, 2, 150, 300, NULL),
(670, 62, 2, 168, NULL, '2020-04-26'),
(671, 63, 3, 35, 298, NULL),
(672, 63, 3, 101, 305, NULL),
(673, 63, 3, 123, 276, NULL),
(674, 63, 3, 124, NULL, '2020-01-05'),
(675, 70, 1, 107, NULL, '08/02/1979'),
(676, 70, 1, 111, 285, NULL),
(677, 70, 1, 144, NULL, '41'),
(678, 70, 1, 166, 45, NULL),
(679, 70, 1, 167, NULL, '2020-04-27'),
(681, 71, 2, 35, 298, NULL),
(682, 71, 2, 101, 306, NULL),
(683, 71, 2, 101, 305, NULL),
(684, 71, 2, 150, 300, NULL),
(685, 71, 2, 168, NULL, '2020-04-27'),
(686, 72, 3, 35, 298, NULL),
(687, 72, 3, 101, 305, NULL),
(688, 72, 3, 101, 306, NULL),
(689, 72, 3, 123, 276, NULL),
(690, 72, 3, 124, NULL, '2020-05-10'),
(691, 73, 1, 107, NULL, '03/03/1988'),
(692, 73, 1, 111, 285, NULL),
(693, 73, 1, 144, NULL, '32'),
(694, 73, 1, 166, 45, NULL),
(695, 73, 1, 167, NULL, '2020-04-28'),
(697, 74, 2, 35, 298, NULL),
(698, 74, 2, 101, 305, NULL),
(699, 74, 2, 101, 306, NULL),
(700, 74, 2, 150, 300, NULL),
(701, 74, 2, 168, NULL, '2020-04-28'),
(702, 75, 3, 35, 298, NULL),
(703, 75, 3, 101, 305, NULL),
(704, 75, 3, 101, 306, NULL),
(705, 75, 3, 123, 276, NULL),
(706, 75, 3, 124, NULL, '2020-03-05'),
(707, 76, 1, 107, NULL, '22/04/1960'),
(708, 76, 1, 111, 285, NULL),
(709, 76, 1, 144, NULL, '60'),
(710, 76, 1, 166, 45, NULL),
(711, 76, 1, 167, NULL, '2020-04-28'),
(713, 77, 2, 35, 298, NULL),
(714, 77, 2, 101, 306, NULL),
(715, 77, 2, 101, 305, NULL),
(716, 77, 2, 150, 298, NULL),
(717, 77, 2, 168, NULL, '2020-04-28'),
(718, 77, 2, 228, NULL, '2020-04-28'),
(719, 78, 3, 35, 298, NULL),
(720, 78, 3, 101, 305, NULL),
(721, 78, 3, 101, 306, NULL),
(722, 78, 3, 123, 275, NULL),
(723, 78, 3, 124, NULL, '2020-05-20'),
(724, 85, 1, 107, NULL, '10/12/1955'),
(725, 85, 1, 111, 285, NULL),
(726, 85, 1, 144, NULL, '64'),
(727, 85, 1, 166, 45, NULL),
(728, 85, 1, 167, NULL, '2020-01-05'),
(730, 86, 2, 35, 298, NULL),
(731, 86, 2, 101, 306, NULL),
(732, 86, 2, 150, 298, NULL),
(733, 86, 2, 168, NULL, '2020-01-05'),
(734, 86, 2, 228, NULL, '2020-01-05'),
(735, 87, 3, 35, 298, NULL),
(736, 87, 3, 101, 306, NULL),
(737, 87, 3, 123, 275, NULL),
(738, 87, 3, 124, NULL, '2020-03-05'),
(739, 88, 1, 107, NULL, '04/07/1951'),
(740, 88, 1, 111, 285, NULL),
(741, 88, 1, 144, NULL, '68'),
(742, 88, 1, 166, 45, NULL),
(743, 88, 1, 167, NULL, '2020-02-05'),
(745, 89, 2, 35, 298, NULL),
(746, 89, 2, 101, 306, NULL),
(747, 89, 2, 101, 305, NULL),
(748, 89, 2, 150, 298, NULL),
(749, 89, 2, 168, NULL, '2020-02-05'),
(750, 89, 2, 228, NULL, '2020-02-05'),
(751, 90, 3, 35, 298, NULL),
(752, 90, 3, 101, 306, NULL),
(753, 90, 3, 101, 305, NULL),
(754, 90, 3, 123, 275, NULL),
(755, 90, 3, 124, NULL, '2020-05-11'),
(756, 91, 1, 107, NULL, '12/09/1985'),
(757, 91, 1, 111, 285, NULL),
(758, 91, 1, 144, NULL, '34'),
(759, 91, 1, 166, 45, NULL),
(760, 91, 1, 167, NULL, '2020-02-05'),
(762, 92, 2, 35, 298, NULL),
(763, 92, 2, 101, 306, NULL),
(764, 92, 2, 150, 300, NULL),
(765, 92, 2, 168, NULL, '2020-02-05'),
(766, 93, 3, 35, 298, NULL),
(767, 93, 3, 101, 306, NULL),
(768, 93, 3, 123, 276, NULL),
(769, 93, 3, 124, NULL, '2020-04-05'),
(770, 100, 1, 107, NULL, '21/11/1961'),
(771, 100, 1, 111, 284, NULL),
(772, 100, 1, 144, NULL, '58'),
(773, 100, 1, 166, 45, NULL),
(774, 100, 1, 167, NULL, '2020-05-05'),
(776, 101, 2, 35, 298, NULL),
(777, 101, 2, 101, 306, NULL),
(778, 101, 2, 101, 305, NULL),
(779, 101, 2, 150, 298, NULL),
(780, 101, 2, 168, NULL, '2020-05-05'),
(781, 101, 2, 228, NULL, '2020-05-05'),
(782, 102, 3, 35, 298, NULL),
(783, 102, 3, 101, 306, NULL),
(784, 102, 3, 101, 305, NULL),
(785, 102, 3, 123, 275, NULL),
(786, 102, 3, 124, NULL, '2020-05-20'),
(787, 106, 1, 107, NULL, '18/09/1971'),
(788, 106, 1, 111, 284, NULL),
(789, 106, 1, 144, NULL, '48'),
(790, 106, 1, 166, 45, NULL),
(791, 106, 1, 167, NULL, '2020-05-06'),
(793, 107, 2, 150, 300, NULL),
(794, 107, 2, 168, NULL, '2020-05-06'),
(795, 108, 3, 123, 276, NULL),
(796, 108, 3, 124, NULL, '2020-05-12'),
(797, 124, 1, 107, NULL, '19/09/1995'),
(798, 124, 1, 111, 284, NULL),
(799, 124, 1, 144, NULL, '24'),
(800, 124, 1, 166, 45, NULL),
(801, 124, 1, 167, NULL, '2020-05-08'),
(803, 125, 2, 35, 298, NULL),
(804, 125, 2, 101, 305, NULL),
(805, 125, 2, 150, 300, NULL),
(806, 125, 2, 168, NULL, '2020-05-08'),
(807, 126, 3, 35, 298, NULL),
(808, 126, 3, 101, 305, NULL),
(809, 126, 3, 123, 276, NULL),
(810, 126, 3, 124, NULL, '2020-05-13'),
(811, 121, 1, 107, NULL, '14/09/1943'),
(812, 121, 1, 111, 285, NULL),
(813, 121, 1, 144, NULL, '76'),
(814, 121, 1, 166, 45, NULL),
(815, 121, 1, 167, NULL, '2020-05-08'),
(817, 122, 2, 35, 298, NULL),
(818, 122, 2, 101, 305, NULL),
(819, 122, 2, 150, 300, NULL),
(820, 122, 2, 168, NULL, '2020-05-08'),
(821, 123, 3, 35, 298, NULL),
(822, 123, 3, 101, 305, NULL),
(823, 123, 3, 123, 275, NULL),
(824, 123, 3, 124, NULL, '2020-05-17'),
(825, 127, 1, 107, NULL, '05/07/1974'),
(826, 127, 1, 111, 285, NULL),
(827, 127, 1, 144, NULL, '45'),
(828, 127, 1, 166, 45, NULL),
(829, 127, 1, 167, NULL, '2020-05-11'),
(831, 128, 2, 35, 298, NULL),
(832, 128, 2, 101, 305, NULL),
(833, 128, 2, 101, 306, NULL),
(834, 128, 2, 150, 300, NULL),
(835, 128, 2, 168, NULL, '2020-05-11'),
(836, 129, 3, 35, 298, NULL),
(837, 129, 3, 101, 306, NULL),
(838, 129, 3, 101, 305, NULL),
(839, 129, 3, 123, 276, NULL),
(840, 129, 3, 124, NULL, '2020-05-19'),
(841, 130, 1, 107, NULL, '10/02/1972'),
(842, 130, 1, 111, 284, NULL),
(843, 130, 1, 144, NULL, '48'),
(844, 130, 1, 166, 45, NULL),
(845, 130, 1, 167, NULL, '2020-05-12'),
(847, 131, 2, 35, 298, NULL),
(848, 131, 2, 101, 305, NULL),
(849, 131, 2, 150, 300, NULL),
(850, 131, 2, 168, NULL, '2020-05-12'),
(851, 132, 3, 35, 298, NULL),
(852, 132, 3, 101, 305, NULL),
(853, 132, 3, 123, 276, NULL),
(854, 132, 3, 124, NULL, '2020-05-19'),
(855, 133, 1, 107, NULL, '30/09/1966'),
(856, 133, 1, 111, 285, NULL),
(857, 133, 1, 144, NULL, '53'),
(858, 133, 1, 166, 45, NULL),
(859, 133, 1, 167, NULL, '2020-05-12'),
(861, 134, 2, 35, 298, NULL),
(862, 134, 2, 101, 305, NULL),
(863, 134, 2, 150, 298, NULL),
(864, 134, 2, 168, NULL, '2020-05-12'),
(865, 134, 2, 228, NULL, '2020-05-12'),
(866, 135, 3, 35, 298, NULL),
(867, 135, 3, 101, 305, NULL),
(868, 135, 3, 123, 275, NULL),
(869, 135, 3, 124, NULL, '2020-05-13'),
(870, 136, 1, 107, NULL, '21/08/1951'),
(871, 136, 1, 111, 284, NULL),
(872, 136, 1, 144, NULL, '68'),
(873, 136, 1, 166, 45, NULL),
(874, 136, 1, 167, NULL, '2020-05-12'),
(876, 137, 2, 35, 298, NULL),
(877, 137, 2, 101, 305, NULL),
(878, 137, 2, 150, 298, NULL),
(879, 137, 2, 168, NULL, '2020-05-12'),
(880, 137, 2, 228, NULL, '2020-05-12'),
(881, 138, 3, 35, 298, NULL),
(882, 138, 3, 101, 305, NULL),
(883, 138, 3, 123, 275, NULL),
(884, 138, 3, 124, NULL, '2020-06-12'),
(885, 139, 1, 107, NULL, '06/09/1951'),
(886, 139, 1, 111, 285, NULL),
(887, 139, 1, 144, NULL, '68'),
(888, 139, 1, 166, 45, NULL),
(889, 139, 1, 167, NULL, '2020-05-13'),
(891, 140, 2, 35, 298, NULL),
(892, 140, 2, 101, 305, NULL),
(893, 140, 2, 150, 300, NULL),
(894, 140, 2, 168, NULL, '2020-05-13'),
(895, 141, 3, 35, 298, NULL),
(896, 141, 3, 101, 305, NULL),
(897, 141, 3, 123, 276, NULL),
(898, 141, 3, 124, NULL, '2020-06-10'),
(899, 160, 1, 107, NULL, '16/03/1969'),
(900, 160, 1, 111, 285, NULL),
(901, 160, 1, 144, NULL, '51'),
(902, 160, 1, 166, 45, NULL),
(903, 160, 1, 167, NULL, '2020-05-14'),
(905, 161, 2, 150, 298, NULL),
(906, 161, 2, 168, NULL, '2020-05-14'),
(907, 161, 2, 228, NULL, '2020-05-14'),
(908, 162, 3, 123, 275, NULL),
(909, 162, 3, 124, NULL, '2020-05-21'),
(910, 157, 1, 107, NULL, '27/02/1968'),
(911, 157, 1, 111, 284, NULL),
(912, 157, 1, 144, NULL, '52'),
(913, 157, 1, 166, 45, NULL),
(914, 157, 1, 167, NULL, '2020-05-14'),
(916, 158, 2, 35, 298, NULL),
(917, 158, 2, 101, 305, NULL),
(918, 158, 2, 150, 300, NULL),
(919, 158, 2, 168, NULL, '2020-05-14'),
(920, 159, 3, 35, 298, NULL),
(921, 159, 3, 101, 305, NULL),
(922, 159, 3, 123, 276, NULL),
(923, 159, 3, 124, NULL, '2020-01-06'),
(924, 166, 1, 107, NULL, '23/08/1978'),
(925, 166, 1, 111, 285, NULL),
(926, 166, 1, 144, NULL, '41'),
(927, 166, 1, 166, 45, NULL),
(928, 166, 1, 167, NULL, '2020-05-15'),
(930, 167, 2, 150, 300, NULL),
(931, 167, 2, 168, NULL, '2020-05-15'),
(932, 168, 3, 123, 276, NULL),
(933, 168, 3, 124, NULL, '2020-05-20'),
(934, 163, 1, 107, NULL, '25/12/1964'),
(935, 163, 1, 111, 285, NULL),
(936, 163, 1, 144, NULL, '55'),
(937, 163, 1, 166, 45, NULL),
(938, 163, 1, 167, NULL, '2020-05-15'),
(940, 164, 2, 150, 300, NULL),
(941, 164, 2, 168, NULL, '2020-05-15'),
(942, 165, 3, 123, 276, NULL),
(943, 165, 3, 124, NULL, '2020-05-20'),
(944, 172, 1, 107, NULL, '17/03/1935'),
(945, 172, 1, 111, 284, NULL),
(946, 172, 1, 144, NULL, '85'),
(947, 172, 1, 166, 45, NULL),
(948, 172, 1, 167, NULL, '2020-05-18'),
(950, 173, 2, 35, 298, NULL),
(951, 173, 2, 101, 305, NULL),
(952, 173, 2, 150, 300, NULL),
(953, 173, 2, 168, NULL, '2020-05-18'),
(954, 174, 3, 35, 298, NULL),
(955, 174, 3, 101, 305, NULL),
(956, 174, 3, 123, 276, NULL),
(957, 174, 3, 124, NULL, '2020-05-27'),
(958, 175, 1, 107, NULL, '17/09/1984'),
(959, 175, 1, 111, 285, NULL),
(960, 175, 1, 144, NULL, '35'),
(961, 175, 1, 166, 45, NULL),
(962, 175, 1, 167, NULL, '2020-05-20'),
(964, 176, 2, 150, 300, NULL),
(965, 176, 2, 168, NULL, '2020-05-20'),
(966, 177, 3, 123, 276, NULL),
(967, 177, 3, 124, NULL, '2020-05-21'),
(968, 187, 1, 107, NULL, '17/09/1953'),
(969, 187, 1, 111, 284, NULL),
(970, 187, 1, 144, NULL, '66'),
(971, 187, 1, 166, 45, NULL),
(972, 187, 1, 167, NULL, '2020-05-21'),
(974, 188, 2, 150, 298, NULL),
(975, 188, 2, 168, NULL, '2020-05-21'),
(976, 188, 2, 228, NULL, '2020-05-21'),
(977, 189, 3, 123, 275, NULL),
(978, 189, 3, 124, NULL, '2020-04-06'),
(979, 178, 1, 107, NULL, '16/08/1952'),
(980, 178, 1, 111, 285, NULL),
(981, 178, 1, 144, NULL, '67'),
(982, 178, 1, 166, 45, NULL),
(983, 178, 1, 167, NULL, '2020-05-20'),
(985, 179, 2, 35, 298, NULL),
(986, 179, 2, 101, 305, NULL),
(987, 179, 2, 150, 300, NULL),
(988, 179, 2, 168, NULL, '2020-05-20'),
(989, 180, 3, 35, 298, NULL),
(990, 180, 3, 101, 305, NULL),
(991, 180, 3, 123, 276, NULL),
(992, 180, 3, 124, NULL, '2020-05-26'),
(993, 181, 1, 107, NULL, '18/08/1986'),
(994, 181, 1, 111, 285, NULL),
(995, 181, 1, 144, NULL, '33'),
(996, 181, 1, 166, 45, NULL),
(997, 181, 1, 167, NULL, '2020-05-20'),
(999, 182, 2, 35, 298, NULL),
(1000, 182, 2, 101, 305, NULL),
(1001, 182, 2, 101, 306, NULL),
(1002, 182, 2, 150, 300, NULL),
(1003, 182, 2, 168, NULL, '2020-05-20'),
(1004, 183, 3, 35, 298, NULL),
(1005, 183, 3, 101, 306, NULL),
(1006, 183, 3, 101, 305, NULL),
(1007, 183, 3, 123, 276, NULL),
(1008, 183, 3, 124, NULL, '2020-05-25'),
(1009, 190, 1, 107, NULL, '04/08/1960'),
(1010, 190, 1, 111, 285, NULL),
(1011, 190, 1, 144, NULL, '59'),
(1012, 190, 1, 166, 45, NULL),
(1013, 190, 1, 167, NULL, '2020-05-21'),
(1015, 191, 2, 35, 298, NULL),
(1016, 191, 2, 101, 305, NULL),
(1017, 191, 2, 150, 300, NULL),
(1018, 191, 2, 168, NULL, '2020-05-21'),
(1019, 192, 3, 35, 298, NULL),
(1020, 192, 3, 101, 305, NULL),
(1021, 192, 3, 123, 276, NULL),
(1022, 192, 3, 124, NULL, '2020-05-25'),
(1023, 199, 1, 107, NULL, '13/05/1954'),
(1024, 199, 1, 111, 284, NULL),
(1025, 199, 1, 144, NULL, '66'),
(1026, 199, 1, 166, 45, NULL),
(1027, 199, 1, 167, NULL, '2020-05-24'),
(1029, 200, 2, 35, 298, NULL),
(1030, 200, 2, 101, 305, NULL),
(1031, 200, 2, 150, 300, NULL),
(1032, 200, 2, 168, NULL, '2020-05-24'),
(1033, 201, 3, 35, 298, NULL),
(1034, 201, 3, 101, 305, NULL),
(1035, 201, 3, 123, 276, NULL),
(1036, 201, 3, 124, NULL, '2020-06-20'),
(1037, 205, 1, 107, NULL, '10/04/1961'),
(1038, 205, 1, 111, 285, NULL),
(1039, 205, 1, 144, NULL, '59'),
(1040, 205, 1, 166, 45, NULL),
(1041, 205, 1, 167, NULL, '2020-05-25'),
(1043, 206, 2, 35, 298, NULL),
(1044, 206, 2, 101, 305, NULL),
(1045, 206, 2, 150, 298, NULL),
(1046, 206, 2, 168, NULL, '2020-05-25'),
(1047, 206, 2, 228, NULL, '2020-05-25'),
(1048, 207, 3, 35, 298, NULL),
(1049, 207, 3, 101, 305, NULL),
(1050, 207, 3, 123, 275, NULL),
(1051, 207, 3, 124, NULL, '2020-02-06'),
(1052, 208, 1, 107, NULL, '10/10/1983'),
(1053, 208, 1, 111, 285, NULL),
(1054, 208, 1, 144, NULL, '36'),
(1055, 208, 1, 166, 45, NULL),
(1056, 208, 1, 167, NULL, '2020-05-26'),
(1058, 209, 2, 35, 298, NULL),
(1059, 209, 2, 101, 305, NULL),
(1060, 209, 2, 150, 300, NULL),
(1061, 209, 2, 168, NULL, '2020-05-26'),
(1062, 210, 3, 35, 298, NULL),
(1063, 210, 3, 101, 305, NULL),
(1064, 210, 3, 123, 276, NULL),
(1065, 210, 3, 124, NULL, '2020-05-06'),
(1066, 211, 1, 107, NULL, '06/01/1965'),
(1067, 211, 1, 111, 284, NULL),
(1068, 211, 1, 144, NULL, '55'),
(1069, 211, 1, 166, 45, NULL),
(1070, 211, 1, 167, NULL, '2020-05-29'),
(1072, 212, 2, 150, 300, NULL),
(1073, 212, 2, 168, NULL, '2020-05-29'),
(1074, 213, 3, 123, 276, NULL),
(1075, 213, 3, 124, NULL, '2020-04-06'),
(1076, 226, 1, 107, NULL, '14/04/1950'),
(1077, 226, 1, 111, 284, NULL),
(1078, 226, 1, 144, NULL, '70'),
(1079, 226, 1, 166, 45, NULL),
(1080, 226, 1, 167, NULL, '2020-06-12'),
(1082, 227, 2, 35, 298, NULL),
(1083, 227, 2, 101, 305, NULL),
(1084, 227, 2, 150, 300, NULL),
(1085, 227, 2, 168, NULL, '2020-06-12'),
(1086, 228, 3, 35, 298, NULL),
(1087, 228, 3, 101, 305, NULL),
(1088, 228, 3, 123, 276, NULL),
(1089, 228, 3, 124, NULL, '2020-06-16'),
(1090, 229, 1, 107, NULL, '22/10/1972'),
(1091, 229, 1, 111, 284, NULL),
(1092, 229, 1, 144, NULL, '47'),
(1093, 229, 1, 166, 45, NULL),
(1094, 229, 1, 167, NULL, '2020-06-12'),
(1096, 230, 2, 35, 298, NULL),
(1097, 230, 2, 101, 305, NULL),
(1098, 230, 2, 150, 300, NULL),
(1099, 230, 2, 168, NULL, '2020-06-12'),
(1100, 231, 3, 35, 298, NULL),
(1101, 231, 3, 101, 305, NULL),
(1102, 231, 3, 123, 276, NULL),
(1103, 231, 3, 124, NULL, '2020-06-17'),
(1104, 232, 1, 107, NULL, '10/09/1969'),
(1105, 232, 1, 111, 285, NULL),
(1106, 232, 1, 144, NULL, '50'),
(1107, 232, 1, 166, 45, NULL),
(1108, 232, 1, 167, NULL, '2020-06-15'),
(1110, 233, 2, 150, 298, NULL),
(1111, 233, 2, 168, NULL, '2020-06-15'),
(1112, 233, 2, 228, NULL, '2020-06-15'),
(1113, 234, 3, 123, 275, NULL),
(1114, 234, 3, 124, NULL, '2020-06-26'),
(1115, 235, 1, 107, NULL, '03/03/1936'),
(1116, 235, 1, 111, 284, NULL),
(1117, 235, 1, 144, NULL, '84'),
(1118, 235, 1, 166, 45, NULL),
(1119, 235, 1, 167, NULL, '2020-06-16'),
(1121, 236, 2, 35, 298, NULL),
(1122, 236, 2, 101, 305, NULL),
(1123, 236, 2, 150, 300, NULL),
(1124, 236, 2, 168, NULL, '2020-06-16'),
(1125, 237, 3, 35, 298, NULL),
(1126, 237, 3, 101, 305, NULL),
(1127, 237, 3, 123, 276, NULL),
(1128, 237, 3, 124, NULL, '2020-06-23'),
(6, 82, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(22, 220, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(37, 145, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(51, 193, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(65, 148, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(81, 10, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(98, 64, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(114, 55, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(130, 97, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(146, 94, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(171, 40, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(187, 202, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(201, 67, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(217, 103, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(227, 184, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(237, 25, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(253, 19, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(271, 196, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(285, 151, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(299, 214, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(313, 169, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(327, 118, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(343, 109, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(360, 142, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(374, 22, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(390, 217, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(404, 154, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(426, 112, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(440, 115, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(454, 79, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(470, 7, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(487, 223, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(504, 13, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(520, 16, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(530, 28, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(540, 31, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(557, 34, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(573, 37, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(590, 43, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(604, 46, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(620, 49, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(634, 52, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(650, 58, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(666, 61, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(680, 70, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(696, 73, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(712, 76, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(729, 85, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(744, 88, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(761, 91, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(775, 100, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(792, 106, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(802, 124, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(816, 121, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(830, 127, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(846, 130, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(860, 133, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(875, 136, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(890, 139, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(904, 160, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(915, 157, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(929, 166, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(939, 163, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(949, 172, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(963, 175, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(973, 187, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(984, 178, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(998, 181, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1014, 190, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1028, 199, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1042, 205, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(1057, 208, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1071, 211, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1081, 226, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1095, 229, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1109, 232, 1, 242, NULL, 'HUGG - UNIDADE DE TERAPIA INTENSIVA – COVID A'),
(1120, 235, 1, 242, NULL, 'HUGG - ENFERMARIA – COVID'),
(1129, 4, 1, 57, 300, NULL),
(1130, 7, 1, 57, 298, NULL),
(1131, 10, 1, 57, 298, NULL),
(1132, 13, 1, 57, 300, NULL),
(1133, 16, 1, 57, 300, NULL),
(1134, 19, 1, 57, 300, NULL),
(1135, 22, 1, 57, 300, NULL),
(1136, 25, 1, 57, 300, NULL),
(1137, 28, 1, 57, 300, NULL),
(1138, 31, 1, 57, 300, NULL),
(1139, 34, 1, 57, 300, NULL),
(1140, 37, 1, 57, 300, NULL),
(1141, 40, 1, 57, 298, NULL),
(1142, 43, 1, 57, 300, NULL),
(1143, 46, 1, 57, 298, NULL),
(1144, 49, 1, 57, 300, NULL),
(1145, 52, 1, 57, 298, NULL),
(1146, 55, 1, 57, 298, NULL),
(1147, 58, 1, 57, 300, NULL),
(1148, 61, 1, 57, 300, NULL),
(1149, 64, 1, 57, 300, NULL),
(1150, 67, 1, 57, 298, NULL),
(1151, 70, 1, 57, 300, NULL),
(1152, 73, 1, 57, 300, NULL),
(1153, 76, 1, 57, 300, NULL),
(1154, 79, 1, 57, 298, NULL),
(1155, 82, 1, 57, 298, NULL),
(1156, 85, 1, 57, 300, NULL),
(1157, 88, 1, 57, 300, NULL),
(1158, 91, 1, 57, 298, NULL),
(1159, 94, 1, 57, 300, NULL),
(1160, 97, 1, 57, 300, NULL),
(1161, 100, 1, 57, 300, NULL),
(1162, 103, 1, 57, 298, NULL),
(1163, 106, 1, 57, 300, NULL),
(1164, 109, 1, 57, 300, NULL),
(1165, 112, 1, 57, 298, NULL),
(1166, 115, 1, 57, 300, NULL),
(1167, 118, 1, 57, 298, NULL),
(1168, 121, 1, 57, 298, NULL),
(1169, 124, 1, 57, 300, NULL),
(1170, 127, 1, 57, 298, NULL),
(1171, 130, 1, 57, 300, NULL),
(1172, 133, 1, 57, 298, NULL),
(1173, 136, 1, 57, 298, NULL),
(1174, 139, 1, 57, 298, NULL),
(1175, 142, 1, 57, 298, NULL),
(1176, 145, 1, 57, 300, NULL),
(1177, 148, 1, 57, 300, NULL),
(1178, 151, 1, 57, 298, NULL),
(1179, 154, 1, 57, 298, NULL),
(1180, 157, 1, 57, 298, NULL),
(1181, 160, 1, 57, 298, NULL),
(1182, 163, 1, 57, 298, NULL),
(1183, 166, 1, 57, 300, NULL),
(1184, 169, 1, 57, 298, NULL),
(1185, 172, 1, 57, 300, NULL),
(1186, 175, 1, 57, 300, NULL),
(1187, 178, 1, 57, 298, NULL),
(1188, 181, 1, 57, 300, NULL),
(1189, 184, 1, 57, 300, NULL),
(1190, 187, 1, 57, 298, NULL),
(1191, 190, 1, 57, 300, NULL),
(1192, 193, 1, 57, 298, NULL),
(1193, 196, 1, 57, 298, NULL),
(1194, 199, 1, 57, 298, NULL),
(1195, 202, 1, 57, 300, NULL),
(1196, 205, 1, 57, 300, NULL),
(1197, 208, 1, 57, 298, NULL),
(1198, 211, 1, 57, 298, NULL),
(1199, 214, 1, 57, 298, NULL),
(1200, 217, 1, 57, 298, NULL),
(1201, 220, 1, 57, 298, NULL),
(1202, 223, 1, 57, 300, NULL),
(1203, 226, 1, 57, 300, NULL),
(1204, 229, 1, 57, 300, NULL),
(1205, 232, 1, 57, 300, NULL),
(1206, 235, 1, 57, 300, NULL),
(1207, 238, 1, 57, 300, NULL),
(1208, 241, 1, 57, 300, NULL),
(1209, 4, 1, 60, 298, NULL),
(1210, 7, 1, 60, 300, NULL),
(1211, 10, 1, 60, 300, NULL),
(1212, 13, 1, 60, 298, NULL),
(1213, 16, 1, 60, 298, NULL),
(1214, 19, 1, 60, 298, NULL),
(1215, 22, 1, 60, 298, NULL),
(1216, 25, 1, 60, 300, NULL),
(1217, 28, 1, 60, 298, NULL),
(1218, 31, 1, 60, 300, NULL),
(1219, 34, 1, 60, 300, NULL),
(1220, 37, 1, 60, 300, NULL),
(1221, 40, 1, 60, 300, NULL),
(1222, 43, 1, 60, 300, NULL),
(1223, 46, 1, 60, 300, NULL),
(1224, 49, 1, 60, 298, NULL),
(1225, 52, 1, 60, 300, NULL),
(1226, 55, 1, 60, 300, NULL),
(1227, 58, 1, 60, 300, NULL),
(1228, 61, 1, 60, 298, NULL),
(1229, 64, 1, 60, 300, NULL),
(1230, 67, 1, 60, 300, NULL),
(1231, 70, 1, 60, 300, NULL),
(1232, 73, 1, 60, 298, NULL),
(1233, 76, 1, 60, 300, NULL),
(1234, 79, 1, 60, 300, NULL),
(1235, 82, 1, 60, 300, NULL),
(1236, 85, 1, 60, 300, NULL),
(1237, 88, 1, 60, 300, NULL),
(1238, 91, 1, 60, 298, NULL),
(1239, 94, 1, 60, 300, NULL),
(1240, 97, 1, 60, 298, NULL),
(1241, 100, 1, 60, 300, NULL),
(1242, 103, 1, 60, 298, NULL),
(1243, 106, 1, 60, 300, NULL),
(1244, 109, 1, 60, 298, NULL),
(1245, 112, 1, 60, 300, NULL),
(1246, 115, 1, 60, 298, NULL),
(1247, 118, 1, 60, 300, NULL),
(1248, 121, 1, 60, 298, NULL),
(1249, 124, 1, 60, 300, NULL),
(1250, 127, 1, 60, 298, NULL),
(1251, 130, 1, 60, 300, NULL),
(1252, 133, 1, 60, 300, NULL),
(1253, 136, 1, 60, 298, NULL),
(1254, 139, 1, 60, 298, NULL),
(1255, 142, 1, 60, 300, NULL),
(1256, 145, 1, 60, 298, NULL),
(1257, 148, 1, 60, 298, NULL),
(1258, 151, 1, 60, 300, NULL),
(1259, 154, 1, 60, 300, NULL),
(1260, 157, 1, 60, 298, NULL),
(1261, 160, 1, 60, 298, NULL),
(1262, 163, 1, 60, 300, NULL),
(1263, 166, 1, 60, 300, NULL),
(1264, 169, 1, 60, 298, NULL),
(1265, 172, 1, 60, 298, NULL),
(1266, 175, 1, 60, 298, NULL),
(1267, 178, 1, 60, 300, NULL),
(1268, 181, 1, 60, 298, NULL),
(1269, 184, 1, 60, 300, NULL),
(1270, 187, 1, 60, 298, NULL),
(1271, 190, 1, 60, 300, NULL),
(1272, 193, 1, 60, 300, NULL),
(1273, 196, 1, 60, 300, NULL),
(1274, 199, 1, 60, 300, NULL),
(1275, 202, 1, 60, 300, NULL),
(1276, 205, 1, 60, 300, NULL),
(1277, 208, 1, 60, 298, NULL),
(1278, 211, 1, 60, 298, NULL),
(1279, 214, 1, 60, 300, NULL),
(1280, 217, 1, 60, 300, NULL),
(1281, 220, 1, 60, 300, NULL),
(1282, 223, 1, 60, 300, NULL),
(1283, 226, 1, 60, 300, NULL),
(1284, 229, 1, 60, 298, NULL),
(1285, 232, 1, 60, 300, NULL),
(1286, 235, 1, 60, 300, NULL),
(1287, 238, 1, 60, 300, NULL),
(1288, 241, 1, 60, 298, NULL),
(1289, 4, 1, 50, 298, NULL),
(1290, 7, 1, 50, 300, NULL),
(1291, 10, 1, 50, 300, NULL),
(1292, 13, 1, 50, 298, NULL),
(1293, 16, 1, 50, 298, NULL),
(1294, 19, 1, 50, 300, NULL),
(1295, 22, 1, 50, 300, NULL),
(1296, 25, 1, 50, 298, NULL),
(1297, 28, 1, 50, 300, NULL),
(1298, 31, 1, 50, 300, NULL),
(1299, 34, 1, 50, 298, NULL),
(1300, 37, 1, 50, 300, NULL),
(1301, 40, 1, 50, 298, NULL),
(1302, 43, 1, 50, 300, NULL),
(1303, 46, 1, 50, 300, NULL),
(1304, 49, 1, 50, 300, NULL),
(1305, 52, 1, 50, 300, NULL),
(1306, 55, 1, 50, 300, NULL),
(1307, 58, 1, 50, 300, NULL),
(1308, 61, 1, 50, 300, NULL),
(1309, 64, 1, 50, 300, NULL),
(1310, 67, 1, 50, 300, NULL),
(1311, 70, 1, 50, 298, NULL),
(1312, 73, 1, 50, 300, NULL),
(1313, 76, 1, 50, 298, NULL),
(1314, 79, 1, 50, 300, NULL),
(1315, 82, 1, 50, 300, NULL),
(1316, 85, 1, 50, 300, NULL),
(1317, 88, 1, 50, 300, NULL),
(1318, 91, 1, 50, 300, NULL),
(1319, 94, 1, 50, 298, NULL),
(1320, 97, 1, 50, 300, NULL),
(1321, 100, 1, 50, 300, NULL),
(1322, 103, 1, 50, 300, NULL),
(1323, 106, 1, 50, 300, NULL),
(1324, 109, 1, 50, 300, NULL),
(1325, 112, 1, 50, 300, NULL),
(1326, 115, 1, 50, 300, NULL),
(1327, 118, 1, 50, 300, NULL),
(1328, 121, 1, 50, 300, NULL),
(1329, 124, 1, 50, 300, NULL),
(1330, 127, 1, 50, 300, NULL),
(1331, 130, 1, 50, 298, NULL),
(1332, 133, 1, 50, 300, NULL),
(1333, 136, 1, 50, 300, NULL),
(1334, 139, 1, 50, 300, NULL),
(1335, 142, 1, 50, 300, NULL),
(1336, 145, 1, 50, 300, NULL),
(1337, 148, 1, 50, 298, NULL),
(1338, 151, 1, 50, 300, NULL),
(1339, 154, 1, 50, 298, NULL),
(1340, 157, 1, 50, 300, NULL),
(1341, 160, 1, 50, 300, NULL),
(1342, 163, 1, 50, 298, NULL),
(1343, 166, 1, 50, 298, NULL),
(1344, 169, 1, 50, 300, NULL),
(1345, 172, 1, 50, 298, NULL),
(1346, 175, 1, 50, 300, NULL),
(1347, 178, 1, 50, 300, NULL),
(1348, 181, 1, 50, 300, NULL),
(1349, 184, 1, 50, 300, NULL),
(1350, 187, 1, 50, 300, NULL),
(1351, 190, 1, 50, 300, NULL),
(1352, 193, 1, 50, 300, NULL),
(1353, 196, 1, 50, 300, NULL),
(1354, 199, 1, 50, 300, NULL),
(1355, 202, 1, 50, 300, NULL),
(1356, 205, 1, 50, 298, NULL),
(1357, 208, 1, 50, 300, NULL),
(1358, 211, 1, 50, 300, NULL),
(1359, 214, 1, 50, 300, NULL),
(1360, 217, 1, 50, 300, NULL),
(1361, 220, 1, 50, 300, NULL),
(1362, 223, 1, 50, 298, NULL),
(1363, 226, 1, 50, 300, NULL),
(1364, 229, 1, 50, 300, NULL),
(1365, 232, 1, 50, 300, NULL),
(1366, 235, 1, 50, 298, NULL),
(1367, 238, 1, 50, 300, NULL),
(1368, 241, 1, 50, 300, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questionnaire`
--

CREATE TABLE `tb_questionnaire` (
  `questionnaireID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questionnaireparts`
--

CREATE TABLE `tb_questionnaireparts` (
  `questionnairePartsID` int(10) NOT NULL,
  `questionnairePartsTableID` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questionnairepartsontology`
--

CREATE TABLE `tb_questionnairepartsontology` (
  `ontologyID` int(10) NOT NULL,
  `ontologyURI` varchar(255) NOT NULL,
  `questionnairePartsID` int(10) NOT NULL,
  `questionnairePartsTableID` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questionnairepartstable`
--

CREATE TABLE `tb_questionnairepartstable` (
  `questionnairePartsTableID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questions`
--

CREATE TABLE `tb_questions` (
  `questionID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.',
  `questionTypeID` int(10) NOT NULL COMMENT '(pt-br) Chave estrangeira para tabela tb_QuestionsTypes.\r\n(en) Foreign key for the tp_QuestionsTypes table.',
  `listTypeID` int(10) DEFAULT NULL,
  `questionGroupID` int(10) DEFAULT NULL,
  `subordinateTo` int(10) DEFAULT NULL,
  `isAbout` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_questiontype`
--

CREATE TABLE `tb_questiontype` (
  `questionTypeID` int(10) NOT NULL,
  `description` varchar(255) NOT NULL COMMENT '(pt-br) Descrição.\r\n(en) description.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user`
--

CREATE TABLE `tb_user` (
  `userID` bigint(20) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `regionalCouncilCode` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `eMail` varchar(255) DEFAULT NULL,
  `foneNumber` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_user`
--

INSERT INTO `tb_user` (`userID`, `login`, `firstName`, `lastName`, `regionalCouncilCode`, `password`, `eMail`, `foneNumber`) VALUES
(2, 'ETL_Hosp_Exemplo', 'ETL', 'Hosp EXEMPLO', NULL, 'testepsw', 'admin@hospitalexemplo.com.br', '5555-5555');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_userrole`
--

CREATE TABLE `tb_userrole` (
  `userID` int(11) NOT NULL,
  `groupRoleID` int(11) NOT NULL,
  `hospitalUnitID` int(11) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expirationDate` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `visu`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `visu` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vivos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vivos` (
`pacid_mortos` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vivos2`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vivos2` (
`participantID` int(10)
,`hospitalUnitID` int(10)
,`questionnaireID` int(10)
,`formRecordID` int(10)
,`crfFormsID` int(10)
,`dtRegistroForm` timestamp
,`questionGroupFormRecordID` int(10)
,`questionID` int(10)
,`listOfValuesID` int(10)
,`answer` varchar(512)
,`medicalRecord` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vivosadultos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vivosadultos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vivosasmaticos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vivosasmaticos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vivoshipertensos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vivoshipertensos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vivosidosos`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vivosidosos` (
`participantID` int(10)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_crfforms_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_crfforms_covidcrfrapid` (
`crfFormsID` int(10)
,`questionnaireID` int(10)
,`description` varchar(255)
,`ontologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_listofvalues_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_listofvalues_covidcrfrapid` (
`listOfValuesID` int(10)
,`listTypeID` int(10)
,`description` varchar(255)
,`ontologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_listype_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_listype_covidcrfrapid` (
`listTypeID` int(10)
,`description` varchar(255)
,`ontologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_questiongroupform_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_questiongroupform_covidcrfrapid` (
`crfFormsID` int(10)
,`questionID` int(10)
,`questionOrder` int(10)
,`form_OntologyURI` varchar(500)
,`question_OntologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_questiongroup_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_questiongroup_covidcrfrapid` (
`questionGroupID` int(10)
,`description` varchar(255)
,`comment` varchar(255)
,`ontologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_questionnaire_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_questionnaire_covidcrfrapid` (
`questionnaireID` int(10)
,`description` varchar(255)
,`ontologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_questions_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_questions_covidcrfrapid` (
`questionID` int(10)
,`description` varchar(255)
,`questionTypeID` int(10)
,`listTypeID` int(10)
,`questionGroupID` int(10)
,`subordinateTo` int(10)
,`isAbout` int(10)
,`ontologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vw_questiontype_covidcrfrapid`
-- (Veja abaixo para a view atual)
--
CREATE TABLE `vw_questiontype_covidcrfrapid` (
`questionTypeID` int(10)
,`description` varchar(255)
,`ontologyURI` varchar(500)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `adultos`
--
DROP TABLE IF EXISTS `adultos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adultos`  AS  select `idades`.`participantID` AS `participantID`,`idades`.`hospitalUnitID` AS `hospitalUnitID`,`idades`.`questionnaireID` AS `questionnaireID`,`idades`.`formRecordID` AS `formRecordID`,`idades`.`crfFormsID` AS `crfFormsID`,`idades`.`dtRegistroForm` AS `dtRegistroForm`,`idades`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`idades`.`questionID` AS `questionID`,`idades`.`listOfValuesID` AS `listOfValuesID`,`idades`.`answer` AS `answer`,`idades`.`medicalRecord` AS `medicalRecord` from `idades` where `idades`.`answer` between 19 and 59 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `altasfumantes`
--
DROP TABLE IF EXISTS `altasfumantes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `altasfumantes`  AS  select `m`.`participantID` AS `participantID` from ((select `fumantes2`.`participantID` AS `participantID` from `fumantes2`) `m` join (select `vivos2`.`participantID` AS `participantID` from `vivos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `altashomem`
--
DROP TABLE IF EXISTS `altashomem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `altashomem`  AS  select `m`.`participantID` AS `participantID` from ((select `masc`.`participantID` AS `participantID` from `masc`) `m` join (select `vivos2`.`participantID` AS `participantID` from `vivos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `altasmulher`
--
DROP TABLE IF EXISTS `altasmulher`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `altasmulher`  AS  select `m`.`participantID` AS `participantID` from ((select `fem`.`participantID` AS `participantID` from `fem`) `m` join (select `vivos2`.`participantID` AS `participantID` from `vivos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `asmaticos`
--
DROP TABLE IF EXISTS `asmaticos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `asmaticos`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 50 and `visu`.`listOfValuesID` = 298 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `fem`
--
DROP TABLE IF EXISTS `fem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fem`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 111 and `visu`.`listOfValuesID` = 284 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `fumantes`
--
DROP TABLE IF EXISTS `fumantes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fumantes`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 57 and `visu`.`listOfValuesID` = 298 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `fumantes2`
--
DROP TABLE IF EXISTS `fumantes2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fumantes2`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 57 and `visu`.`listOfValuesID` = 298 group by `visu`.`participantID` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `hipertensos`
--
DROP TABLE IF EXISTS `hipertensos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `hipertensos`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 60 and `visu`.`listOfValuesID` = 298 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `idades`
--
DROP TABLE IF EXISTS `idades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idades`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 144 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `idosos`
--
DROP TABLE IF EXISTS `idosos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idosos`  AS  select `idades`.`participantID` AS `participantID`,`idades`.`hospitalUnitID` AS `hospitalUnitID`,`idades`.`questionnaireID` AS `questionnaireID`,`idades`.`formRecordID` AS `formRecordID`,`idades`.`crfFormsID` AS `crfFormsID`,`idades`.`dtRegistroForm` AS `dtRegistroForm`,`idades`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`idades`.`questionID` AS `questionID`,`idades`.`listOfValuesID` AS `listOfValuesID`,`idades`.`answer` AS `answer`,`idades`.`medicalRecord` AS `medicalRecord` from `idades` where `idades`.`answer` > 59 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `jovens`
--
DROP TABLE IF EXISTS `jovens`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jovens`  AS  select `idades`.`participantID` AS `participantID`,`idades`.`hospitalUnitID` AS `hospitalUnitID`,`idades`.`questionnaireID` AS `questionnaireID`,`idades`.`formRecordID` AS `formRecordID`,`idades`.`crfFormsID` AS `crfFormsID`,`idades`.`dtRegistroForm` AS `dtRegistroForm`,`idades`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`idades`.`questionID` AS `questionID`,`idades`.`listOfValuesID` AS `listOfValuesID`,`idades`.`answer` AS `answer`,`idades`.`medicalRecord` AS `medicalRecord` from `idades` where `idades`.`answer` between 0 and 19 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `leitos`
--
DROP TABLE IF EXISTS `leitos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leitos`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 228 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `masc`
--
DROP TABLE IF EXISTS `masc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `masc`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 111 and `visu`.`listOfValuesID` = 285 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `mortos`
--
DROP TABLE IF EXISTS `mortos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mortos`  AS  select `visu`.`participantID` AS `pacid_mortos` from `visu` where `visu`.`questionID` = 123 and `visu`.`listOfValuesID` = 275 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `mortos2`
--
DROP TABLE IF EXISTS `mortos2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mortos2`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 123 and `visu`.`listOfValuesID` = 275 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `obitosadultos`
--
DROP TABLE IF EXISTS `obitosadultos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obitosadultos`  AS  select `m`.`participantID` AS `participantID` from ((select `adultos`.`participantID` AS `participantID` from `adultos`) `m` join (select `mortos2`.`participantID` AS `participantID` from `mortos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `obitosasmaticos`
--
DROP TABLE IF EXISTS `obitosasmaticos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obitosasmaticos`  AS  select `m`.`participantID` AS `participantID` from ((select `asmaticos`.`participantID` AS `participantID` from `asmaticos`) `m` join (select `mortos2`.`participantID` AS `participantID` from `mortos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `obitosfumantes`
--
DROP TABLE IF EXISTS `obitosfumantes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obitosfumantes`  AS  select `m`.`participantID` AS `participantID` from ((select `fumantes2`.`participantID` AS `participantID` from `fumantes2`) `m` join (select `mortos2`.`participantID` AS `participantID` from `mortos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `obitoshipertensos`
--
DROP TABLE IF EXISTS `obitoshipertensos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obitoshipertensos`  AS  select `m`.`participantID` AS `participantID` from ((select `hipertensos`.`participantID` AS `participantID` from `hipertensos`) `m` join (select `mortos2`.`participantID` AS `participantID` from `mortos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `obitoshomens`
--
DROP TABLE IF EXISTS `obitoshomens`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obitoshomens`  AS  select `m`.`participantID` AS `participantID` from ((select `masc`.`participantID` AS `participantID` from `masc`) `m` join (select `mortos2`.`participantID` AS `participantID` from `mortos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `obitosidosos`
--
DROP TABLE IF EXISTS `obitosidosos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obitosidosos`  AS  select `m`.`participantID` AS `participantID` from ((select `idosos`.`participantID` AS `participantID` from `idosos`) `m` join (select `mortos2`.`participantID` AS `participantID` from `mortos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `obitosmulher`
--
DROP TABLE IF EXISTS `obitosmulher`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `obitosmulher`  AS  select `m`.`participantID` AS `participantID` from ((select `fem`.`participantID` AS `participantID` from `fem`) `m` join (select `mortos2`.`participantID` AS `participantID` from `mortos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacantiviral`
--
DROP TABLE IF EXISTS `pacantiviral`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacantiviral`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 101 and `visu`.`crfFormsID` = 3 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacidazit`
--
DROP TABLE IF EXISTS `pacidazit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacidazit`  AS  select `r`.`pacid` AS `pacazitrom` from (select `visu`.`participantID` AS `pacid`,`visu`.`formRecordID` AS `formrecordID`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer` from `visu` where `visu`.`questionID` = 101 and `visu`.`listOfValuesID` = 305 group by `visu`.`participantID`) `r` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacidazitrom`
--
DROP TABLE IF EXISTS `pacidazitrom`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacidazitrom`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 101 and `visu`.`listOfValuesID` = 305 group by `visu`.`participantID` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacidclor`
--
DROP TABLE IF EXISTS `pacidclor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacidclor`  AS  select `visu`.`participantID` AS `pacid`,`visu`.`formRecordID` AS `formrecordID`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer` from `visu` where `visu`.`questionID` = 101 and `visu`.`listOfValuesID` = 306 group by `visu`.`participantID` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacidcloro`
--
DROP TABLE IF EXISTS `pacidcloro`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacidcloro`  AS  select `r`.`participantID` AS `pacidcloro` from (select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 101 and `visu`.`listOfValuesID` = 306 group by `visu`.`participantID`) `r` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacidcloro2`
--
DROP TABLE IF EXISTS `pacidcloro2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacidcloro2`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 101 and `visu`.`listOfValuesID` = 306 group by `visu`.`participantID` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacidlop`
--
DROP TABLE IF EXISTS `pacidlop`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacidlop`  AS  select `r`.`participantID` AS `pacidlop` from (select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 101 and `visu`.`listOfValuesID` = 3 group by `visu`.`participantID`) `r` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pacidlop2`
--
DROP TABLE IF EXISTS `pacidlop2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pacidlop2`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 101 and `visu`.`listOfValuesID` = 3 group by `visu`.`participantID` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `r`
--
DROP TABLE IF EXISTS `r`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `r`  AS  select `t1`.`formRecordID` AS `formRecordID`,`t1`.`crfFormsID` AS `crfFormsID`,`t1`.`participantID` AS `participantID`,`t1`.`hospitalUnitID` AS `hospitalUnitID`,`t1`.`questionnaireID` AS `questionnaireID`,`t1`.`dtRegistroForm` AS `dtRegistroForm`,`t2`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`t2`.`questionID` AS `questionID`,`t2`.`listOfValuesID` AS `listOfValuesID`,`t2`.`answer` AS `answer` from (`tb_formrecord` `t1` join `tb_questiongroupformrecord` `t2` on(`t1`.`formRecordID` = `t2`.`formRecordID` and `t1`.`crfFormsID` = `t2`.`crfFormsID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `sexofem`
--
DROP TABLE IF EXISTS `sexofem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sexofem`  AS  select `visu`.`participantID` AS `pacfem` from `visu` where `visu`.`questionID` = 111 and `visu`.`listOfValuesID` = 284 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `sexomasc`
--
DROP TABLE IF EXISTS `sexomasc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sexomasc`  AS  select `visu`.`participantID` AS `pacmasc` from `visu` where `visu`.`questionID` = 111 and `visu`.`listOfValuesID` = 285 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `visu`
--
DROP TABLE IF EXISTS `visu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `visu`  AS  select `t1`.`participantID` AS `participantID`,`t1`.`hospitalUnitID` AS `hospitalUnitID`,`t1`.`questionnaireID` AS `questionnaireID`,`t1`.`formRecordID` AS `formRecordID`,`t1`.`crfFormsID` AS `crfFormsID`,`t1`.`dtRegistroForm` AS `dtRegistroForm`,`t2`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`t2`.`questionID` AS `questionID`,`t2`.`listOfValuesID` AS `listOfValuesID`,`t2`.`answer` AS `answer`,`tb_participant`.`medicalRecord` AS `medicalRecord` from (((`tb_formrecord` `t1` join `tb_questiongroupformrecord` `t2` on(`t1`.`formRecordID` = `t2`.`formRecordID` and `t1`.`crfFormsID` = `t2`.`crfFormsID`)) join `tb_participant` on(`t1`.`participantID` = `tb_participant`.`participantID`)) join `tb_assessmentquestionnaire` on(`t1`.`participantID` = `tb_assessmentquestionnaire`.`participantID` and `t1`.`hospitalUnitID` = `tb_assessmentquestionnaire`.`hospitalUnitID` and `t1`.`questionnaireID` = `tb_assessmentquestionnaire`.`questionnaireID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vivos`
--
DROP TABLE IF EXISTS `vivos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vivos`  AS  select `visu`.`participantID` AS `pacid_mortos` from `visu` where `visu`.`questionID` = 123 and `visu`.`listOfValuesID` = 276 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vivos2`
--
DROP TABLE IF EXISTS `vivos2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vivos2`  AS  select `visu`.`participantID` AS `participantID`,`visu`.`hospitalUnitID` AS `hospitalUnitID`,`visu`.`questionnaireID` AS `questionnaireID`,`visu`.`formRecordID` AS `formRecordID`,`visu`.`crfFormsID` AS `crfFormsID`,`visu`.`dtRegistroForm` AS `dtRegistroForm`,`visu`.`questionGroupFormRecordID` AS `questionGroupFormRecordID`,`visu`.`questionID` AS `questionID`,`visu`.`listOfValuesID` AS `listOfValuesID`,`visu`.`answer` AS `answer`,`visu`.`medicalRecord` AS `medicalRecord` from `visu` where `visu`.`questionID` = 123 and `visu`.`listOfValuesID` = 276 ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vivosadultos`
--
DROP TABLE IF EXISTS `vivosadultos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vivosadultos`  AS  select `m`.`participantID` AS `participantID` from ((select `adultos`.`participantID` AS `participantID` from `adultos`) `m` join (select `vivos2`.`participantID` AS `participantID` from `vivos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vivosasmaticos`
--
DROP TABLE IF EXISTS `vivosasmaticos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vivosasmaticos`  AS  select `m`.`participantID` AS `participantID` from ((select `asmaticos`.`participantID` AS `participantID` from `asmaticos`) `m` join (select `vivos2`.`participantID` AS `participantID` from `vivos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vivoshipertensos`
--
DROP TABLE IF EXISTS `vivoshipertensos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vivoshipertensos`  AS  select `m`.`participantID` AS `participantID` from ((select `hipertensos`.`participantID` AS `participantID` from `hipertensos`) `m` join (select `vivos2`.`participantID` AS `participantID` from `vivos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vivosidosos`
--
DROP TABLE IF EXISTS `vivosidosos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vivosidosos`  AS  select `m`.`participantID` AS `participantID` from ((select `idosos`.`participantID` AS `participantID` from `idosos`) `m` join (select `vivos2`.`participantID` AS `participantID` from `vivos2`) `o` on(`m`.`participantID` = `o`.`participantID`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_crfforms_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_crfforms_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_crfforms_covidcrfrapid`  AS  select `t1`.`crfFormsID` AS `crfFormsID`,`t1`.`questionnaireID` AS `questionnaireID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_crfforms',`t1`.`crfFormsID`) AS `ontologyURI` from `tb_crfforms` `t1` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_listofvalues_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_listofvalues_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_listofvalues_covidcrfrapid`  AS  select `t1`.`listOfValuesID` AS `listOfValuesID`,`t1`.`listTypeID` AS `listTypeID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_listofvalues',`t1`.`listOfValuesID`) AS `ontologyURI` from `tb_listofvalues` `t1` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_listype_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_listype_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_listype_covidcrfrapid`  AS  select `t1`.`listTypeID` AS `listTypeID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_listtype',`t1`.`listTypeID`) AS `ontologyURI` from `tb_listtype` `t1` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_questiongroupform_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_questiongroupform_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_questiongroupform_covidcrfrapid`  AS  select `t1`.`crfFormsID` AS `crfFormsID`,`t1`.`questionID` AS `questionID`,`t1`.`questionOrder` AS `questionOrder`,`t2`.`ontologyURI` AS `form_OntologyURI`,`t3`.`ontologyURI` AS `question_OntologyURI` from ((`tb_questiongroupform` `t1` join `vw_crfforms_covidcrfrapid` `t2`) join `vw_questions_covidcrfrapid` `t3`) where `t2`.`crfFormsID` = `t1`.`crfFormsID` and `t3`.`questionID` = `t1`.`questionID` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_questiongroup_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_questiongroup_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_questiongroup_covidcrfrapid`  AS  select `t1`.`questionGroupID` AS `questionGroupID`,`t1`.`description` AS `description`,`t1`.`comment` AS `comment`,`ontologyURI`('COVIDCRFRAPID','tb_questiongroup',`t1`.`questionGroupID`) AS `ontologyURI` from `tb_questiongroup` `t1` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_questionnaire_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_questionnaire_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_questionnaire_covidcrfrapid`  AS  select `t1`.`questionnaireID` AS `questionnaireID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_questionnaire',`t1`.`questionnaireID`) AS `ontologyURI` from `tb_questionnaire` `t1` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_questions_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_questions_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_questions_covidcrfrapid`  AS  select `t1`.`questionID` AS `questionID`,`t1`.`description` AS `description`,`t1`.`questionTypeID` AS `questionTypeID`,`t1`.`listTypeID` AS `listTypeID`,`t1`.`questionGroupID` AS `questionGroupID`,`t1`.`subordinateTo` AS `subordinateTo`,`t1`.`isAbout` AS `isAbout`,`ontologyURI`('COVIDCRFRAPID','tb_questions',`t1`.`questionID`) AS `ontologyURI` from `tb_questions` `t1` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vw_questiontype_covidcrfrapid`
--
DROP TABLE IF EXISTS `vw_questiontype_covidcrfrapid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_questiontype_covidcrfrapid`  AS  select `t1`.`questionTypeID` AS `questionTypeID`,`t1`.`description` AS `description`,`ontologyURI`('COVIDCRFRAPID','tb_questiontype',`t1`.`questionTypeID`) AS `ontologyURI` from `tb_questiontype` `t1` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_assessmentquestionnaire`
--
ALTER TABLE `tb_assessmentquestionnaire`
  ADD PRIMARY KEY (`participantID`,`hospitalUnitID`,`questionnaireID`),
  ADD KEY `FKtb_Assessm665217` (`hospitalUnitID`),
  ADD KEY `FKtb_Assessm419169` (`questionnaireID`);

--
-- Índices para tabela `tb_crfforms`
--
ALTER TABLE `tb_crfforms`
  ADD PRIMARY KEY (`crfFormsID`),
  ADD KEY `FKtb_CRFForm860269` (`questionnaireID`);

--
-- Índices para tabela `tb_formrecord`
--
ALTER TABLE `tb_formrecord`
  ADD PRIMARY KEY (`formRecordID`),
  ADD KEY `FKtb_FormRec2192` (`crfFormsID`),
  ADD KEY `FKtb_FormRec984256` (`participantID`,`hospitalUnitID`,`questionnaireID`);

--
-- Índices para tabela `tb_grouprole`
--
ALTER TABLE `tb_grouprole`
  ADD PRIMARY KEY (`groupRoleID`),
  ADD UNIQUE KEY `groupRoleID` (`groupRoleID`);

--
-- Índices para tabela `tb_grouprolepermission`
--
ALTER TABLE `tb_grouprolepermission`
  ADD PRIMARY KEY (`groupRoleID`,`permissionID`),
  ADD KEY `FKtb_GroupRo893005` (`permissionID`);

--
-- Índices para tabela `tb_hospitalunit`
--
ALTER TABLE `tb_hospitalunit`
  ADD PRIMARY KEY (`hospitalUnitID`);

--
-- Índices para tabela `tb_language`
--
ALTER TABLE `tb_language`
  ADD PRIMARY KEY (`languageID`);

--
-- Índices para tabela `tb_listofvalues`
--
ALTER TABLE `tb_listofvalues`
  ADD PRIMARY KEY (`listOfValuesID`),
  ADD KEY `FKtb_ListOfV184108` (`listTypeID`);

--
-- Índices para tabela `tb_listtype`
--
ALTER TABLE `tb_listtype`
  ADD PRIMARY KEY (`listTypeID`);

--
-- Índices para tabela `tb_multilanguage`
--
ALTER TABLE `tb_multilanguage`
  ADD PRIMARY KEY (`languageID`,`description`);

--
-- Índices para tabela `tb_notificationrecord`
--
ALTER TABLE `tb_notificationrecord`
  ADD PRIMARY KEY (`userID`,`profileID`,`hospitalUnitID`,`tableName`,`rowdID`,`changedOn`,`operation`);

--
-- Índices para tabela `tb_ontology`
--
ALTER TABLE `tb_ontology`
  ADD PRIMARY KEY (`ontologyID`);

--
-- Índices para tabela `tb_ontologyterms`
--
ALTER TABLE `tb_ontologyterms`
  ADD PRIMARY KEY (`ontologyURI`,`ontologyID`),
  ADD KEY `FKtb_Ontolog722236` (`ontologyID`);

--
-- Índices para tabela `tb_participant`
--
ALTER TABLE `tb_participant`
  ADD PRIMARY KEY (`participantID`);

--
-- Índices para tabela `tb_permission`
--
ALTER TABLE `tb_permission`
  ADD PRIMARY KEY (`permissionID`),
  ADD UNIQUE KEY `permissionID` (`permissionID`);

--
-- Índices para tabela `tb_questiongroup`
--
ALTER TABLE `tb_questiongroup`
  ADD PRIMARY KEY (`questionGroupID`);

--
-- Índices para tabela `tb_questiongroupform`
--
ALTER TABLE `tb_questiongroupform`
  ADD PRIMARY KEY (`crfFormsID`,`questionID`),
  ADD KEY `FKtb_Questio124287` (`questionID`);

--
-- Índices para tabela `tb_questiongroupformrecord`
--
ALTER TABLE `tb_questiongroupformrecord`
  ADD PRIMARY KEY (`questionGroupFormRecordID`),
  ADD KEY `FKtb_Questio928457` (`listOfValuesID`),
  ADD KEY `FKtb_Questio489549` (`crfFormsID`,`questionID`),
  ADD KEY `FKtb_Questio935723` (`formRecordID`);

--
-- Índices para tabela `tb_questionnaire`
--
ALTER TABLE `tb_questionnaire`
  ADD PRIMARY KEY (`questionnaireID`);

--
-- Índices para tabela `tb_questionnaireparts`
--
ALTER TABLE `tb_questionnaireparts`
  ADD PRIMARY KEY (`questionnairePartsID`,`questionnairePartsTableID`),
  ADD KEY `FKtb_Questio42774` (`questionnairePartsTableID`);

--
-- Índices para tabela `tb_questionnairepartsontology`
--
ALTER TABLE `tb_questionnairepartsontology`
  ADD PRIMARY KEY (`ontologyID`,`ontologyURI`,`questionnairePartsID`,`questionnairePartsTableID`),
  ADD KEY `FKtb_Questio546464` (`ontologyURI`,`ontologyID`),
  ADD KEY `FKtb_Questio773521` (`questionnairePartsID`,`questionnairePartsTableID`);

--
-- Índices para tabela `tb_questionnairepartstable`
--
ALTER TABLE `tb_questionnairepartstable`
  ADD PRIMARY KEY (`questionnairePartsTableID`);

--
-- Índices para tabela `tb_questions`
--
ALTER TABLE `tb_questions`
  ADD PRIMARY KEY (`questionID`),
  ADD KEY `FKtb_Questio240796` (`listTypeID`),
  ADD KEY `FKtb_Questio684913` (`questionTypeID`),
  ADD KEY `FKtb_Questio808495` (`questionGroupID`),
  ADD KEY `SubordinateTo` (`subordinateTo`),
  ADD KEY `isAbout` (`isAbout`);

--
-- Índices para tabela `tb_questiontype`
--
ALTER TABLE `tb_questiontype`
  ADD PRIMARY KEY (`questionTypeID`);

--
-- Índices para tabela `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Índices para tabela `tb_userrole`
--
ALTER TABLE `tb_userrole`
  ADD PRIMARY KEY (`userID`,`groupRoleID`,`hospitalUnitID`),
  ADD KEY `FKtb_UserRol864770` (`groupRoleID`),
  ADD KEY `FKtb_UserRol324331` (`hospitalUnitID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_crfforms`
--
ALTER TABLE `tb_crfforms`
  MODIFY `crfFormsID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_formrecord`
--
ALTER TABLE `tb_formrecord`
  MODIFY `formRecordID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT de tabela `tb_grouprole`
--
ALTER TABLE `tb_grouprole`
  MODIFY `groupRoleID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_hospitalunit`
--
ALTER TABLE `tb_hospitalunit`
  MODIFY `hospitalUnitID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_language`
--
ALTER TABLE `tb_language`
  MODIFY `languageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_listofvalues`
--
ALTER TABLE `tb_listofvalues`
  MODIFY `listOfValuesID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_listtype`
--
ALTER TABLE `tb_listtype`
  MODIFY `listTypeID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_ontology`
--
ALTER TABLE `tb_ontology`
  MODIFY `ontologyID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_participant`
--
ALTER TABLE `tb_participant`
  MODIFY `participantID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT de tabela `tb_permission`
--
ALTER TABLE `tb_permission`
  MODIFY `permissionID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_questiongroup`
--
ALTER TABLE `tb_questiongroup`
  MODIFY `questionGroupID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_questiongroupformrecord`
--
ALTER TABLE `tb_questiongroupformrecord`
  MODIFY `questionGroupFormRecordID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1369;

--
-- AUTO_INCREMENT de tabela `tb_questionnaire`
--
ALTER TABLE `tb_questionnaire`
  MODIFY `questionnaireID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_questionnairepartstable`
--
ALTER TABLE `tb_questionnairepartstable`
  MODIFY `questionnairePartsTableID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_questions`
--
ALTER TABLE `tb_questions`
  MODIFY `questionID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_questiontype`
--
ALTER TABLE `tb_questiontype`
  MODIFY `questionTypeID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `userID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
