-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 30/07/2025 às 16:43
-- Versão do servidor: 10.11.13-MariaDB-cll-lve
-- Versão do PHP: 8.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ezengenharia_site`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessos`
--

CREATE TABLE `acessos` (
  `id_acessos` int(11) NOT NULL,
  `funcao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `acessos`
--

INSERT INTO `acessos` (`id_acessos`, `funcao`, `status`) VALUES
(1, 'menu_banners_slideshow', 1),
(2, 'menu_central_servicos', 0),
(3, 'menu_relacao_cliente', 1),
(4, 'menu_galeria', 1),
(5, 'menu_vitrine', 0),
(6, 'menu_eventos', 0),
(7, 'menu_blog', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores`
--

CREATE TABLE `autores` (
  `id_autores` int(11) NOT NULL,
  `nome` longtext DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `autores`
--

INSERT INTO `autores` (`id_autores`, `nome`, `descricao`, `imagem`, `status`) VALUES
(1, 'Eloiza Zanoni', '', 'autor-202212210929.webp', 1),
(2, 'Ronaldo Mohr ', '', '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `banner`
--

CREATE TABLE `banner` (
  `id_banner` int(11) NOT NULL,
  `imagem` longtext DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `texto_botao` varchar(100) DEFAULT NULL,
  `link_nova_aba` int(11) DEFAULT NULL COMMENT '0-Não 1-Sim	',
  `posicao` int(11) DEFAULT NULL,
  `orientacao_vertical_imagem` varchar(45) DEFAULT NULL,
  `orientacao_horizontal_imagem` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `banner`
--

INSERT INTO `banner` (`id_banner`, `imagem`, `titulo`, `descricao`, `link`, `texto_botao`, `link_nova_aba`, `posicao`, `orientacao_vertical_imagem`, `orientacao_horizontal_imagem`) VALUES
(6, 'gestao-completa-da-sua-obra-202312181954.webp', 'Gestão completa da sua obra', '', 'https://contate.me/ezengenharia', 'QUERO UM ORÇAMENTO', 1, 1, 'center', 'right'),
(7, 'projetos-eficientes-202312181958.webp', 'Projetos eficientes', '', 'https://contate.me/ezengenharia', 'QUERO UM ORÇAMENTO', 1, 2, 'center', 'center'),
(8, 'estruturas-de-solo-de-qualidade-202312181958.webp', 'Estruturas de solo de qualidade', 'aa', 'https://contate.me/ezengenharia', 'QUERO UM ORÇAMENTO', 1, 3, 'center', 'center');

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_categorias`
--

CREATE TABLE `blog_categorias` (
  `id_blog_categorias` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `blog_categorias`
--

INSERT INTO `blog_categorias` (`id_blog_categorias`, `descricao`, `posicao`, `url_amigavel`, `status`) VALUES
(4, 'Blog', 1, 'blog', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_imagens`
--

CREATE TABLE `blog_imagens` (
  `id_blog_imagens` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_postagem`
--

CREATE TABLE `blog_postagem` (
  `id_blog_postagem` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `data_publicacao` datetime DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0 COMMENT '1-Publicado\r\n0-Rascunho',
  `visualizacoes` int(11) DEFAULT 0,
  `id_blog_categorias` int(11) NOT NULL,
  `id_blog_subcategorias` int(11) NOT NULL,
  `id_autores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `blog_postagem`
--

INSERT INTO `blog_postagem` (`id_blog_postagem`, `titulo`, `texto`, `imagem`, `data_criacao`, `data_publicacao`, `video`, `url_amigavel`, `status`, `visualizacoes`, `id_blog_categorias`, `id_blog_subcategorias`, `id_autores`) VALUES
(26, 'Conheça a EZ Engenharia ', '<p>A EZ Engenharia &eacute; uma empresa localizada em Cascavel, Paran&aacute;, especializada em solu&ccedil;&otilde;es de engenharia e constru&ccedil;&atilde;o de alta qualidade. Desde sua funda&ccedil;&atilde;o em 2018, a EZ Engenharia tem se destacado no setor por sua excel&ecirc;ncia, transpar&ecirc;ncia e comprometimento com os clientes. A empresa oferece uma gama completa de servi&ccedil;os, que v&atilde;o desde a elabora&ccedil;&atilde;o de projetos personalizados at&eacute; a execu&ccedil;&atilde;o de grandes obras, sempre com foco na inova&ccedil;&atilde;o, sustentabilidade e seguran&ccedil;a. Com uma equipe experiente e dedicada, a EZ Engenharia se tornou uma refer&ecirc;ncia na constru&ccedil;&atilde;o civil, atendendo com efici&ecirc;ncia as necessidades dos seus clientes.</p>\r\n<p>A EZ Engenharia atua em diversos segmentos, oferecendo solu&ccedil;&otilde;es abrangentes que cobrem todas as etapas de um projeto de constru&ccedil;&atilde;o. Um dos grandes diferenciais da empresa &eacute; seu compromisso com a personaliza&ccedil;&atilde;o dos servi&ccedil;os. Cada cliente recebe um atendimento exclusivo, onde suas necessidades e expectativas s&atilde;o levadas em considera&ccedil;&atilde;o desde o planejamento inicial at&eacute; a entrega final da obra.</p>\r\n<p>Os servi&ccedil;os da EZ Engenharia incluem projetos de constru&ccedil;&atilde;o, execu&ccedil;&atilde;o de obras e regulariza&ccedil;&atilde;o de im&oacute;veis. A empresa tamb&eacute;m &eacute; especialista na instala&ccedil;&atilde;o de estruturas de solo, com foco em projetos de usinas solares e outras infraestruturas voltadas &agrave; sustentabilidade. Ao todo, a empresa j&aacute; desenvolveu mais de 116 projetos, com uma &aacute;rea constru&iacute;da de mais de 3.861 m&sup2;, demonstrando seu amplo conhecimento t&eacute;cnico e capacidade de entrega em diferentes tipos de obras.</p>\r\n<p>Uma das caracter&iacute;sticas mais elogiadas pelos clientes da EZ Engenharia &eacute; a transpar&ecirc;ncia. O or&ccedil;amento das obras &eacute; detalhado etapa por etapa, permitindo que os clientes acompanhem todos os custos envolvidos, da funda&ccedil;&atilde;o ao acabamento. Esse n&iacute;vel de precis&atilde;o &eacute; um dos motivos pelos quais a empresa conquistou a confian&ccedil;a de seus clientes, que destacam a honestidade e o profissionalismo da equipe em suas avalia&ccedil;&otilde;es. A EZ Engenharia tamb&eacute;m se preocupa com a sustentabilidade em seus projetos, sempre considerando o impacto ambiental de suas obras e adotando pr&aacute;ticas que minimizem os efeitos negativos no meio ambiente.</p>\r\n<p>Al&eacute;m da transpar&ecirc;ncia e da qualidade, a empresa se destaca pela agilidade. Com uma equipe &aacute;gil e altamente capacitada, a EZ Engenharia consegue concluir os projetos dentro do cronograma, evitando atrasos e mantendo um alto padr&atilde;o de execu&ccedil;&atilde;o. A satisfa&ccedil;&atilde;o dos clientes &eacute; refletida nas in&uacute;meras avalia&ccedil;&otilde;es positivas recebidas, onde elogiam o atendimento, a efici&ecirc;ncia e o compromisso da equipe.</p>\r\n<p>Em Cascavel e regi&atilde;o, a EZ Engenharia &eacute; sin&ocirc;nimo de excel&ecirc;ncia em constru&ccedil;&atilde;o. Com uma vis&atilde;o voltada para o futuro e um foco constante em inova&ccedil;&atilde;o, a empresa continua a se consolidar como uma das principais refer&ecirc;ncias no setor de engenharia e constru&ccedil;&atilde;o civil. Seu compromisso com a integridade e a qualidade &eacute; evidenciado em cada projeto realizado, seja uma pequena reforma ou uma grande obra industrial.</p>\r\n<p>Se voc&ecirc; est&aacute; procurando uma empresa de engenharia e constru&ccedil;&atilde;o em Cascavel que ofere&ccedil;a qualidade, transpar&ecirc;ncia e inova&ccedil;&atilde;o, a EZ Engenharia &eacute; a escolha certa. Com uma equipe experiente, atendimento personalizado e foco em solu&ccedil;&otilde;es eficientes e sustent&aacute;veis, a EZ Engenharia se compromete a transformar seus projetos em realidade, garantindo a sua total satisfa&ccedil;&atilde;o. A empresa &eacute; mais do que uma construtora, &eacute; uma parceira que trabalha para garantir que seus sonhos saiam do papel e se concretizem de maneira segura e eficiente. Entre em contato hoje mesmo e descubra como a EZ Engenharia pode ajudar no seu pr&oacute;ximo&nbsp;projeto!</p>', 'conheca a ez engenharia – excelencia em construcao e engenharia em cascavel-202410221518.png', '2024-10-22 15:18:23', '2019-09-02 15:16:00', '', 'conheca-a-ez-engenharia-', 1, 0, 4, 0, 1),
(27, 'Projetos Elétricos: Desafios e Soluções com a EZ Engenharia', '<h3 data-pm-slice=\"1 1 []\">Projetos El&eacute;tricos: Desafios e Solu&ccedil;&otilde;es com a EZ Engenharia</h3>\r\n<p>Os projetos el&eacute;tricos s&atilde;o essenciais para garantir a efici&ecirc;ncia, a seguran&ccedil;a e a conformidade t&eacute;cnica de qualquer obra. Desde a concep&ccedil;&atilde;o at&eacute; a execu&ccedil;&atilde;o, cada etapa demanda conhecimento especializado e uma equipe capacitada para enfrentar os desafios espec&iacute;ficos que surgem ao longo do processo. A EZ Engenharia se destaca como construtora em Cascavel PR, oferecendo solu&ccedil;&otilde;es completas em projetos el&eacute;tricos, desde o planejamento at&eacute; a entrega final, sempre com um time de engenheiros altamente qualificados e m&atilde;o de obra especializada.</p>\r\n<p>A primeira etapa de qualquer projeto el&eacute;trico realizado pela EZ Engenharia come&ccedil;a com um levantamento detalhado das necessidades da obra. Nessa fase, nossos profissionais consideram n&atilde;o apenas as especificidades do empreendimento, mas tamb&eacute;m as normas t&eacute;cnicas vigentes e os requisitos legais aplic&aacute;veis. Como construtora em Cascavel PR, a EZ Engenharia garante que cada detalhe do projeto esteja de acordo com as regulamenta&ccedil;&otilde;es, oferecendo um planejamento robusto e seguro para edifica&ccedil;&otilde;es residenciais, comerciais e industriais.</p>\r\n<p>Durante a fase de execu&ccedil;&atilde;o, surgem desafios que demandam habilidade t&eacute;cnica e experi&ecirc;ncia. Problemas como a incompatibilidade de instala&ccedil;&otilde;es, adequa&ccedil;&otilde;es em tempo real e a gest&atilde;o de recursos s&atilde;o comuns, e &eacute; aqui que a expertise da EZ Engenharia como construtora em Cascavel PR faz a diferen&ccedil;a. Nosso time de engenheiros atua em parceria com os eletricistas, garantindo que cada etapa seja executada conforme o projeto inicial, minimizando falhas e otimizando o uso dos recursos.</p>\r\n<p>Um dos grandes diferenciais da EZ Engenharia &eacute; a capacidade de prever problemas antes mesmo de sua ocorr&ecirc;ncia. Durante o processo de planejamento, utilizamos ferramentas avan&ccedil;adas de simula&ccedil;&atilde;o e an&aacute;lise de carga el&eacute;trica, evitando assim sobrecargas e garantindo a efici&ecirc;ncia energ&eacute;tica. A experi&ecirc;ncia consolidada como construtora em Cascavel PR nos permite aplicar solu&ccedil;&otilde;es pr&aacute;ticas e inovadoras, reduzindo custos e mantendo a qualidade das instala&ccedil;&otilde;es el&eacute;tricas.</p>\r\n<p>A manuten&ccedil;&atilde;o e o acompanhamento p&oacute;s-obra s&atilde;o etapas fundamentais para garantir a longevidade e o bom funcionamento das instala&ccedil;&otilde;es el&eacute;tricas. A EZ Engenharia, como construtora em Cascavel PR, oferece suporte t&eacute;cnico cont&iacute;nuo, realizando inspe&ccedil;&otilde;es peri&oacute;dicas e oferecendo solu&ccedil;&otilde;es r&aacute;pidas para eventuais problemas. Essa abordagem garante a satisfa&ccedil;&atilde;o dos clientes e contribui para a preserva&ccedil;&atilde;o dos sistemas el&eacute;tricos ao longo do tempo.</p>\r\n<p>Por fim, a busca constante por inova&ccedil;&otilde;es tecnol&oacute;gicas tamb&eacute;m faz parte do compromisso da EZ Engenharia. Utilizando recursos modernos e atualizados, nossos projetos se destacam pela efici&ecirc;ncia e sustentabilidade. Como construtora em Cascavel PR, estamos sempre atentos &agrave;s novas demandas do mercado, garantindo que nossos clientes tenham acesso &agrave;s melhores pr&aacute;ticas em engenharia el&eacute;trica e garantindo a excel&ecirc;ncia em todas as etapas do processo.</p>', 'projetos eletricos desafios e solucoes com a ez engenharia-202505191647.png', '2025-05-19 16:31:45', '2020-02-03 16:11:00', '', 'projetos-eletricos-desafios-e-solucoes-com-a-ez-engenharia', 1, 0, 4, 0, 2),
(28, 'Projetos Estruturais: Planejamento, Execução e a Excelência Técnica da EZ Engenharia', '<h3 class=\"\" data-start=\"244\" data-end=\"332\">Projetos Estruturais: Planejamento, Execu&ccedil;&atilde;o e a Excel&ecirc;ncia T&eacute;cnica da EZ Engenharia</h3>\r\n<p class=\"\" data-start=\"334\" data-end=\"1013\">Os projetos estruturais s&atilde;o a espinha dorsal de qualquer edifica&ccedil;&atilde;o, determinando a estabilidade, a seguran&ccedil;a e a durabilidade da constru&ccedil;&atilde;o. Cada detalhe estrutural precisa ser pensado para suportar as cargas atuantes ao longo do tempo, levando em conta fatores como peso pr&oacute;prio, sobrecarga de uso, a&ccedil;&atilde;o do vento, sismos e poss&iacute;veis recalques do solo. A EZ Engenharia atua como refer&ecirc;ncia em solu&ccedil;&otilde;es completas nesse segmento, consolidando-se como <strong data-start=\"784\" data-end=\"814\">construtora em Cascavel PR</strong>. A empresa investe em tecnologia, conhecimento t&eacute;cnico e capacita&ccedil;&atilde;o de sua equipe para entregar projetos estruturais eficientes, econ&ocirc;micos e seguros para os mais variados tipos de empreendimentos.</p>\r\n<p class=\"\" data-start=\"1015\" data-end=\"1692\">A fase de concep&ccedil;&atilde;o estrutural &eacute; uma das mais importantes. Nela, os engenheiros civis da EZ Engenharia analisam o tipo de edifica&ccedil;&atilde;o, seu uso, o sistema construtivo ideal (alvenaria estrutural, concreto armado, protendido ou met&aacute;lico) e a viabilidade t&eacute;cnica frente &agrave;s condi&ccedil;&otilde;es do terreno. Como <strong data-start=\"1311\" data-end=\"1341\">construtora em Cascavel PR</strong>, a EZ aplica metodologias modernas como BIM (Modelagem da Informa&ccedil;&atilde;o da Constru&ccedil;&atilde;o) e softwares de c&aacute;lculo estrutural para garantir precis&atilde;o e antecipar interfer&ecirc;ncias entre os projetos complementares. Essa integra&ccedil;&atilde;o entre os setores &eacute; fundamental para evitar retrabalhos, economizar recursos e garantir seguran&ccedil;a desde as funda&ccedil;&otilde;es at&eacute; a cobertura.</p>\r\n<p class=\"\" data-start=\"1694\" data-end=\"2312\">Durante a execu&ccedil;&atilde;o das estruturas, surgem in&uacute;meros desafios t&eacute;cnicos. Desvios nas dimens&otilde;es do terreno, diferen&ccedil;as entre os projetos arquitet&ocirc;nico e estrutural, controle de qualidade do concreto, formas, armaduras e prazos apertados s&atilde;o apenas alguns dos pontos cr&iacute;ticos. A atua&ccedil;&atilde;o da EZ Engenharia, como <strong data-start=\"1999\" data-end=\"2029\">construtora em Cascavel PR</strong>, &eacute; pautada por r&iacute;gidos processos de controle de qualidade, fiscaliza&ccedil;&atilde;o di&aacute;ria da obra e um fluxo cont&iacute;nuo de comunica&ccedil;&atilde;o entre os engenheiros de projeto e o time de campo. Essa sinergia permite respostas r&aacute;pidas a problemas e garante que a obra seja executada conforme o planejado.</p>\r\n<p class=\"\" data-start=\"2314\" data-end=\"2949\">Outra dificuldade recorrente em projetos estruturais est&aacute; na compatibiliza&ccedil;&atilde;o com as instala&ccedil;&otilde;es el&eacute;tricas, hidr&aacute;ulicas e sanit&aacute;rias. Interfer&ecirc;ncias entre vigas e tubula&ccedil;&otilde;es, shafts mal posicionados e passagens de dutos comprometem o desempenho estrutural e funcional da obra. A EZ Engenharia trabalha de forma integrada entre os setores, adotando solu&ccedil;&otilde;es como rebaixos estruturais planejados, uso de materiais alternativos (como lajes nervuradas ou treli&ccedil;adas) e reuni&otilde;es multidisciplinares entre os projetistas. Essa atua&ccedil;&atilde;o colaborativa refor&ccedil;a o compromisso da EZ como <strong data-start=\"2888\" data-end=\"2918\">construtora em Cascavel PR</strong>, voltada &agrave; excel&ecirc;ncia t&eacute;cnica.</p>\r\n<p class=\"\" data-start=\"2951\" data-end=\"3482\">A entrega de um projeto estrutural n&atilde;o se encerra na execu&ccedil;&atilde;o. A fase de p&oacute;s-obra tamb&eacute;m &eacute; essencial para garantir a durabilidade da estrutura ao longo dos anos. A EZ Engenharia realiza vistorias t&eacute;cnicas, elabora manuais de manuten&ccedil;&atilde;o e orienta os clientes quanto &agrave;s boas pr&aacute;ticas de uso da edifica&ccedil;&atilde;o. Como <strong data-start=\"3260\" data-end=\"3290\">construtora em Cascavel PR</strong>, a empresa prioriza a qualidade em todas as etapas, monitorando patologias estruturais, como fissuras e infiltra&ccedil;&otilde;es, e propondo solu&ccedil;&otilde;es imediatas para preservar a integridade da edifica&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"3484\" data-end=\"4004\">Por fim, o investimento cont&iacute;nuo em inova&ccedil;&atilde;o, forma&ccedil;&atilde;o t&eacute;cnica e responsabilidade estrutural diferencia a EZ Engenharia no mercado. Com uma equipe especializada, processos estruturados e uma postura &eacute;tica, a empresa reafirma seu papel como <strong data-start=\"3724\" data-end=\"3754\">construtora em Cascavel PR</strong> que entrega mais do que obras: entrega seguran&ccedil;a, durabilidade e confian&ccedil;a. Em um cen&aacute;rio onde a engenharia precisa ser cada vez mais precisa, a EZ Engenharia segue transformando projetos em estruturas s&oacute;lidas, eficientes e preparadas para o futuro.</p>', 'projetos estruturais planejamento execucao e a excelencia tecnica da ez engenharia-202505191703.png', '2025-05-19 16:52:55', '2019-12-02 16:52:00', '', 'projetos-estruturais-planejamento-execucao-e-a-excelencia-tecnica-da-ez-engenharia', 1, 0, 4, 0, 1),
(29, 'Projetos Hidráulicos e Hidrossanitários: Planejamento, Execução e a Excelência Técnica da EZ Engenharia', '<p class=\"\" data-start=\"227\" data-end=\"334\"><strong data-start=\"227\" data-end=\"334\">Projetos Hidr&aacute;ulicos e Hidrossanit&aacute;rios: Planejamento, Execu&ccedil;&atilde;o e a Excel&ecirc;ncia T&eacute;cnica da EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"336\" data-end=\"923\">Os projetos hidr&aacute;ulicos e hidrossanit&aacute;rios s&atilde;o fundamentais para o funcionamento pleno e sustent&aacute;vel de qualquer edifica&ccedil;&atilde;o. Eles garantem o abastecimento de &aacute;gua, o correto escoamento de efluentes e o aproveitamento racional dos recursos h&iacute;dricos. Um projeto bem elaborado evita desperd&iacute;cios, infiltra&ccedil;&otilde;es, entupimentos e demais problemas que podem comprometer a seguran&ccedil;a e o conforto dos usu&aacute;rios. A EZ Engenharia atua como refer&ecirc;ncia nesse segmento, destacando-se como construtora em Cascavel PR pela excel&ecirc;ncia t&eacute;cnica, precis&atilde;o e compromisso com solu&ccedil;&otilde;es sustent&aacute;veis e eficientes.</p>\r\n<p class=\"\" data-start=\"925\" data-end=\"1590\">A fase de planejamento dos projetos hidr&aacute;ulicos e hidrossanit&aacute;rios &eacute; decisiva para o sucesso da obra. Os engenheiros da EZ Engenharia analisam detalhadamente o tipo de edifica&ccedil;&atilde;o, o n&uacute;mero de usu&aacute;rios, a press&atilde;o e vaz&atilde;o ideais para cada ponto de consumo, bem como a compatibilidade com os sistemas de abastecimento p&uacute;blico ou alternativo (po&ccedil;os, cisternas e reaproveitamento de &aacute;guas pluviais). Como construtora em Cascavel PR, a EZ utiliza softwares espec&iacute;ficos e metodologias modernas que permitem prever interfer&ecirc;ncias, dimensionar corretamente tubula&ccedil;&otilde;es e definir o melhor trajeto para redes de &aacute;gua fria, quente, esgoto, &aacute;guas pluviais e ventila&ccedil;&atilde;o sanit&aacute;ria.</p>\r\n<p class=\"\" data-start=\"1592\" data-end=\"2203\">Durante a execu&ccedil;&atilde;o dos sistemas hidr&aacute;ulicos, muitos desafios t&eacute;cnicos surgem. A correta loca&ccedil;&atilde;o dos pontos, o alinhamento das tubula&ccedil;&otilde;es, o uso de materiais compat&iacute;veis e o respeito &agrave;s normas t&eacute;cnicas s&atilde;o aspectos que exigem aten&ccedil;&atilde;o constante. A EZ Engenharia adota pr&aacute;ticas rigorosas de fiscaliza&ccedil;&atilde;o em campo, garantindo que as instala&ccedil;&otilde;es sejam executadas conforme o projeto, evitando improvisa&ccedil;&otilde;es que podem gerar vazamentos, ru&iacute;dos hidr&aacute;ulicos e falhas de desempenho. Essa postura consolidada refor&ccedil;a o papel da EZ como construtora em Cascavel PR focada na qualidade e durabilidade das solu&ccedil;&otilde;es implantadas.</p>\r\n<p class=\"\" data-start=\"2205\" data-end=\"2782\">Outro ponto de aten&ccedil;&atilde;o est&aacute; na compatibiliza&ccedil;&atilde;o dos projetos hidr&aacute;ulicos com as demais disciplinas da obra. A EZ Engenharia trabalha de forma integrada com os setores de arquitetura, estrutura e el&eacute;trica, garantindo que n&atilde;o haja conflitos entre tubula&ccedil;&otilde;es, elementos estruturais e acabamentos. Solu&ccedil;&otilde;es como shafts bem posicionados, uso de registros de f&aacute;cil acesso e sistemas de esgoto com ventila&ccedil;&atilde;o adequada s&atilde;o planejadas com anteced&ecirc;ncia. Esse cuidado t&eacute;cnico evita retrabalhos, reduz custos e assegura que os sistemas funcionem com efici&ecirc;ncia desde o primeiro dia de uso.</p>\r\n<p class=\"\" data-start=\"2784\" data-end=\"3295\">A atua&ccedil;&atilde;o da EZ Engenharia n&atilde;o termina com a entrega da obra. Como construtora em Cascavel PR, a empresa realiza inspe&ccedil;&otilde;es p&oacute;s-obra, orienta os clientes sobre manuten&ccedil;&otilde;es preventivas e fornece manuais completos de uso dos sistemas hidr&aacute;ulicos. Al&eacute;m disso, identifica e corrige poss&iacute;veis patologias como infiltra&ccedil;&otilde;es, obstru&ccedil;&otilde;es ou falhas de veda&ccedil;&atilde;o, sempre com agilidade e responsabilidade t&eacute;cnica. Esse acompanhamento cont&iacute;nuo assegura a longevidade das instala&ccedil;&otilde;es e o conforto dos usu&aacute;rios ao longo do tempo.</p>\r\n<p class=\"\" data-start=\"3297\" data-end=\"3782\">Por fim, o diferencial da EZ Engenharia est&aacute; no seu compromisso com a inova&ccedil;&atilde;o, a sustentabilidade e a excel&ecirc;ncia t&eacute;cnica. Investindo em capacita&ccedil;&atilde;o constante, novas tecnologias e boas pr&aacute;ticas de engenharia, a empresa se consolida como refer&ecirc;ncia no desenvolvimento e execu&ccedil;&atilde;o de projetos hidr&aacute;ulicos e hidrossanit&aacute;rios. Mais do que apenas construir, a EZ Engenharia entrega funcionalidade, conforto e seguran&ccedil;a h&iacute;drica &mdash; elementos indispens&aacute;veis para qualquer empreendimento moderno.</p>', 'projetos hidraulicos e hidrossanitarios planejamento execucao e a excelencia tecnica da ez engenharia-202505191723.png', '2025-05-19 17:22:08', '2020-03-02 17:21:00', '', 'projetos-hidraulicos-e-hidrossanitarios-planejamento-execucao-e-a-excelencia-tecnica-da-ez-engenharia', 1, 0, 4, 0, 1),
(30, 'Projetos Arquitetônicos: Criatividade, Funcionalidade e a Excelência Técnica da EZ Engenharia', '<p class=\"\" data-start=\"186\" data-end=\"283\"><strong data-start=\"186\" data-end=\"283\">Projetos Arquitet&ocirc;nicos: Criatividade, Funcionalidade e a Excel&ecirc;ncia T&eacute;cnica da EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"285\" data-end=\"802\">Os projetos arquitet&ocirc;nicos s&atilde;o o ponto de partida para qualquer constru&ccedil;&atilde;o, combinando est&eacute;tica, funcionalidade e viabilidade t&eacute;cnica. S&atilde;o eles que definem os espa&ccedil;os, traduzem necessidades em formas e integram os aspectos visuais e operacionais de uma edifica&ccedil;&atilde;o. A EZ Engenharia se destaca como construtora em Cascavel PR por transformar ideias em projetos arquitet&ocirc;nicos inteligentes, otimizados e alinhados com os objetivos dos clientes &mdash; seja para resid&ecirc;ncias, com&eacute;rcios, ind&uacute;strias ou empreendimentos especiais.</p>\r\n<p class=\"\" data-start=\"804\" data-end=\"1418\">Durante a fase de concep&ccedil;&atilde;o arquitet&ocirc;nica, os profissionais da EZ Engenharia trabalham com foco na personaliza&ccedil;&atilde;o do projeto, respeitando o perfil do cliente, o uso pretendido e as caracter&iacute;sticas do terreno. Ilumina&ccedil;&atilde;o natural, ventila&ccedil;&atilde;o cruzada, acessibilidade, conforto t&eacute;rmico e efici&ecirc;ncia no uso dos espa&ccedil;os s&atilde;o prioridades desde o in&iacute;cio. Como construtora em Cascavel PR, a EZ alia criatividade e t&eacute;cnica, aplicando metodologias como o BIM (Modelagem da Informa&ccedil;&atilde;o da Constru&ccedil;&atilde;o) e ferramentas de visualiza&ccedil;&atilde;o em 3D para proporcionar uma experi&ecirc;ncia clara e assertiva ao cliente antes mesmo da obra come&ccedil;ar.</p>\r\n<p class=\"\" data-start=\"1420\" data-end=\"1965\">A etapa de desenvolvimento do projeto envolve a defini&ccedil;&atilde;o precisa de cada ambiente: medidas, materiais, acabamentos, disposi&ccedil;&otilde;es de portas e janelas, integra&ccedil;&atilde;o entre &aacute;reas e aproveitamento de cada metro quadrado. A EZ Engenharia adota um processo colaborativo entre arquitetos, engenheiros e consultores t&eacute;cnicos para garantir que o projeto arquitet&ocirc;nico seja vi&aacute;vel, seguro e compat&iacute;vel com os demais projetos complementares. Essa integra&ccedil;&atilde;o evita incompatibilidades e retrabalhos durante a obra, otimizando o or&ccedil;amento e os prazos de entrega.</p>\r\n<p class=\"\" data-start=\"1967\" data-end=\"2528\">Na execu&ccedil;&atilde;o da obra, o projeto arquitet&ocirc;nico funciona como guia essencial. &Eacute; a partir dele que os espa&ccedil;os ganham forma, os acabamentos s&atilde;o definidos e o resultado final come&ccedil;a a se materializar. A EZ Engenharia atua com fiscaliza&ccedil;&atilde;o t&eacute;cnica rigorosa, garantindo que a execu&ccedil;&atilde;o seja fiel ao projeto aprovado, respeitando padr&otilde;es de qualidade e especifica&ccedil;&otilde;es t&eacute;cnicas. Como construtora em Cascavel PR, a EZ mant&eacute;m uma comunica&ccedil;&atilde;o constante com o cliente, possibilitando ajustes quando necess&aacute;rio e assegurando que cada detalhe seja entregue conforme o planejado.</p>\r\n<p class=\"\" data-start=\"2530\" data-end=\"2946\">Al&eacute;m da est&eacute;tica, os projetos arquitet&ocirc;nicos precisam atender a uma s&eacute;rie de normas t&eacute;cnicas, legisla&ccedil;&otilde;es urban&iacute;sticas, diretrizes ambientais e exig&ecirc;ncias de acessibilidade. A equipe da EZ Engenharia domina essas regulamenta&ccedil;&otilde;es e atua com responsabilidade t&eacute;cnica para garantir que o projeto seja legalizado sem surpresas, aprovado junto aos &oacute;rg&atilde;os competentes e compat&iacute;vel com o zoneamento e as restri&ccedil;&otilde;es do lote.</p>\r\n<p class=\"\" data-start=\"2948\" data-end=\"3533\">Por fim, a EZ Engenharia acredita que um bom projeto arquitet&ocirc;nico vai al&eacute;m do visual &mdash; ele precisa ser inteligente, funcional, adapt&aacute;vel ao longo do tempo e proporcionar bem-estar a quem utiliza o espa&ccedil;o. Esse compromisso com a excel&ecirc;ncia, somado &agrave; experi&ecirc;ncia pr&aacute;tica de quem tamb&eacute;m executa as obras, coloca a EZ como refer&ecirc;ncia em projetos arquitet&ocirc;nicos em Cascavel PR. Com uma equipe multidisciplinar e foco na satisfa&ccedil;&atilde;o do cliente, a empresa entrega mais do que projetos: entrega solu&ccedil;&otilde;es completas que transformam sonhos em espa&ccedil;os reais, com beleza, efici&ecirc;ncia e durabilidade.</p>', 'projetos arquitetonicos criatividade funcionalidade e a excelencia tecnica da ez engenharia-202505191727.png', '2025-05-19 17:25:45', '2019-11-04 17:25:00', '', 'projetos-arquitetonicos-criatividade-funcionalidade-e-a-excelencia-tecnica-da-ez-engenharia', 1, 0, 4, 0, 1),
(31, 'Execução de Obras: Planejamento, Organização e Compromisso com a Qualidade na EZ Engenharia', '<p class=\"\" data-start=\"343\" data-end=\"438\"><strong data-start=\"343\" data-end=\"438\">Execu&ccedil;&atilde;o de Obras: Planejamento, Organiza&ccedil;&atilde;o e Compromisso com a Qualidade na EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"440\" data-end=\"872\">A execu&ccedil;&atilde;o de uma obra &eacute; o momento onde o projeto ganha vida e cada detalhe planejado se transforma em realidade. &Eacute; tamb&eacute;m onde surgem os maiores desafios: cumprir prazos, manter a qualidade, controlar os custos e coordenar equipes. A EZ Engenharia, como construtora em Cascavel PR, atua com excel&ecirc;ncia em todas as etapas da execu&ccedil;&atilde;o, garantindo que cada obra seja realizada com efici&ecirc;ncia, seguran&ccedil;a e dentro do or&ccedil;amento previsto.</p>\r\n<p class=\"\" data-start=\"874\" data-end=\"1415\">O in&iacute;cio da obra &eacute; uma fase cr&iacute;tica e decisiva. A EZ Engenharia inicia cada constru&ccedil;&atilde;o com um planejamento detalhado, que envolve a an&aacute;lise do cronograma f&iacute;sico-financeiro, levantamento de materiais, defini&ccedil;&atilde;o de frentes de servi&ccedil;o e log&iacute;stica de canteiro. Essa prepara&ccedil;&atilde;o antecipada evita atrasos e desperd&iacute;cios, permitindo um fluxo de trabalho cont&iacute;nuo e organizado desde os primeiros dias. A mobiliza&ccedil;&atilde;o da equipe &eacute; feita com foco na produtividade, e todos os envolvidos recebem orienta&ccedil;&otilde;es claras sobre metas, etapas e responsabilidades.</p>\r\n<p class=\"\" data-start=\"1417\" data-end=\"1953\">O gerenciamento de tempo e de pessoas &eacute; um dos diferenciais da EZ Engenharia. Cada obra conta com engenheiros e mestres de obras experientes, que acompanham diariamente a evolu&ccedil;&atilde;o dos servi&ccedil;os. A aloca&ccedil;&atilde;o estrat&eacute;gica de m&atilde;o de obra, o controle do avan&ccedil;o f&iacute;sico e as reuni&otilde;es semanais de acompanhamento garantem que o cronograma seja cumprido com precis&atilde;o. Como construtora em Cascavel PR, a EZ prioriza a comunica&ccedil;&atilde;o transparente entre a equipe t&eacute;cnica, os fornecedores e o cliente, o que permite decis&otilde;es r&aacute;pidas e assertivas em campo.</p>\r\n<p class=\"\" data-start=\"1955\" data-end=\"2462\">A limpeza e organiza&ccedil;&atilde;o do canteiro de obras tamb&eacute;m fazem parte do padr&atilde;o de qualidade da EZ Engenharia. Um ambiente limpo e bem estruturado aumenta a seguran&ccedil;a dos trabalhadores, evita acidentes e melhora a produtividade. A empresa segue normas r&iacute;gidas quanto &agrave; destina&ccedil;&atilde;o correta de res&iacute;duos, separa&ccedil;&atilde;o de materiais e manuten&ccedil;&atilde;o de &aacute;reas de circula&ccedil;&atilde;o desobstru&iacute;das. Isso demonstra o compromisso da EZ n&atilde;o apenas com a obra, mas tamb&eacute;m com o meio ambiente e com a valoriza&ccedil;&atilde;o dos profissionais envolvidos.</p>\r\n<p class=\"\" data-start=\"2464\" data-end=\"3052\">Manter a obra dentro do or&ccedil;amento &eacute; um desafio constante, e a EZ Engenharia trata isso com m&aacute;xima seriedade. A empresa realiza o controle rigoroso de insumos, negocia com fornecedores homologados e evita desperd&iacute;cios atrav&eacute;s do uso consciente de materiais e da padroniza&ccedil;&atilde;o de processos. Al&eacute;m disso, qualquer altera&ccedil;&atilde;o no escopo &eacute; previamente analisada com base no impacto financeiro, assegurando que o cliente tenha total visibilidade dos custos envolvidos. Como construtora em Cascavel PR, a EZ se destaca por sua transpar&ecirc;ncia e compromisso com a viabilidade econ&ocirc;mica de cada projeto.</p>\r\n<p class=\"\" data-start=\"3054\" data-end=\"3575\">Executar uma obra com excel&ecirc;ncia vai al&eacute;m de levantar paredes &mdash; &eacute; coordenar pessoas, gerir recursos, respeitar prazos e entregar resultados acima das expectativas. A EZ Engenharia, com sua metodologia estruturada e equipe capacitada, reafirma sua posi&ccedil;&atilde;o como refer&ecirc;ncia em obras civis em Cascavel PR. Cada constru&ccedil;&atilde;o &eacute; encarada como um compromisso com a qualidade, a seguran&ccedil;a e a confian&ccedil;a do cliente. E &eacute; essa dedica&ccedil;&atilde;o que faz da EZ muito mais do que uma construtora: uma parceira na realiza&ccedil;&atilde;o de grandes conquistas.</p>', 'execucao de obras planejamento organizacao e compromisso com a qualidade na ez engenharia-202505191734.png', '2025-05-19 17:32:55', '2020-04-06 17:32:00', '', 'execucao-de-obras-planejamento-organizacao-e-compromisso-com-a-qualidade-na-ez-engenharia', 1, 0, 4, 0, 1),
(32, 'Concreto e Ferragem: A Base da Estrutura com a Qualidade da EZ Engenharia', '<p class=\"\" data-start=\"341\" data-end=\"418\"><strong data-start=\"341\" data-end=\"418\">Concreto e Ferragem: A Base da Estrutura com a Qualidade da EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"420\" data-end=\"1095\">Na constru&ccedil;&atilde;o civil, o concreto &eacute; um dos materiais mais importantes. Ele est&aacute; presente nas funda&ccedil;&otilde;es, pilares, vigas, lajes e em quase todos os elementos estruturais de uma edifica&ccedil;&atilde;o. Mas o que muitas pessoas n&atilde;o sabem &eacute; que, por si s&oacute;, o concreto n&atilde;o &eacute; suficiente para garantir a resist&ecirc;ncia necess&aacute;ria &agrave; estrutura. &Eacute; por isso que utilizamos ferragens (tamb&eacute;m chamadas de armaduras) dentro dele &mdash; uma combina&ccedil;&atilde;o que d&aacute; origem ao <strong data-start=\"851\" data-end=\"870\">concreto armado</strong>, tecnologia fundamental em qualquer obra moderna. Na EZ Engenharia, cada etapa da produ&ccedil;&atilde;o e aplica&ccedil;&atilde;o do concreto segue padr&otilde;es rigorosos, garantindo seguran&ccedil;a e durabilidade para os nossos clientes em Cascavel PR e regi&atilde;o.</p>\r\n<p class=\"\" data-start=\"1097\" data-end=\"1758\">A fabrica&ccedil;&atilde;o do concreto come&ccedil;a com a mistura de quatro componentes principais: <strong data-start=\"1177\" data-end=\"1209\">cimento, areia, brita e &aacute;gua</strong>. Cada ingrediente tem sua fun&ccedil;&atilde;o: o cimento age como ligante, a areia preenche os espa&ccedil;os menores, a brita d&aacute; resist&ecirc;ncia ao volume e a &aacute;gua ativa o processo de cura (endurecimento). A propor&ccedil;&atilde;o correta entre esses materiais &eacute; essencial. Um erro de dosagem pode resultar em concreto fraco, poroso ou propenso a fissuras. Como construtora em Cascavel PR, a EZ Engenharia realiza esse controle com precis&atilde;o, seja utilizando concreto usinado (feito em centrais dosadoras) ou produzido diretamente no canteiro, sempre com ensaios e testes de qualidade.</p>\r\n<p class=\"\" data-start=\"1760\" data-end=\"2332\">Mas por que usamos ferragens dentro do concreto? A resposta est&aacute; na natureza do material. O concreto &eacute; muito resistente &agrave; compress&atilde;o (quando ele &eacute; apertado), mas tem baixa resist&ecirc;ncia &agrave; tra&ccedil;&atilde;o (quando ele &eacute; esticado ou dobrado). J&aacute; o a&ccedil;o das ferragens tem justamente a propriedade contr&aacute;ria: &eacute; excelente para resistir &agrave; tra&ccedil;&atilde;o. Quando unimos os dois &mdash; concreto e a&ccedil;o &mdash; temos o <strong data-start=\"2137\" data-end=\"2156\">concreto armado</strong>, que combina o melhor dos dois mundos. Isso permite que pilares, vigas e lajes suportem cargas pesadas, ventos fortes, movimenta&ccedil;&otilde;es do solo e outras tens&otilde;es sem sofrer danos.</p>\r\n<p class=\"\" data-start=\"2334\" data-end=\"2842\">Na pr&aacute;tica, isso significa que cada estrutura &eacute; cuidadosamente dimensionada pelos engenheiros da EZ Engenharia, que calculam a quantidade e o posicionamento ideal das ferragens de acordo com as cargas previstas para aquela edifica&ccedil;&atilde;o. As armaduras s&atilde;o cortadas, dobradas e amarradas com precis&atilde;o, de acordo com o projeto estrutural. Depois, s&atilde;o colocadas nas formas (molde de madeira ou met&aacute;lico), e o concreto &eacute; lan&ccedil;ado com vibra&ccedil;&atilde;o mec&acirc;nica para eliminar bolhas e garantir a ader&ecirc;ncia entre a&ccedil;o e concreto.</p>\r\n<p class=\"\" data-start=\"2844\" data-end=\"3146\">Al&eacute;m disso, a EZ Engenharia segue r&iacute;gidos processos de <strong data-start=\"2899\" data-end=\"2919\">cura do concreto</strong>, fase onde ele precisa permanecer &uacute;mido por v&aacute;rios dias para ganhar resist&ecirc;ncia total. Tamb&eacute;m monitoramos a temperatura, o tempo de pega e a trabalhabilidade do material para assegurar que a estrutura fique uniforme e dur&aacute;vel.</p>\r\n<p class=\"\" data-start=\"3148\" data-end=\"3467\">Com esse cuidado em cada etapa &mdash; da mistura &agrave; execu&ccedil;&atilde;o &mdash;, a EZ Engenharia entrega obras seguras, eficientes e com vida &uacute;til prolongada. Como construtora em Cascavel PR, temos orgulho de transformar materiais como pedra, &aacute;gua e a&ccedil;o em estruturas s&oacute;lidas que sustentam sonhos, investimentos e o futuro de nossos clientes.</p>', 'concreto e ferragem a base da estrutura com a qualidade da ez engenharia-202505191739.png', '2025-05-19 17:37:23', '2020-05-11 17:36:00', '', 'concreto-e-ferragem-a-base-da-estrutura-com-a-qualidade-da-ez-engenharia', 1, 0, 4, 0, 1),
(33, 'Lajes: Funcionalidade, Segurança e Qualidade com a EZ Engenharia', '<p class=\"\" data-start=\"316\" data-end=\"384\"><strong data-start=\"316\" data-end=\"384\">Lajes: Funcionalidade, Seguran&ccedil;a e Qualidade com a EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"386\" data-end=\"837\">A laje &eacute; um dos elementos mais importantes de uma edifica&ccedil;&atilde;o. Respons&aacute;vel por formar os pisos e tetos entre os pavimentos, ela tamb&eacute;m exerce um papel estrutural fundamental, suportando cargas de uso, paredes, equipamentos e at&eacute; reservat&oacute;rios d&rsquo;&aacute;gua. Como construtora em Cascavel PR, a EZ Engenharia projeta e executa lajes com alto padr&atilde;o de qualidade, sempre levando em considera&ccedil;&atilde;o o tipo de obra, as condi&ccedil;&otilde;es do terreno e as exig&ecirc;ncias do cliente.</p>\r\n<p class=\"\" data-start=\"839\" data-end=\"1055\">Existem diversos tipos de lajes, e a escolha adequada depende de fatores como v&atilde;o livre (dist&acirc;ncia entre apoios), carga atuante, est&eacute;tica e custo-benef&iacute;cio. As principais op&ccedil;&otilde;es utilizadas pela EZ Engenharia incluem:</p>\r\n<ul data-start=\"1057\" data-end=\"1979\">\r\n<li class=\"\" data-start=\"1057\" data-end=\"1242\">\r\n<p class=\"\" data-start=\"1059\" data-end=\"1242\"><strong data-start=\"1059\" data-end=\"1074\">Laje maci&ccedil;a</strong>: feita inteiramente de concreto armado, ideal para pequenos v&atilde;os e onde se deseja maior rigidez. &Eacute; bastante comum em resid&ecirc;ncias t&eacute;rreas e estruturas de pequeno porte.</p>\r\n</li>\r\n<li class=\"\" data-start=\"1246\" data-end=\"1451\">\r\n<p class=\"\" data-start=\"1248\" data-end=\"1451\"><strong data-start=\"1248\" data-end=\"1266\">Laje nervurada</strong>: possui nervuras (vigas) moldadas no concreto com preenchimento entre elas (geralmente com isopor ou cubetas pl&aacute;sticas). &Eacute; ideal para vencer grandes v&atilde;os e reduzir o peso da estrutura.</p>\r\n</li>\r\n<li class=\"\" data-start=\"1453\" data-end=\"1722\">\r\n<p class=\"\" data-start=\"1455\" data-end=\"1722\"><strong data-start=\"1455\" data-end=\"1497\">Laje pr&eacute;-moldada com vigotas e lajotas</strong>: amplamente usada em obras residenciais, possui excelente custo-benef&iacute;cio. A EZ Engenharia executa esse sistema com aten&ccedil;&atilde;o especial ao escoramento e ao travamento das pe&ccedil;as, garantindo seguran&ccedil;a e bom desempenho estrutural.</p>\r\n</li>\r\n<li class=\"\" data-start=\"1724\" data-end=\"1979\">\r\n<p class=\"\" data-start=\"1726\" data-end=\"1979\"><strong data-start=\"1726\" data-end=\"1745\">Laje protendida</strong>: utilizada em obras que exigem v&atilde;os muito longos e menor espessura, como galp&otilde;es, edif&iacute;cios comerciais ou industriais. A protens&atilde;o &eacute; uma t&eacute;cnica avan&ccedil;ada que aplica for&ccedil;a ao a&ccedil;o antes da concretagem, aumentando a resist&ecirc;ncia da laje.</p>\r\n</li>\r\n</ul>\r\n<p class=\"\" data-start=\"1981\" data-end=\"2458\">Na EZ Engenharia, o projeto de laje &eacute; feito em conjunto com os demais elementos estruturais (pilares, vigas e funda&ccedil;&otilde;es) para garantir a integridade da edifica&ccedil;&atilde;o como um todo. A defini&ccedil;&atilde;o do tipo de laje, da espessura, da quantidade de armadura e da necessidade de rebaixos (para instala&ccedil;&otilde;es el&eacute;tricas ou hidr&aacute;ulicas) &eacute; realizada com base em c&aacute;lculos estruturais e softwares especializados. Isso evita erros, retrabalhos e garante total compatibilidade com os demais projetos.</p>\r\n<p class=\"\" data-start=\"2460\" data-end=\"2839\">A execu&ccedil;&atilde;o da laje tamb&eacute;m exige aten&ccedil;&atilde;o aos detalhes. A equipe da EZ Engenharia realiza a montagem das armaduras conforme projeto, utiliza formas adequadas, garante o escoramento bem distribu&iacute;do e aplica o concreto com vibra&ccedil;&atilde;o mec&acirc;nica para eliminar falhas e bolhas. Ap&oacute;s a concretagem, &eacute; feito o processo de cura, fundamental para que o concreto alcance a resist&ecirc;ncia esperada.</p>\r\n<p class=\"\" data-start=\"2841\" data-end=\"3246\">Outro cuidado essencial &eacute; com as <strong data-start=\"2874\" data-end=\"2935\">aberturas para escadas, caixas de ar, tubula&ccedil;&otilde;es e shafts</strong>, que precisam estar previstas em projeto. Altera&ccedil;&otilde;es de &uacute;ltima hora podem comprometer a resist&ecirc;ncia da laje e causar s&eacute;rios problemas. Por isso, a EZ Engenharia, como construtora em Cascavel PR, atua com planejamento integrado, evitando improvisos e garantindo que tudo esteja alinhado desde a fase de projeto.</p>\r\n<p class=\"\" data-start=\"3248\" data-end=\"3575\">A escolha certa da laje e sua correta execu&ccedil;&atilde;o impactam diretamente no conforto t&eacute;rmico, no desempenho ac&uacute;stico e na durabilidade da constru&ccedil;&atilde;o. Com uma equipe t&eacute;cnica capacitada, fiscaliza&ccedil;&atilde;o rigorosa e comprometimento com o cliente, a EZ Engenharia entrega obras com estruturas seguras, eficientes e preparadas para o futuro.</p>', 'lajes funcionalidade seguranca e qualidade com a ez engenharia-202505191743.png', '2025-05-19 17:42:02', '2020-05-19 17:40:00', '', 'lajes-funcionalidade-seguranca-e-qualidade-com-a-ez-engenharia', 1, 0, 4, 0, 1),
(34, 'Gerenciamento de Pessoas na Obra: Coordenação, Produtividade e Resultados com a EZ Engenharia', '<p class=\"\" data-start=\"343\" data-end=\"440\"><strong data-start=\"343\" data-end=\"440\">Gerenciamento de Pessoas na Obra: Coordena&ccedil;&atilde;o, Produtividade e Resultados com a EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"442\" data-end=\"952\">Uma obra de qualidade n&atilde;o se constr&oacute;i apenas com bons materiais e projetos bem elaborados. O sucesso de qualquer constru&ccedil;&atilde;o depende diretamente do <strong data-start=\"589\" data-end=\"617\">gerenciamento de pessoas</strong>, que envolve liderar equipes, organizar tarefas, manter a motiva&ccedil;&atilde;o dos colaboradores e garantir que todos atuem de forma segura e produtiva. Como construtora em Cascavel PR, a EZ Engenharia entende que o capital humano &eacute; um dos principais ativos de uma obra &mdash; e por isso adota pr&aacute;ticas modernas de lideran&ccedil;a e organiza&ccedil;&atilde;o de equipes.</p>\r\n<p class=\"\" data-start=\"954\" data-end=\"1394\">Desde o in&iacute;cio do canteiro, a EZ Engenharia define as <strong data-start=\"1008\" data-end=\"1059\">fun&ccedil;&otilde;es e responsabilidades de cada colaborador</strong>, desde mestres de obra, encarregados e pedreiros at&eacute; eletricistas, carpinteiros e auxiliares. Essa clareza evita conflitos, reduz retrabalhos e torna o processo mais eficiente. A defini&ccedil;&atilde;o de metas di&aacute;rias e semanais, aliada a reuni&otilde;es de alinhamento entre engenharia e produ&ccedil;&atilde;o, ajuda a manter o time engajado e ciente dos objetivos.</p>\r\n<p class=\"\" data-start=\"1396\" data-end=\"1791\">Outro ponto-chave do gerenciamento de pessoas na constru&ccedil;&atilde;o civil &eacute; o <strong data-start=\"1466\" data-end=\"1513\">controle do tempo e do rendimento da equipe</strong>. A EZ Engenharia utiliza cronogramas f&iacute;sicos-financeiros para acompanhar o avan&ccedil;o da obra e alocar corretamente a m&atilde;o de obra em cada etapa. Essa gest&atilde;o evita sobrecargas, antecipa gargalos e mant&eacute;m a produtividade constante, mesmo em projetos complexos e com prazos apertados.</p>\r\n<p class=\"\" data-start=\"1793\" data-end=\"2149\">O <strong data-start=\"1795\" data-end=\"1819\">ambiente de trabalho</strong> tamb&eacute;m faz parte da estrat&eacute;gia de lideran&ccedil;a. Limpeza, organiza&ccedil;&atilde;o do canteiro, uso correto de EPIs e cumprimento das normas de seguran&ccedil;a s&atilde;o tratados com seriedade. A EZ Engenharia promove treinamentos, DDSs (Di&aacute;logos Di&aacute;rios de Seguran&ccedil;a) e inspe&ccedil;&otilde;es regulares, garantindo que todos trabalhem com prote&ccedil;&atilde;o, conforto e bem-estar.</p>\r\n<p class=\"\" data-start=\"2151\" data-end=\"2616\">Al&eacute;m disso, o relacionamento interpessoal &eacute; parte fundamental do gerenciamento. Cada obra envolve diferentes perfis profissionais, com diferentes n&iacute;veis de experi&ecirc;ncia. Saber escutar, orientar, reconhecer bons resultados e, quando necess&aacute;rio, corrigir rotas de forma &eacute;tica &eacute; um dos diferenciais da EZ Engenharia como construtora em Cascavel PR. Nossa equipe t&eacute;cnica mant&eacute;m di&aacute;logo aberto com os colaboradores, criando um clima de confian&ccedil;a e coopera&ccedil;&atilde;o no canteiro.</p>\r\n<p class=\"\" data-start=\"2618\" data-end=\"3005\">Por fim, o bom gerenciamento de pessoas resulta diretamente em <strong data-start=\"2681\" data-end=\"2764\">economia de recursos, cumprimento do cronograma e eleva&ccedil;&atilde;o da qualidade da obra</strong>. Com processos bem definidos, lideran&ccedil;a presente e comunica&ccedil;&atilde;o transparente, a EZ Engenharia entrega empreendimentos com excel&ecirc;ncia, respeitando n&atilde;o apenas os prazos e o or&ccedil;amento, mas tamb&eacute;m valorizando quem realmente constr&oacute;i: as pessoas.</p>', 'gerenciamento de pessoas na obra coordenacao produtividade e resultados com a ez engenharia-202505192124.png', '2025-05-19 17:46:11', '2020-06-23 17:45:00', '', 'gerenciamento-de-pessoas-na-obra-coordenacao-produtividade-e-resultados-com-a-ez-engenharia', 1, 0, 4, 0, 2),
(35, 'Orçamento Analítico: Precisão, Economia e Eficiência com a EZ Engenharia', '<p class=\"\" data-start=\"423\" data-end=\"499\"><strong data-start=\"423\" data-end=\"499\">Or&ccedil;amento Anal&iacute;tico: Precis&atilde;o, Economia e Efici&ecirc;ncia com a EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"501\" data-end=\"941\">O or&ccedil;amento anal&iacute;tico &eacute; o ponto de partida para qualquer obra bem-sucedida. Ele vai muito al&eacute;m de uma simples estimativa de custos: trata-se de uma ferramenta t&eacute;cnica que detalha todos os insumos, servi&ccedil;os, etapas construtivas e prazos do projeto. &Eacute; com esse n&iacute;vel de precis&atilde;o que a EZ Engenharia, como construtora em Cascavel PR, garante o controle financeiro da obra e reduz drasticamente os desperd&iacute;cios de recursos ao longo da execu&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"943\" data-end=\"1278\">No or&ccedil;amento anal&iacute;tico, cada item da obra &mdash; da funda&ccedil;&atilde;o ao acabamento &mdash; &eacute; quantificado e valorizado com base em composi&ccedil;&otilde;es de custo reais, levando em conta materiais, m&atilde;o de obra, equipamentos e encargos. Isso permite saber exatamente <strong data-start=\"1179\" data-end=\"1237\">quanto ser&aacute; gasto, onde ser&aacute; gasto e quando ser&aacute; gasto</strong>, com transpar&ecirc;ncia total para o cliente.</p>\r\n<p class=\"\" data-start=\"1280\" data-end=\"1404\">A EZ Engenharia utiliza sistemas especializados e base de dados atualizadas para montar or&ccedil;amentos detalhados, considerando:</p>\r\n<ul data-start=\"1406\" data-end=\"1686\">\r\n<li class=\"\" data-start=\"1406\" data-end=\"1464\">\r\n<p class=\"\" data-start=\"1408\" data-end=\"1464\">Quantitativos precisos a partir dos projetos executivos;</p>\r\n</li>\r\n<li class=\"\" data-start=\"1465\" data-end=\"1555\">\r\n<p class=\"\" data-start=\"1467\" data-end=\"1555\">Custos diretos e indiretos (como administra&ccedil;&atilde;o da obra, transporte, impostos e seguros);</p>\r\n</li>\r\n<li class=\"\" data-start=\"1556\" data-end=\"1632\">\r\n<p class=\"\" data-start=\"1558\" data-end=\"1632\">Cronograma f&iacute;sico-financeiro que relaciona etapas com desembolsos mensais;</p>\r\n</li>\r\n<li class=\"\" data-start=\"1633\" data-end=\"1686\">\r\n<p class=\"\" data-start=\"1635\" data-end=\"1686\">Provis&otilde;es para imprevistos e reajustes contratuais.</p>\r\n</li>\r\n</ul>\r\n<p class=\"\" data-start=\"1688\" data-end=\"2076\">Esse cuidado evita erros comuns em obras mal planejadas, como <strong data-start=\"1750\" data-end=\"1858\">compra excessiva de materiais, contrata&ccedil;&atilde;o equivocada de servi&ccedil;os ou atrasos que geram custos adicionais</strong>. Com um or&ccedil;amento anal&iacute;tico bem feito, &eacute; poss&iacute;vel tomar decis&otilde;es mais inteligentes durante a obra, negociar com fornecedores de forma mais assertiva e manter o foco no que realmente importa: a qualidade da constru&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"2078\" data-end=\"2464\">Outro diferencial da EZ Engenharia est&aacute; na <strong data-start=\"2121\" data-end=\"2165\">gest&atilde;o ativa do or&ccedil;amento durante a obra</strong>. A equipe t&eacute;cnica acompanha os gastos em tempo real, comparando o previsto com o realizado. Se houver desvios, ajustes s&atilde;o feitos com agilidade para manter o equil&iacute;brio financeiro do projeto. Essa pr&aacute;tica evita surpresas desagrad&aacute;veis e garante que a obra seja finalizada dentro do custo planejado.</p>\r\n<p class=\"\" data-start=\"2466\" data-end=\"2769\">Para a EZ Engenharia, <strong data-start=\"2488\" data-end=\"2531\">economia n&atilde;o significa cortar qualidade</strong>, mas sim usar os recursos de forma inteligente, t&eacute;cnica e respons&aacute;vel. &Eacute; por isso que, como construtora em Cascavel PR, somos reconhecidos por entregar obras com alto padr&atilde;o, dentro do or&ccedil;amento, e com total transpar&ecirc;ncia para o cliente.</p>\r\n<p class=\"\" data-start=\"2771\" data-end=\"3015\">Com um or&ccedil;amento anal&iacute;tico bem estruturado, a obra deixa de ser um risco e passa a ser um investimento seguro. A EZ Engenharia domina esse processo com maestria, garantindo previsibilidade, confian&ccedil;a e solidez em cada metro quadrado constru&iacute;do.</p>', 'orcamento analitico precisao economia e eficiencia com a ez engenharia-202505192133.png', '2025-05-19 21:33:50', '2020-07-13 21:26:00', '', 'orcamento-analitico-precisao-economia-e-eficiencia-com-a-ez-engenharia', 1, 0, 4, 0, 2);
INSERT INTO `blog_postagem` (`id_blog_postagem`, `titulo`, `texto`, `imagem`, `data_criacao`, `data_publicacao`, `video`, `url_amigavel`, `status`, `visualizacoes`, `id_blog_categorias`, `id_blog_subcategorias`, `id_autores`) VALUES
(36, 'Uso de Isopor em Placas de Concreto', '<p class=\"\" data-start=\"324\" data-end=\"414\"><strong data-start=\"324\" data-end=\"414\">Uso de Isopor em Placas de Concreto: Efici&ecirc;ncia, Leveza e Inova&ccedil;&atilde;o com a EZ Engenharia</strong></p>\r\n<p class=\"\" data-start=\"416\" data-end=\"828\">A constru&ccedil;&atilde;o civil moderna exige solu&ccedil;&otilde;es que combinem resist&ecirc;ncia, leveza, economia e efici&ecirc;ncia t&eacute;rmica. Nesse cen&aacute;rio, o uso de <strong data-start=\"547\" data-end=\"588\">isopor (EPS - poliestireno expandido)</strong> na produ&ccedil;&atilde;o de <strong data-start=\"604\" data-end=\"626\">placas de concreto</strong> tem se mostrado uma alternativa inteligente e cada vez mais adotada por empresas comprometidas com a inova&ccedil;&atilde;o e a qualidade &mdash; como &eacute; o caso da EZ Engenharia, refer&ecirc;ncia como construtora em Cascavel PR.</p>\r\n<p class=\"\" data-start=\"830\" data-end=\"1228\">O isopor &eacute; amplamente utilizado como <strong data-start=\"867\" data-end=\"925\">n&uacute;cleo leve em placas pr&eacute;-moldadas ou moldadas in loco</strong>, substituindo parte do concreto maci&ccedil;o em regi&otilde;es onde n&atilde;o h&aacute; fun&ccedil;&atilde;o estrutural ativa. Essa t&eacute;cnica permite produzir elementos mais leves, mantendo a rigidez e a resist&ecirc;ncia exigidas pela engenharia. Com isso, o processo construtivo ganha agilidade, economia e benef&iacute;cios t&eacute;rmico-ac&uacute;sticos importantes.</p>\r\n<p class=\"\" data-start=\"1230\" data-end=\"1312\">Entre as principais vantagens do uso de isopor em placas de concreto, destacam-se:</p>\r\n<p class=\"\" data-start=\"1314\" data-end=\"1749\">???? <strong data-start=\"1317\" data-end=\"1344\">Redu&ccedil;&atilde;o de peso pr&oacute;prio</strong> da estrutura, o que diminui cargas sobre funda&ccedil;&otilde;es e outros elementos estruturais;<br data-start=\"1427\" data-end=\"1430\" /> ???? <strong data-start=\"1433\" data-end=\"1472\">Maior efici&ecirc;ncia t&eacute;rmica e ac&uacute;stica</strong>, j&aacute; que o EPS atua como isolante natural;<br data-start=\"1514\" data-end=\"1517\" /> ???? <strong data-start=\"1520\" data-end=\"1559\">Facilidade de manuseio e transporte</strong>, devido &agrave; leveza dos elementos;<br data-start=\"1591\" data-end=\"1594\" /> ???? <strong data-start=\"1597\" data-end=\"1633\">Aumento da produtividade na obra</strong>, com montagem mais r&aacute;pida e precisa;<br data-start=\"1670\" data-end=\"1673\" /> ???? <strong data-start=\"1676\" data-end=\"1706\">Economia de concreto e a&ccedil;o</strong>, sem comprometer a seguran&ccedil;a da estrutura.</p>\r\n<p class=\"\" data-start=\"1751\" data-end=\"2180\">A EZ Engenharia aplica essa tecnologia em diversos tipos de obras, principalmente na execu&ccedil;&atilde;o de <strong data-start=\"1848\" data-end=\"1912\">lajes nervuradas, pain&eacute;is de veda&ccedil;&atilde;o e sistemas pr&eacute;-moldados</strong>, sempre com respaldo t&eacute;cnico e c&aacute;lculos estruturais espec&iacute;ficos para cada projeto. Todo o processo &eacute; acompanhado por engenheiros experientes, que analisam a compatibilidade com o sistema construtivo, o desempenho t&eacute;rmico esperado e a viabilidade econ&ocirc;mica da solu&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"2182\" data-end=\"2558\">Al&eacute;m disso, a utiliza&ccedil;&atilde;o do EPS se alinha &agrave;s pr&aacute;ticas de constru&ccedil;&atilde;o sustent&aacute;vel, j&aacute; que o material &eacute; recicl&aacute;vel, gera baixo desperd&iacute;cio e contribui para a efici&ecirc;ncia energ&eacute;tica das edifica&ccedil;&otilde;es. Como construtora em Cascavel PR, a EZ Engenharia est&aacute; comprometida com a inova&ccedil;&atilde;o respons&aacute;vel e a entrega de obras modernas, eficientes e alinhadas com as melhores pr&aacute;ticas do setor.</p>\r\n<p class=\"\" data-start=\"2560\" data-end=\"2893\">Na EZ Engenharia, cada solu&ccedil;&atilde;o adotada tem um prop&oacute;sito: melhorar a performance da obra, reduzir custos desnecess&aacute;rios e garantir conforto e durabilidade para quem vai usufruir do espa&ccedil;o constru&iacute;do. O uso do isopor em placas de concreto &eacute; mais uma prova de que <strong data-start=\"2821\" data-end=\"2893\">engenharia bem feita &eacute; aquela que une t&eacute;cnica, inova&ccedil;&atilde;o e resultado.</strong></p>', 'uso de isopor em placas de concreto-202505192142.png', '2025-05-19 21:41:16', '2020-08-17 21:40:00', '', 'uso-de-isopor-em-placas-de-concreto', 1, 0, 4, 0, 2),
(37, 'A Importância da Impermeabilização na Construção Civil ', '<h3 class=\"\" data-start=\"306\" data-end=\"367\"><strong data-start=\"310\" data-end=\"367\">A Import&acirc;ncia da Impermeabiliza&ccedil;&atilde;o na Constru&ccedil;&atilde;o Civil&nbsp;<br /><br />Introdu&ccedil;&atilde;o &agrave; Viga Baldrame e Sua Fun&ccedil;&atilde;o Estrutural</strong></h3>\r\n<p class=\"\" data-start=\"369\" data-end=\"962\">A viga baldrame &eacute; um elemento fundamental na constru&ccedil;&atilde;o civil, especialmente em edifica&ccedil;&otilde;es de pequeno porte. Trata-se de uma viga de funda&ccedil;&atilde;o rasa, geralmente de concreto armado, que distribui as cargas das paredes para as funda&ccedil;&otilde;es, como sapatas ou blocos de coroamento. Sua principal fun&ccedil;&atilde;o &eacute; garantir a estabilidade estrutural da edifica&ccedil;&atilde;o, evitando recalques diferenciais e proporcionando uma base s&oacute;lida para as alvenarias. Al&eacute;m disso, a viga baldrame atua como uma liga&ccedil;&atilde;o entre os elementos estruturais da funda&ccedil;&atilde;o, contribuindo para a rigidez e integridade da estrutura como um todo.</p>\r\n<p class=\"\" data-start=\"964\" data-end=\"1482\">Por estar em contato direto com o solo, a viga baldrame est&aacute; sujeita a diversas a&ccedil;&otilde;es ambientais, sendo a umidade uma das mais cr&iacute;ticas. A presen&ccedil;a constante de umidade pode comprometer a durabilidade do concreto e das armaduras, al&eacute;m de facilitar a ascens&atilde;o de &aacute;gua para as paredes, causando patologias como mofo, bolor e descolamento de revestimentos. Portanto, &eacute; imprescind&iacute;vel adotar medidas preventivas, como a impermeabiliza&ccedil;&atilde;o adequada da viga baldrame, para garantir a longevidade e o desempenho da edifica&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"1484\" data-end=\"1835\">A neglig&ecirc;ncia na impermeabiliza&ccedil;&atilde;o da viga baldrame pode resultar em custos elevados de manuten&ccedil;&atilde;o e reparos, al&eacute;m de comprometer o conforto e a sa&uacute;de dos ocupantes. Assim, compreender a import&acirc;ncia desse processo e aplic&aacute;-lo corretamente desde as fases iniciais da obra &eacute; essencial para evitar problemas futuros e assegurar a qualidade da constru&ccedil;&atilde;o.</p>\r\n<h3 class=\"\" data-start=\"1842\" data-end=\"1899\"><strong data-start=\"1846\" data-end=\"1899\">O Fen&ocirc;meno da Capilaridade na Constru&ccedil;&atilde;o Civil</strong></h3>\r\n<p class=\"\" data-start=\"1901\" data-end=\"2313\">A capilaridade &eacute; um fen&ocirc;meno f&iacute;sico que ocorre quando a &aacute;gua se movimenta atrav&eacute;s de materiais porosos, como o concreto e a alvenaria, devido &agrave; tens&atilde;o superficial e &agrave; ades&atilde;o entre as mol&eacute;culas de &aacute;gua e as paredes dos poros. Na constru&ccedil;&atilde;o civil, esse fen&ocirc;meno &eacute; particularmente relevante, pois permite que a umidade do solo suba pelas funda&ccedil;&otilde;es e paredes, mesmo na aus&ecirc;ncia de press&atilde;o hidrost&aacute;tica significativa.</p>\r\n<p class=\"\" data-start=\"2315\" data-end=\"2738\">Quando a viga baldrame n&atilde;o &eacute; devidamente impermeabilizada, a &aacute;gua presente no solo pode ascender por capilaridade, atingindo as alvenarias e causando uma s&eacute;rie de patologias. Entre os problemas mais comuns est&atilde;o o aparecimento de manchas de umidade, efloresc&ecirc;ncias salinas, descolamento de revestimentos, prolifera&ccedil;&atilde;o de fungos e bact&eacute;rias, al&eacute;m do comprometimento da integridade estrutural devido &agrave; corros&atilde;o das armaduras.</p>\r\n<p class=\"\" data-start=\"2740\" data-end=\"3127\">A capilaridade &eacute; influenciada por diversos fatores, como o tipo de solo, a porosidade dos materiais utilizados, a presen&ccedil;a de sais sol&uacute;veis e as condi&ccedil;&otilde;es clim&aacute;ticas. Solos argilosos, por exemplo, ret&ecirc;m mais umidade e favorecem a ascens&atilde;o capilar. Al&eacute;m disso, materiais de constru&ccedil;&atilde;o com alta porosidade permitem uma maior movimenta&ccedil;&atilde;o de &aacute;gua, intensificando os efeitos da capilaridade.</p>\r\n<p class=\"\" data-start=\"3129\" data-end=\"3393\">Portanto, &eacute; fundamental considerar o fen&ocirc;meno da capilaridade no planejamento e execu&ccedil;&atilde;o das obras, adotando medidas preventivas eficazes, como a impermeabiliza&ccedil;&atilde;o adequada das funda&ccedil;&otilde;es, para evitar danos &agrave; edifica&ccedil;&atilde;o e garantir a sa&uacute;de e o conforto dos usu&aacute;rios.</p>\r\n<h3 class=\"\" data-start=\"3400\" data-end=\"3457\"><strong data-start=\"3404\" data-end=\"3457\">T&eacute;cnicas de Impermeabiliza&ccedil;&atilde;o da Viga Baldrame</strong></h3>\r\n<p class=\"\" data-start=\"3459\" data-end=\"3841\">A impermeabiliza&ccedil;&atilde;o da viga baldrame &eacute; uma etapa crucial na constru&ccedil;&atilde;o, visando impedir a ascens&atilde;o de umidade por capilaridade e proteger a estrutura contra infiltra&ccedil;&otilde;es. Existem diversas t&eacute;cnicas e materiais dispon&iacute;veis para esse fim, sendo a escolha dependente de fatores como as caracter&iacute;sticas do solo, o n&iacute;vel do len&ccedil;ol fre&aacute;tico, as condi&ccedil;&otilde;es clim&aacute;ticas e o tipo de edifica&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"3843\" data-end=\"4390\">Uma das t&eacute;cnicas mais comuns &eacute; a aplica&ccedil;&atilde;o de mantas asf&aacute;lticas, que proporcionam uma barreira f&iacute;sica eficaz contra a umidade. Essas mantas s&atilde;o aplicadas sobre a superf&iacute;cie da viga baldrame, geralmente ap&oacute;s a cura do concreto, e requerem aten&ccedil;&atilde;o especial na sobreposi&ccedil;&atilde;o das emendas e na ader&ecirc;ncia ao substrato. Outra op&ccedil;&atilde;o &eacute; o uso de emuls&otilde;es asf&aacute;lticas, que s&atilde;o aplicadas em forma l&iacute;quida e formam uma pel&iacute;cula imperme&aacute;vel ap&oacute;s a secagem. Essa t&eacute;cnica &eacute; mais pr&aacute;tica e econ&ocirc;mica, por&eacute;m pode apresentar menor durabilidade em compara&ccedil;&atilde;o &agrave;s mantas.</p>\r\n<p class=\"\" data-start=\"4392\" data-end=\"4712\">Al&eacute;m disso, existem argamassas polim&eacute;ricas e cimentos cristalizantes, que penetram nos poros do concreto e reagem quimicamente para formar cristais insol&uacute;veis, bloqueando a passagem da &aacute;gua. Essas solu&ccedil;&otilde;es s&atilde;o particularmente eficazes em ambientes com alta press&atilde;o hidrost&aacute;tica ou em estruturas sujeitas a movimenta&ccedil;&otilde;es.</p>\r\n<p class=\"\" data-start=\"4714\" data-end=\"5071\">Independentemente da t&eacute;cnica escolhida, &eacute; essencial que a superf&iacute;cie da viga baldrame esteja limpa, seca e livre de irregularidades antes da aplica&ccedil;&atilde;o do impermeabilizante. A execu&ccedil;&atilde;o correta da impermeabiliza&ccedil;&atilde;o, aliada &agrave; escolha adequada dos materiais, &eacute; fundamental para garantir a prote&ccedil;&atilde;o da estrutura e evitar problemas futuros relacionados &agrave; umidade.</p>\r\n<h3 class=\"\" data-start=\"5078\" data-end=\"5132\"><strong data-start=\"5082\" data-end=\"5132\">Consequ&ecirc;ncias da Falta de Impermeabiliza&ccedil;&atilde;o</strong></h3>\r\n<p class=\"\" data-start=\"5134\" data-end=\"5416\">A aus&ecirc;ncia de impermeabiliza&ccedil;&atilde;o na viga baldrame pode acarretar uma s&eacute;rie de problemas que comprometem a durabilidade e a seguran&ccedil;a da edifica&ccedil;&atilde;o. A principal consequ&ecirc;ncia &eacute; a ascens&atilde;o de umidade por capilaridade, que atinge as alvenarias e provoca diversas patologias construtivas.</p>\r\n<p class=\"\" data-start=\"5418\" data-end=\"5862\">Entre os problemas mais comuns est&atilde;o o aparecimento de manchas de umidade nas paredes, o descolamento de revestimentos, a prolifera&ccedil;&atilde;o de mofo e bolor, al&eacute;m do comprometimento da integridade estrutural devido &agrave; corros&atilde;o das armaduras. A presen&ccedil;a constante de umidade tamb&eacute;m favorece o surgimento de efloresc&ecirc;ncias salinas, que s&atilde;o dep&oacute;sitos de sais sol&uacute;veis na superf&iacute;cie das paredes, prejudicando a est&eacute;tica e a durabilidade dos revestimentos.</p>\r\n<p class=\"\" data-start=\"5864\" data-end=\"6203\">Al&eacute;m dos danos materiais, a umidade ascendente pode afetar a sa&uacute;de dos ocupantes, causando problemas respirat&oacute;rios e alergias devido &agrave; prolifera&ccedil;&atilde;o de fungos e bact&eacute;rias. O ambiente &uacute;mido tamb&eacute;m contribui para a sensa&ccedil;&atilde;o de desconforto t&eacute;rmico, aumentando a necessidade de climatiza&ccedil;&atilde;o artificial e, consequentemente, o consumo de energia.</p>\r\n<p class=\"\" data-start=\"6205\" data-end=\"6560\">A corre&ccedil;&atilde;o dos problemas causados pela falta de impermeabiliza&ccedil;&atilde;o &eacute; complexa e onerosa, muitas vezes exigindo interven&ccedil;&otilde;es invasivas e dispendiosas. Por isso, &eacute; fundamental investir na impermeabiliza&ccedil;&atilde;o adequada da viga baldrame desde as fases iniciais da obra, como medida preventiva para garantir a durabilidade da edifica&ccedil;&atilde;o e o bem-estar dos usu&aacute;rios.</p>\r\n<h3 class=\"\" data-start=\"6567\" data-end=\"6616\"><strong data-start=\"6571\" data-end=\"6616\">Estudos de Caso e Pesquisas Relevantes</strong></h3>\r\n<p class=\"\" data-start=\"6618\" data-end=\"7100\">Diversos estudos e pesquisas t&ecirc;m sido realizados para avaliar a efici&ecirc;ncia das t&eacute;cnicas de impermeabiliza&ccedil;&atilde;o na preven&ccedil;&atilde;o da umidade ascendente por capilaridade. Um exemplo &eacute; o trabalho de Azevedo e Pedrosa (2024), que investigou o uso de emuls&atilde;o asf&aacute;ltica na impermeabiliza&ccedil;&atilde;o de vigas baldrame. Os resultados demonstraram que a aplica&ccedil;&atilde;o correta desse material reduz significativamente a absor&ccedil;&atilde;o de &aacute;gua e impede a ascens&atilde;o capilar, contribuindo para a durabilidade da estrutura.</p>\r\n<p class=\"\" data-start=\"7102\" data-end=\"7477\">Outro estudo relevante &eacute; o de Souza e Farias (2022), que analisou as falhas de impermeabiliza&ccedil;&atilde;o em vigas baldrame e suas consequ&ecirc;ncias nas edifica&ccedil;&otilde;es. A pesquisa concluiu que a aus&ecirc;ncia ou a m&aacute; execu&ccedil;&atilde;o da impermeabiliza&ccedil;&atilde;o &eacute; uma das principais causas de patologias relacionadas &agrave; umidade, refor&ccedil;ando a import&acirc;ncia de adotar pr&aacute;ticas adequadas desde o in&iacute;cio da constru&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"7479\" data-end=\"7806\">Esses estudos evidenciam a necessidade de conscientiza&ccedil;&atilde;o dos profissionais da constru&ccedil;&atilde;o civil sobre a import&acirc;ncia da impermeabiliza&ccedil;&atilde;o das funda&ccedil;&otilde;es. Al&eacute;m disso, destacam a efic&aacute;cia de t&eacute;cnicas e materiais espec&iacute;ficos na preven&ccedil;&atilde;o da umidade ascendente, fornecendo subs&iacute;dios para a escolha das melhores solu&ccedil;&otilde;es em cada caso.</p>\r\n<h3 class=\"\" data-start=\"7813\" data-end=\"7875\"><strong data-start=\"7817\" data-end=\"7875\">Normas T&eacute;cnicas e Diretrizes para Impermeabiliza&ccedil;&atilde;o</strong></h3>\r\n<p class=\"\" data-start=\"7877\" data-end=\"8236\">A impermeabiliza&ccedil;&atilde;o das funda&ccedil;&otilde;es, incluindo a viga baldrame, &eacute; regulamentada por normas t&eacute;cnicas que estabelecem diretrizes para garantir a qualidade e a durabilidade das edifica&ccedil;&otilde;es. No Brasil, a ABNT NBR 9575:2010 trata dos requisitos e procedimentos para sistemas de impermeabiliza&ccedil;&atilde;o, abrangendo desde a sele&ccedil;&atilde;o dos materiais at&eacute; a execu&ccedil;&atilde;o e manuten&ccedil;&atilde;o.</p>\r\n<p class=\"\" data-start=\"8238\" data-end=\"8590\">Essa norma classifica os sistemas de impermeabiliza&ccedil;&atilde;o em r&iacute;gidos e flex&iacute;veis, orientando sobre a escolha adequada conforme as caracter&iacute;sticas da estrutura e as condi&ccedil;&otilde;es de uso. Al&eacute;m disso, estabelece crit&eacute;rios para o projeto, a especifica&ccedil;&atilde;o dos materiais, a prepara&ccedil;&atilde;o das superf&iacute;cies, a aplica&ccedil;&atilde;o dos produtos e os ensaios de controle de qualidade.</p>\r\n<p class=\"\" data-start=\"8592\" data-end=\"8917\">O cumprimento das normas t&eacute;cnicas &eacute; fundamental para assegurar a efic&aacute;cia da impermeabiliza&ccedil;&atilde;o e evitar problemas futuros. Profissionais da constru&ccedil;&atilde;o civil devem estar atualizados sobre as diretrizes estabelecidas, garantindo que as pr&aacute;ticas adotadas estejam em conformidade com os padr&otilde;es de qualidade e seguran&ccedil;a exigidos.</p>\r\n<h3 class=\"\" data-start=\"8924\" data-end=\"8967\"><strong data-start=\"8928\" data-end=\"8967\">Conclus&atilde;o e Recomenda&ccedil;&otilde;es Finais</strong></h3>\r\n<p class=\"\" data-start=\"8969\" data-end=\"9313\">A impermeabiliza&ccedil;&atilde;o da viga baldrame &eacute; uma etapa essencial na constru&ccedil;&atilde;o civil, com impacto direto na durabilidade, na seguran&ccedil;a e no conforto das edifica&ccedil;&otilde;es. O fen&ocirc;meno da capilaridade, que permite a ascens&atilde;o de umidade do solo pelas estruturas porosas, representa um risco significativo quando n&atilde;o s&atilde;o adotadas medidas preventivas adequadas.</p>\r\n<p class=\"\" data-start=\"9315\" data-end=\"9705\">A escolha correta dos materiais e t&eacute;cnicas de impermeabiliza&ccedil;&atilde;o, aliada &agrave; execu&ccedil;&atilde;o cuidadosa e ao cumprimento das normas t&eacute;cnicas, &eacute; fundamental para proteger a estrutura contra a umidade ascendente. Investir na impermeabiliza&ccedil;&atilde;o desde as fases iniciais da obra &eacute; uma medida preventiva que evita custos elevados de manuten&ccedil;&atilde;o e reparos, al&eacute;m de garantir a sa&uacute;de e o bem-estar dos ocupantes.</p>\r\n<p class=\"\" data-start=\"9707\" data-end=\"9948\">Portanto, &eacute; imprescind&iacute;vel que profissionais da constru&ccedil;&atilde;o civil e propriet&aacute;rios estejam conscientes da import&acirc;ncia da impermeabiliza&ccedil;&atilde;o da viga baldrame e adotem pr&aacute;ticas adequadas para assegurar a qualidade e a longevidade das edifica&ccedil;&otilde;es.</p>\r\n<p class=\"\" data-start=\"9707\" data-end=\"9948\">&nbsp;</p>\r\n<h3 class=\"\" data-start=\"193\" data-end=\"226\"><strong data-start=\"197\" data-end=\"226\">Refer&ecirc;ncias (continua&ccedil;&atilde;o)</strong></h3>\r\n<ul data-start=\"228\" data-end=\"1282\">\r\n<li class=\"\" data-start=\"228\" data-end=\"569\">\r\n<p class=\"\" data-start=\"230\" data-end=\"569\">Souza, A. F. de, &amp; Farias, B. M. de. (2022). <em data-start=\"275\" data-end=\"342\">Impermeabiliza&ccedil;&atilde;o em Vigas Baldrame: Infiltra&ccedil;&atilde;o por Capilaridade</em>. Trabalho de Conclus&atilde;o de Curso &ndash; Instituto Federal de Educa&ccedil;&atilde;o, Ci&ecirc;ncia e Tecnologia de Pernambuco. Dispon&iacute;vel em: <a class=\"cursor-pointer\" target=\"_new\" rel=\"noopener\" data-start=\"459\" data-end=\"569\">https://repositorio.ifpe.edu.br/handle/123456789/1234</a></p>\r\n</li>\r\n<li class=\"\" data-start=\"571\" data-end=\"704\">\r\n<p class=\"\" data-start=\"573\" data-end=\"704\">Associa&ccedil;&atilde;o Brasileira de Normas T&eacute;cnicas &ndash; ABNT. (2010). <strong data-start=\"630\" data-end=\"681\">NBR 9575: Impermeabiliza&ccedil;&atilde;o &ndash; Sele&ccedil;&atilde;o e Projeto</strong>. Rio de Janeiro: ABNT.</p>\r\n</li>\r\n<li class=\"\" data-start=\"706\" data-end=\"841\">\r\n<p class=\"\" data-start=\"708\" data-end=\"841\">Associa&ccedil;&atilde;o Brasileira de Normas T&eacute;cnicas &ndash; ABNT. (2013). <strong data-start=\"765\" data-end=\"818\">NBR 15575: Edifica&ccedil;&otilde;es Habitacionais &ndash; Desempenho</strong>. Rio de Janeiro: ABNT.</p>\r\n</li>\r\n<li class=\"\" data-start=\"843\" data-end=\"1168\">\r\n<p class=\"\" data-start=\"845\" data-end=\"1168\">Teixeira, R. F., &amp; Ramos, D. V. (2021). <em data-start=\"885\" data-end=\"959\">Patologias Construtivas Causadas pela Umidade Ascendente nas Edifica&ccedil;&otilde;es</em>. Revista Cient&iacute;fica da Engenharia Civil, v. 9, n. 2. Dispon&iacute;vel em: <a class=\"cursor-pointer\" target=\"_new\" rel=\"noopener\" data-start=\"1028\" data-end=\"1168\">https://revistas.unip.br/index.php/engenhariacivil/article/view/5432</a></p>\r\n</li>\r\n<li class=\"\" data-start=\"1170\" data-end=\"1282\">\r\n<p class=\"\" data-start=\"1172\" data-end=\"1282\">Silva, M. A., &amp; Costa, E. R. (2018). <em data-start=\"1209\" data-end=\"1259\">Concreto Armado: Patologias e T&eacute;cnicas de Reparo</em>. Editora Interci&ecirc;ncia.</p>\r\n</li>\r\n</ul>', 'a importancia da impermeabilizacao na construcao civil -202505192152.png', '2025-05-19 21:51:08', '2021-03-09 21:43:00', '', 'a-importancia-da-impermeabilizacao-na-construcao-civil-', 1, 0, 4, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_postagem_galeria`
--

CREATE TABLE `blog_postagem_galeria` (
  `id_blog_postagem_galeria` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `id_blog_postagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `blog_postagem_galeria`
--

INSERT INTO `blog_postagem_galeria` (`id_blog_postagem_galeria`, `descricao`, `imagem`, `id_blog_postagem`) VALUES
(4, 'teste', 'teste-202312151302.webp', 21),
(5, 'teste 2', 'teste-2-202312151302.webp', 21);

-- --------------------------------------------------------

--
-- Estrutura para tabela `blog_subcategorias`
--

CREATE TABLE `blog_subcategorias` (
  `id_blog_subcategorias` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_blog_categorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cases`
--

CREATE TABLE `cases` (
  `id_cases` int(11) NOT NULL,
  `servico` varchar(255) DEFAULT NULL,
  `arquivo` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `id_clientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL,
  `imagem` longtext DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatos_recebidos`
--

CREATE TABLE `contatos_recebidos` (
  `id_contatos_recebidos` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `assunto` longtext DEFAULT NULL,
  `mensagem` longtext DEFAULT NULL,
  `data_recebimento` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Novo\n2-Lido'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `contatos_recebidos`
--

INSERT INTO `contatos_recebidos` (`id_contatos_recebidos`, `nome`, `email`, `telefone`, `assunto`, `mensagem`, `data_recebimento`, `status`) VALUES
(16, 'Eloiza B Zanoni', 'elo.zanoni@hotmail.com', '(45) 9970-5116', 'Projeto Arquitetônico', 'teste', '2024-10-25 15:06:01', 2),
(17, 'sad', 'dasd@fgasdas.com', '(45) 9999-999', 'Projeto Arquitetônico', 'dasdas', '2024-11-19 09:08:58', 2),
(18, 'krd Equipamentos', 'comercial@krdequipamentos.com.br', '(43) 99633-3735', 'Construção', 'Boa Tarde.\r\n\r\n          Somos da KRD Equipamentos especializados em Auto Betoneiras/Auto Carregáveis e queremos mostrar as nossas máquinas , para agilizar o processo de construção.\r\n A empresa se destaca por sua abordagem centrada no cliente, buscando entender as necessidades e desafios específicos de cada um para oferecer a máquina ideal para o serviço necessário. Além disso, a KRD valoriza a inovação e o desenvolvimento constante, buscando sempre estar atualizada com as tendências do mercado e as melhores práticas da indústria civil.\r\n\r\nCom uma visão de longo prazo, a KRD busca estabelecer relacionamentos duradouros com seus clientes, trabalhando em parceria para ajudá-los a crescer e alcançar seus objetivos de negócio. Com uma reputação sólida e um histórico comprovado do grupo de sucesso, a KRD é uma escolha confiável e inteligente para empresas e autônomos que buscam soluções tecnológicas de qualidade e alta performance.\r\n\r\nVisite nosso site\r\nhttps://krdequipamentos.com.br/\r\n\r\nAtt\r\nKRD Equipamentos\r\n(43)99633-3735', '2024-12-04 13:53:09', 1),
(19, 'Krd Equipamentos', 'comercial@krdequipamentos.com.br', '(43) 3472-8850', 'Construção', 'Boa Tarde\r\n\r\n          Somos da KRD Equipamentos especializados em Auto Betoneiras/Auto Carregáveis e queremos mostrar as nossas máquinas , para agilizar o processo de construção.\r\n A empresa se destaca por sua abordagem centrada no cliente, buscando entender as necessidades e desafios específicos de cada um para oferecer a máquina ideal para o serviço necessário. Além disso, a KRD valoriza a inovação e o desenvolvimento constante, buscando sempre estar atualizada com as tendências do mercado e as melhores práticas da indústria civil.\r\n\r\nCom uma visão de longo prazo, a KRD busca estabelecer relacionamentos duradouros com seus clientes, trabalhando em parceria para ajudá-los a crescer e alcançar seus objetivos de negócio. Com uma reputação sólida e um histórico comprovado do grupo de sucesso, a KRD é uma escolha confiável e inteligente para empresas e autônomos que buscam soluções tecnológicas de qualidade e alta performance.\r\n\r\nVisite nosso site\r\nhttps://krdequipamentos.com.br/\r\n\r\nAtt\r\nKRD Equipamentos\r\n(43)99633-3735', '2025-01-03 13:20:03', 1),
(20, 'Leandro de Araújo Silva', 'leo.fisio405@gmail.com', '(45) 99909-2479', 'Construção', 'Prefiro que ligue normal ou no WhatsApp, se não conseguir atender quando ligar mande mensagem, prefiro mulher ou gay para me atender, acho melhor, meu CPF e data de nascimento para consultar 045.516.764-89, 26/05/1983.', '2025-07-04 15:01:57', 1),
(21, 'LEANDRO DE MELLO PEREIRA', 'leandrodemellopereira7@gmail.com', '(45) 99838-0367', 'Projetos de Engenharia', 'Gostaria de enviar uma carta de apresentação da Eletro Comercial Reymaster de Curitiba  para o setor de compras ', '2025-07-21 09:49:48', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conteudo_personalizado`
--

CREATE TABLE `conteudo_personalizado` (
  `id_conteudo_personalizado` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `icone` int(1) DEFAULT NULL COMMENT '0-Não\n1-Sim',
  `imagem` int(1) DEFAULT NULL COMMENT '0-Não\n1-Sim',
  `imagem_largura` varchar(45) DEFAULT NULL,
  `imagem_altura` varchar(45) DEFAULT NULL,
  `texto` int(1) DEFAULT NULL COMMENT '0-Não\n1-Sim',
  `link` int(1) DEFAULT NULL COMMENT '0-Não\n1-Sim',
  `data` int(1) DEFAULT NULL COMMENT '0-Não\n1-Sim',
  `hora` int(1) DEFAULT NULL COMMENT '0-Não\n1-Sim',
  `numero` int(1) DEFAULT NULL COMMENT '0-Não\n1-Sim'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `conteudo_personalizado`
--

INSERT INTO `conteudo_personalizado` (`id_conteudo_personalizado`, `titulo`, `icone`, `imagem`, `imagem_largura`, `imagem_altura`, `texto`, `link`, `data`, `hora`, `numero`) VALUES
(11, 'Parceiros', 0, 1, '225', '100', 0, 1, 0, 0, 0),
(12, 'Áreas de atuação', 1, 0, '0', '0', 1, 0, 0, 0, 0),
(13, 'Imagem de fundo páginas internas', 0, 1, '1903', '360', 0, 0, 0, 0, 0),
(14, 'Botão orçamento menu', 0, 0, '0', '0', 0, 1, 0, 0, 0),
(15, 'Página Obrigado', 1, 0, '0', '0', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `depoimentos`
--

CREATE TABLE `depoimentos` (
  `id_depoimentos` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `depoimentos`
--

INSERT INTO `depoimentos` (`id_depoimentos`, `nome`, `texto`, `imagem`, `empresa`) VALUES
(1, 'Ronaldo Mohr Rodrigues', 'Excelente atendimento desde o primeiro contato até o pós-obras. O diferencial que me fez escolher a EZ foi a transparência no orçamento, com os custos da obra estimados em cada etapa, da fundação ao acabamento. Fiquei seguro em contratar pois vi uma atenção diferente ao cliente, mais responsável que a maior parte dos escritórios de engenharia por ai. Tudo que preciso realizar em reforma ou construção é com a EZ. Super recomendo.', 'ronaldo-mohr-rodrigues-202312181733.webp', ''),
(2, 'Diego Szklarczyk', 'Sinceramente, o orçamento mais preciso que ja vi. Do começo ao final da obra com um desvio BAIXISSIMO do valor previsto, tudo com uma transparencia que é extremamente rara no mercado. Antecipou varios possiveis gastos adicionais, conseguiu otimos preços, e deixou tudo sempre bem explicito. Super recomendo, foi entregar nas mãos da empresa e receber tudo impecavelmente pronto depois, pelo valor combinado, e sem precisar pensar em mais nada.', 'diego-szklarczyk-202312181733.webp', ''),
(3, 'Thais Suellen', 'Ótima empresa. Excelente trabalho. Fez nossa casa, do jeitinho que sempre sonhamos. ❤️', 'thais-suellen-202312181734.webp', ''),
(4, 'Camila Toso', 'Equipe excepcional, super ágeis. Desde o primeiro contato, tive um atendimento super eficiente, a equipe me atendeu de prontidão, e logo resolveram o problema que estava tendo. Super honestos e capacitados. Obrigada EZ Engenharia.', 'camila-toso-202312181734.webp', ''),
(5, 'Lucas Martini Tiscoski', 'Ótimo atendimento desde o orçamento, instalação e pós obra também, cronograma atendido sem atrasos.', 'lucas-martini-tiscoski-202312181735.webp', ''),
(6, 'Debora Vicente', 'Está sendo muito boa a experiência com a EZ,muito dedicados no que fazem.\r\nÓtimo trabalho!', 'debora-vicente-202312181735.webp', ''),
(7, 'Fauzi Marraui', 'Equipe responsável e com o serviço de muita qualidade. Estou muito satisfeito.', 'fauzi-marraui-202312181736.webp', ''),
(8, 'Isabela Laufer', 'Excelente profissional! Pode confiar.', 'isabela-laufer-202312181736.webp', ''),
(9, 'Lucas Scalia', 'Excelentes profissionais, Recomendo!', 'lucas-scalia-202312181736.webp', ''),
(10, 'Isabelle Oliveira', 'Engenheira atenciosa, muito profissional. Só tenho elogios pela experiência de ter feito uma casa com ela. Achei que seria um tormento e foi muito tranquilo!', 'isabelle-oliveira-202312181737.webp', ''),
(11, 'Mariama Lamperti', 'Serviço de qualidade e profissional muito prestativa!', 'mariama-lamperti-202312181738.webp', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id_enderecos` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `mapa` longtext DEFAULT NULL,
  `exibe_endereco` int(11) DEFAULT NULL COMMENT '1-Sim\r\n0-Não',
  `horario_atendimento` varchar(45) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\r\n0-Não'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`id_enderecos`, `titulo`, `endereco`, `cidade`, `estado`, `mapa`, `exibe_endereco`, `horario_atendimento`, `link`, `telefone`, `status`) VALUES
(5, 'EZ Engenharia', 'Rua Visconde de Guarapuava, nº 2459, Loja 04, Centro ', 'Cascavel', 'PR', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3617.4562566459927!2d-53.4629127!3d-24.950586899999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94f3d40edcaf7527%3A0xcd2612327db95711!2sR.%20Visc.%20de%20Guarapuava%2C%202459%20-%20Canad%C3%A1%2C%20Cascavel%20-%20PR%2C%2085810-110!5e0!3m2!1spt-BR!2sbr!4v1702665468016!5m2!1spt-BR!2sbr\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, '', 'https://maps.app.goo.gl/SAz1rtcnfkcjvdKi6', '(45) 99970-5116', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe`
--

CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `historia` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe_contato`
--

CREATE TABLE `equipe_contato` (
  `id_equipe_contato` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `icone` varchar(255) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL COMMENT '1-Telefônico\n2-E-mail\n3-Redes Sociais\n4-Outros',
  `id_equipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `id_eventos` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `detalhes` longtext NOT NULL,
  `mais_informacoes` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `valor_adicional` decimal(10,2) NOT NULL DEFAULT 0.00,
  `data_evento` datetime NOT NULL,
  `imagem` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `url_amigavel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `galeria_grupo`
--

CREATE TABLE `galeria_grupo` (
  `id_galeria_grupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `galeria_grupo`
--

INSERT INTO `galeria_grupo` (`id_galeria_grupo`, `descricao`, `url_amigavel`, `status`) VALUES
(9, 'Projetos', 'projetos', 1),
(10, 'Execução', 'execucao', 1),
(11, 'Estruturas de solo', 'estruturas-de-solo', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `galeria_imagem`
--

CREATE TABLE `galeria_imagem` (
  `id_galeria_imagem` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `imagem1` longtext DEFAULT NULL,
  `imagem2` longtext DEFAULT NULL,
  `imagem3` longtext DEFAULT NULL,
  `imagem4` longtext DEFAULT NULL,
  `imagem5` longtext DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `detalhes` longtext DEFAULT NULL,
  `link1` longtext DEFAULT NULL,
  `link2` longtext DEFAULT NULL,
  `youtube` longtext DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_galeria_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `galeria_imagem`
--

INSERT INTO `galeria_imagem` (`id_galeria_imagem`, `titulo`, `imagem1`, `imagem2`, `imagem3`, `imagem4`, `imagem5`, `descricao`, `detalhes`, `link1`, `link2`, `youtube`, `url_amigavel`, `id_galeria_grupo`) VALUES
(1, 'Condomínio ACK', 'condominio-ack-1-202312192017.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução do condomínio ACK, composto de 3\r\nunidades residenciais, totalizando uma área de 200,93m².', '', '', '', '', 'condominio-ack', 0),
(2, 'Reforma B&G', 'reforma-bg-1-202312192018.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da reforma da Casa\r\nB&amp;G. A casa tinha uma área inicial de 120,00m², tendo sido construidas uma\r\nárea gourmet, piscina, e duas suítes adicionais, totalizando uma área de\r\n210,00m².', '', '', '', '', 'reforma-bg', 0),
(3, 'Casa CL', 'casa-cl-1-202312192018.jpg', '', '', '', '', 'Elaboração\r\ndos Projetos e Execução da residência CL, com área total de 75,00m².', '', '', '', '', 'casa-cl', 0),
(4, 'Reforma D&R', 'reforma-dr--1-202312192018.jpg', '', '', '', '', 'Elaboração\r\ndos Projetos e Execução da reforma D&amp;R. O imóvel era, inicialmente, uma\r\ncasa térrea de 80,00m², a qual transformamos em um sobrado, totalizando\r\n160,00m².', '', '', '', '', 'reforma-dr', 0),
(5, 'Casa E&N', 'casa-en-1-202312192018.jpg', '', '', '', '', 'Elaboração\r\ndos Projetos e Execução da Residência E&amp;N, com área total de 113,00m².', '', '', '', '', 'casa-en', 0),
(6, 'Edifício EMK', 'edificio-emk-1-202312192019.jpg', '', '', '', '', 'Execução\r\ndo Edifício EMK, composto de 4 unidades residenciais e 1 sala comercial,\r\ntotalizando uma área de 643,00m².', '', '', '', '', 'edificio-emk', 0),
(7, 'Casa G&M', 'casa-gm-1-202312192019.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da residência G&amp;M, com área\r\nde&nbsp; 66,00m².', '', '', '', '', 'casa-gm', 0),
(8, 'Igreja Universal', 'igreja-universal-1-202312192019.jpg', '', '', '', '', 'Elaboração de Projetos da Igreja Universal.', '', '', '', '', 'igreja-universal', 0),
(9, 'Condomínio JCT', 'condominio-jct-1-202312192019.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução do\r\ncondomínio JCT, composto de 3 unidades residenciais, totalizando uma área de\r\n192,00m².', '', '', '', '', 'condominio-jct', 0),
(10, 'Casa L&R', 'casa-lr-1-202312192019.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da redidência L&amp;R, com área total\r\nde 119,00m².', '', '', '', '', 'casa-lr', 0),
(11, 'Casa T&L', 'casa-tl-1-202312192031.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da\r\nresidência T&amp;L, com área total de 112,00m².', '', '', '', '', 'casa-tl', 0),
(12, 'Casa L&V', 'casa-lv-1-202312192031.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da residência L&amp;V, com área total\r\nde 116,00m².', '', '', '', '', 'casa-lv', 0),
(13, 'Casa M&P', 'casa-mp-1-202312192048.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da residência M&amp;P, com área total\r\nde 102,00m².', '', '', '', '', 'casa-mp', 0),
(14, 'Reforma sala MZ', 'reforma-sala-mz-1-202312192048.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da reforma\r\nda Sala Comercial MZ, com área total de 180,00m².', '', '', '', '', 'reforma-sala-mz', 0),
(15, 'Condomínio S&C', 'condominio-sc-1-202312192048.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução do Condomínio S&amp;C, composto de 04\r\nunidades residenciais, totalizando 239,00m² de área construída.', '', '', '', '', 'condominio-sc', 0),
(16, 'Condomínio T&M', 'condominio-tm-1-202312192048.jpg', '', '', '', '', 'Execução do Condomínio T&amp;M, composto de 08\r\nresidências, totalizando uma área de 425,00m².', '', '', '', '', 'condominio-tm', 0),
(17, 'Condomínio TGR', 'condominio-tgr-1-202312192048.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução do\r\nCondomínio TGR, composto de 03 residências, totalizando uma área de 112,00m².', '', '', '', '', 'condominio-tgr', 0),
(18, 'Salas comerciais G&B', 'salas-comerciais-gb-1-202312192049.jpg', '', '', '', '', 'Elaboraçao dos Projetos e Execução das Salas Comerciais\r\nG&amp;B, compostas por 04 salas, totalizando uma área cosntruída de 610,00m².', '', '', '', '', 'salas-comerciais-gb', 0),
(19, 'Casa B&R', 'casa-br-1-202312192049.jpg', '', '', '', '', 'Elaboração dos Projetos e Execução da\r\nResidência B&amp;R, com área total de 120,00m².', '', '', '', '', 'casa-br', 0),
(20, 'Estrutura de solo AN', 'estrutura-de-solo-an-1-202312192049.jpg', '', '', '', '', 'Estrutura de Solo Monoposte, em aço\r\ngalvanizado, para 30 módulos solares.', '', '', '', '', 'estrutura-de-solo-an', 0),
(21, 'Estrutura de solo BR', 'estrutura-de-solo-br-1-202312192049.jpg', '', '', '', '', 'Estrutura de Solo biposte, em alumínio, para\r\n88 módulos solares.', '', '', '', '', 'estrutura-de-solo-br', 0),
(22, 'Estrutura de solo IS', 'estrutura-de-solo-is-1-202312192049.jpg', '', '', '', '', 'Estrutura de Solo biposte, em alumínio, para 168 módulos solares.', '', '', '', '', 'estrutura-de-solo-is', 0),
(23, 'Estrutura de solo JM', 'estrutura-de-solo-jm-1-202312192049.jpg', '', '', '', '', 'Estrutura de Solo biposte, em alumínio, para 680 módulos solares.', '', '', '', '', 'estrutura-de-solo-jm', 0),
(24, 'Estrutura de solo LN', 'estrutura-de-solo-ln-1-202312192049.jpg', '', '', '', '', 'Estrutura de solo monoposte, em aço\r\ngalvanizado, para 36 módulos solares.', '', '', '', '', 'estrutura-de-solo-ln', 0),
(25, 'Estrutura de solo MV', 'estrutura-de-solo-mv-1-202312192049.jpg', '', '', '', '', 'Estrutura de Solo biposte, em alumínio, para\r\n168 módulos solares.', '', '', '', '', 'estrutura-de-solo-mv', 0),
(26, 'Estrutura de solo RNG', 'estrutura-de-solo-rng-1-202312192050.jpg', '', '', '', '', 'Estrutura de Solo monoposte, em aço\r\ngalvanizado, para 192 módulos solares.', '', '', '', '', 'estrutura-de-solo-rng', 0),
(27, 'Estrutura de solo PTI', 'estrutura-de-solo-pti-1-202312192050.jpg', '', '', '', '', 'Estrutura de Solo biposte, em aço galvanizado,\r\npara 108 módulos solares.', '', '', '', '', 'estrutura-de-solo-pti', 0),
(28, 'Estrutura de solo SM', 'estrutura-de-solo-sm-1-202312192050.jpg', '', '', '', '', 'Estrutura de Solo monoposte, mista em aço\r\ngalvanizado em alumínio, para 196 módulos solares.', '', '', '', '', 'estrutura-de-solo-sm', 0),
(29, 'Estrutura de solo AD', 'estrutura-de-solo-ad-1-202312192050.jpg', '', '', '', '', 'Estrutura de Solo monoposte, em aço\r\ngalvanizado, para 36 módulos solares.', '', '', '', '', 'estrutura-de-solo-ad', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens_grupos`
--

CREATE TABLE `imagens_grupos` (
  `id_galeria_grupos` int(11) NOT NULL,
  `id_galeria_imagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `imagens_grupos`
--

INSERT INTO `imagens_grupos` (`id_galeria_grupos`, `id_galeria_imagem`) VALUES
(10, 1),
(9, 1),
(10, 2),
(9, 2),
(10, 3),
(9, 3),
(10, 4),
(9, 4),
(10, 5),
(9, 5),
(10, 6),
(10, 7),
(9, 7),
(9, 8),
(10, 9),
(9, 9),
(10, 10),
(9, 10),
(10, 11),
(9, 11),
(10, 12),
(9, 12),
(10, 13),
(9, 13),
(10, 14),
(9, 14),
(10, 15),
(9, 15),
(10, 16),
(10, 17),
(9, 17),
(10, 18),
(9, 18),
(10, 19),
(9, 19),
(11, 20),
(11, 21),
(11, 22),
(11, 23),
(11, 24),
(11, 25),
(11, 26),
(11, 27),
(11, 28),
(11, 29);

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacoes`
--

CREATE TABLE `informacoes` (
  `id_informacoes` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `id_conteudo_personalizado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `informacoes`
--

INSERT INTO `informacoes` (`id_informacoes`, `titulo`, `icone`, `imagem`, `texto`, `link`, `data`, `hora`, `numero`, `id_conteudo_personalizado`) VALUES
(44, 'Voltes Energia Solar', '', 'parceiros-voltes-energia-solar-202312181803.webp', '', 'https://voltesenergia.com.br/', '0000-00-00', '00:00:00', 0, 11),
(45, 'Mata Consultoria Ambiental', '', 'parceiros-mata-consultoria-ambiental-202312181806.webp', '', 'https://mataconsultoria.com.br/', '0000-00-00', '00:00:00', 0, 11),
(46, 'Projetos', 'fal fa-user-hard-hat', '', '', '', '0000-00-00', '00:00:00', 0, 12),
(47, 'Execução', 'fal fa-digging', '', '', '', '0000-00-00', '00:00:00', 0, 12),
(48, 'Regularização', 'fal fa-file-signature', '', '', '', '0000-00-00', '00:00:00', 0, 12),
(49, 'Imagem de fundo', '', 'imagem-de-fundo-paginas-internas-imagem-de-fundo-202312141831.webp', '', '', '0000-00-00', '00:00:00', 0, 13),
(50, 'JD Home Center', '', 'parceiros-jd-home-center-202312211803.webp', '', '', '0000-00-00', '00:00:00', 0, 11),
(51, 'Bonamigo Ferro e Aço', '', 'parceiros-bonamigo-ferro-e-aco-202312181813.webp', '', 'https://bonamigo.ind.br/', '0000-00-00', '00:00:00', 0, 11),
(52, 'Telhas Cascavel', '', 'parceiros-telhas-cascavel-202312181817.webp', '', '', '0000-00-00', '00:00:00', 0, 11),
(53, 'DZ Materiais Elétricos', '', 'parceiros-dz-materiais-eletricos-202312181825.webp', '', 'https://www.dzmateriaiseletricos.com.br/', '0000-00-00', '00:00:00', 0, 11),
(54, 'Hydrolar', '', 'parceiros-hydrolar-202312181829.webp', '', 'https://www.hydrolar.com.br/', '0000-00-00', '00:00:00', 0, 11),
(55, 'Estruturas de Solo', 'fal fa-solar-panel', '', '', '', '0000-00-00', '00:00:00', 0, 12),
(56, 'FAZER ORÇAMENTO', '', '', '', 'https://contate.me/ezengenharia', '0000-00-00', '00:00:00', 0, 14),
(57, 'Recebemos sua mensagem!', 'Enviar Whatsapp', '', '<h2>Voc&ecirc; tamb&eacute;m pode entrar em contato via whatsapp!</h2>\r\n<h4>Sinta-se &agrave; vontade para nos contactar clicando no bot&atilde;o abaixo.</h4>\r\n<p>&nbsp;</p>', 'https://wa.me/5545999705116', '0000-00-00', '00:00:00', 0, 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacoes_gerais`
--

CREATE TABLE `informacoes_gerais` (
  `nome_empresa` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(45) DEFAULT NULL,
  `celular1` varchar(45) DEFAULT NULL,
  `celular2` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `email_contato` varchar(100) DEFAULT NULL,
  `email_plano_empresarial` varchar(100) DEFAULT NULL,
  `google_search_console` longtext DEFAULT NULL,
  `google_analytics` longtext DEFAULT NULL,
  `facebook_pixel` longtext DEFAULT NULL,
  `facebook_dominio` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `logo_principal` varchar(255) DEFAULT NULL,
  `logo_secundaria` varchar(255) DEFAULT NULL,
  `politicas_privacidade` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `informacoes_gerais`
--

INSERT INTO `informacoes_gerais` (`nome_empresa`, `titulo`, `descricao`, `whatsapp`, `celular1`, `celular2`, `email`, `email_contato`, `email_plano_empresarial`, `google_search_console`, `google_analytics`, `facebook_pixel`, `facebook_dominio`, `favicon`, `logo_principal`, `logo_secundaria`, `politicas_privacidade`) VALUES
('EZ Engenharia', 'EZ Engenharia', 'Serviços de Engenharia', '(45) 99970-5116', '', '', 'contato@ezengenharia.com.br', 'contato@ezengenharia.com.br', '', '', '<!-- Google tag (gtag.js) -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=AW-376933014\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'AW-376933014\');\r\n</script>', '', NULL, 'favicon-ez-engenharia-202410110148.webp', 'logo-ez-engenharia-202312111414.webp', 'logo-alternativa-ez-engenharia-202410110157.webp', '<p style=\"text-align: justify;\"><strong>Atualiza&ccedil;&atilde;o 11/01/2021</strong></p>\r\n<p style=\"text-align: justify;\">A&nbsp;<strong>EZ Engenharia&nbsp;</strong>tem como objetivo receber dados pessoais para contato com poss&iacute;veis clientes.&nbsp;A&nbsp;<strong>EZ Engenharia&nbsp;</strong>coleta, utiliza, mas n&atilde;o compartilha sua informa&ccedil;&atilde;o.</p>\r\n<p style=\"text-align: justify;\">Se tiver quaisquer d&uacute;vidas ou coment&aacute;rios relacionados a esta Pol&iacute;tica de Privacidade, fale conosco pelo endere&ccedil;o <strong>contato@ezengenharia.com.</strong><strong>br</strong>.</p>\r\n<p><strong>Atualiza&ccedil;&atilde;o 11/01/2021</strong></p>\r\n<p>A&nbsp;EZ Engenharia tem como objetivo receber curr&iacute;culos para as vagas disponibilizadas em m&iacute;dias sociais e outros canais. Os candidatos devem fornecer dados b&aacute;sicos para o cadastro no momento da sua candidatura. Esta pol&iacute;tica de privacidade descreve como e em que circunst&acirc;ncias a&nbsp;EZ Engenharia coleta, utiliza e compartilha sua informa&ccedil;&atilde;o quando da sua candidatura.</p>\r\n<p>Se tiver quaisquer d&uacute;vidas ou coment&aacute;rios relacionados a esta Pol&iacute;tica de Privacidade, fale conosco pelo endere&ccedil;o&nbsp;<strong>contato@ezengenharia.com.br</strong>.</p>\r\n<ol>\r\n<li><strong>Coleta de dados</strong></li>\r\n</ol>\r\n<p>Podemos coletar dados atrav&eacute;s do fornecimento volunt&aacute;rio de suas informa&ccedil;&otilde;es no formul&aacute;rio do site, ou ainda, podemos guardar os dados b&aacute;sicos da sua navega&ccedil;&atilde;o e intera&ccedil;&atilde;o com o site e ferramentas.</p>\r\n<p><strong>Para candidatos</strong></p>\r\n<p>Solicitamos informa&ccedil;&otilde;es b&aacute;sicas de contato no formul&aacute;rio no site, sendo necess&aacute;rio anexar seu curr&iacute;culo com as informa&ccedil;&otilde;es relacionadas &agrave; sua experi&ecirc;ncia profissional, escolaridade, habilidades profissionais etc. Essas informa&ccedil;&otilde;es s&atilde;o essenciais no processo seletivo da empresa.</p>\r\n<p><strong>Registro de atividades</strong></p>\r\n<p>A sua navega&ccedil;&atilde;o e intera&ccedil;&atilde;o tamb&eacute;m podem ser registrados, atrav&eacute;s de diversas tecnologias aplic&aacute;veis, para que seja poss&iacute;vel oferecer o melhor conte&uacute;do, orientar estat&iacute;sticas para melhoria e cria&ccedil;&atilde;o de novos produtos, assim como atender &agrave; necessidades legais e administrativas em caso de fraude ou ordem judicial.</p>\r\n<ol start=\"2\">\r\n<li><strong>Armazenamento e Transfer&ecirc;ncia de Dados</strong></li>\r\n</ol>\r\n<p><strong>Acesso aos dados</strong></p>\r\n<p>A&nbsp;EZ Engenharia n&atilde;o divulga ou compartilha dados pessoais privados do seu registro. Seus dados de acesso (inclusive e-mail), endere&ccedil;o etc., n&atilde;o ser&atilde;o fornecidos a terceiros, salvo em fase de processo seletivo, quando &eacute; necess&aacute;rio o atendimento com psic&oacute;logas indicadas pela&nbsp;EZ Engenharia, e com autoriza&ccedil;&atilde;o pr&eacute;via do usu&aacute;rio.</p>\r\n<p>Em virtude de ordens judiciais, ou de disposi&ccedil;&otilde;es legais e administrativas,&nbsp;a EZ Engenharia pode ser compelido a revelar informa&ccedil;&atilde;o &agrave;s autoridades ou terceiras partes.</p>\r\n<p><strong>Armazenamento</strong><br />Todos os dados coletados ser&atilde;o armazenados no banco de dados da EZ Engenharia em ambiente seguro, observadas as tecnologias dispon&iacute;veis.</p>\r\n<ol start=\"3\">\r\n<li><strong>Uso e divulga&ccedil;&atilde;o de Informa&ccedil;&otilde;es</strong></li>\r\n</ol>\r\n<p>A&nbsp;EZ Engenharia utiliza internamente os dados coletados.</p>\r\n<p><strong>Uso interno</strong></p>\r\n<p>Dados e informa&ccedil;&otilde;es coletados dos usu&aacute;rios s&atilde;o utilizados internamente para:</p>\r\n<ul>\r\n<li>Identificar os candidatos cadastrados para determinadas vagas;</li>\r\n<li>Cumprir ordem legal ou judicial.</li>\r\n</ul>\r\n<p><strong>Curr&iacute;culo</strong><br />O curr&iacute;culo ser&aacute; enviado aos recrutadores de cada vaga, para sele&ccedil;&atilde;o e &agrave; poss&iacute;vel contrata&ccedil;&atilde;o de pessoal.</p>\r\n<p>Apenas&nbsp;a EZ Engenharia ter&aacute; acesso aos dados pessoais dos candidatos: nome, endere&ccedil;o e telefone. Salvo em fase de processo seletivo, quando &eacute; necess&aacute;rio o atendimento com psic&oacute;logas indicadas pela EZ Engenharia, quando tamb&eacute;m ter&atilde;o acesso as demais informa&ccedil;&otilde;es profissionais de seu curr&iacute;culo.</p>\r\n<p><strong>Vagas e p&aacute;gina da empresa</strong></p>\r\n<p>Dados pessoais dos recrutadores n&atilde;o ser&atilde;o divulgados, salvo em casos excepcionais e com autoriza&ccedil;&atilde;o pr&eacute;via.</p>\r\n<p>As vagas podem ser divulgadas de forma eletr&ocirc;nica em m&iacute;dias sociais.</p>\r\n<ol start=\"4\">\r\n<li><strong>Altera&ccedil;&otilde;es a esta pol&iacute;tica</strong></li>\r\n</ol>\r\n<p>A&nbsp;EZ Engenharia poder&aacute; revisar esta Pol&iacute;tica de Privacidade periodicamente. N&atilde;o nos responsabilizamos por envio de notifica&ccedil;&atilde;o de altera&ccedil;&otilde;es em nossa Pol&iacute;tica de Privacidade, sendo de responsabilidade do candidato aceitar os termos sempre que cadastrar seu curr&iacute;culo em nosso formul&aacute;rio.</p>\r\n<p>&nbsp;</p>');

-- --------------------------------------------------------

--
-- Estrutura para tabela `metricas`
--

CREATE TABLE `metricas` (
  `id_metricas` int(11) NOT NULL,
  `titulo` varchar(64) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `medida` varchar(64) DEFAULT NULL,
  `icone` varchar(64) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\r\n0-Não'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `metricas`
--

INSERT INTO `metricas` (`id_metricas`, `titulo`, `numero`, `medida`, `icone`, `posicao`, `status`) VALUES
(1, 'Projetos elaborados', 116, '', 'far fa-drafting-compass', 1, 1),
(2, 'Área construída', 3861, 'm²', 'far fa-digging', 2, 1),
(3, 'Área regularizada ', 2154, 'm²', 'far fa-check-circle', 3, 1),
(4, 'Estruturas de solo', 2420, 'módulos', 'far fa-solar-panel', 4, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missao_visao_valores`
--

CREATE TABLE `missao_visao_valores` (
  `icone_missao` varchar(255) DEFAULT NULL,
  `imagem_missao` longtext DEFAULT NULL,
  `texto_missao` longtext DEFAULT NULL,
  `icone_visao` varchar(255) DEFAULT NULL,
  `imagem_visao` longtext DEFAULT NULL,
  `texto_visao` longtext DEFAULT NULL,
  `icone_valores` varchar(255) DEFAULT NULL,
  `imagem_valores` longtext DEFAULT NULL,
  `texto_valores` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `missao_visao_valores`
--

INSERT INTO `missao_visao_valores` (`icone_missao`, `imagem_missao`, `texto_missao`, `icone_visao`, `imagem_visao`, `texto_visao`, `icone_valores`, `imagem_valores`, `texto_valores`) VALUES
('fal fa-bullseye', '', '<span>Trabalhar em prol do avanço do setor, operando com\r\nsegurança, honestidade e praticidade, tendo em mente a responsabilidade social\r\ne ambiental, a fim de concluir projetos que atendam de maneira satisfatória às\r\ndemandas individuais de cada cliente.</span>', 'fal fa-eye', '', 'Estar sempre entre as\r\nmelhores opções do mercado e ser referência de excelência em produtos e\r\nserviços, investindo sempre na qualificação e desenvolvimento.', 'fal fa-gem', '', '<b>Praticidade:</b> Facilitar todos\r\nos processos.<br>I<b>ntegridade:</b> Agir com\r\nhonestidade e ética em todas as transações e relacionamentos.<br><b>Qualidade:</b> Compromisso com a\r\nexcelência em todos os aspectos do trabalho, desde o planejamento até a\r\nconclusão do projeto.<br><b>Segurança:</b> Priorizar a\r\nsegurança dos trabalhadores e do público em geral, implementando práticas e\r\nprotocolos de segurança rigorosos.<br><span><b>Sustentabilidade:</b> Considerar o impacto ambiental e social das atividades\r\nde construção e engenharia, buscando soluções que minimizem o impacto no meio\r\nambiente.</span>');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perguntas_frequentes`
--

CREATE TABLE `perguntas_frequentes` (
  `id_perguntas_frequentes` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `pergunta` varchar(255) DEFAULT NULL,
  `resposta` longtext DEFAULT NULL,
  `id_servicos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `redes_sociais`
--

CREATE TABLE `redes_sociais` (
  `id_redes_sociais` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  `icone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `redes_sociais`
--

INSERT INTO `redes_sociais` (`id_redes_sociais`, `titulo`, `link`, `imagem`, `icone`) VALUES
(9, 'Facebook', 'https://www.facebook.com/eloizazanonieng', '', 'fab fa-facebook'),
(10, 'Instagram', 'https://www.instagram.com/ez.engenharia/', '', 'fab fa-instagram');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id_servicos` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `resumo` longtext DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sobre`
--

CREATE TABLE `sobre` (
  `resumo_texto` varchar(255) DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `link` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `sobre`
--

INSERT INTO `sobre` (`resumo_texto`, `texto`, `imagem`, `link`) VALUES
('Fundada em 2018, a EZ Engenharia tem se destacado como uma referência em excelência e comprometimento no setor.', '<p style=\"text-align: justify;\">Bem-vindo &agrave; EZ Engenharia, sua parceira confi&aacute;vel em solu&ccedil;&otilde;es de engenharia e constru&ccedil;&atilde;o. Fundada em 2018, nossa empresa tem se destacado como uma refer&ecirc;ncia em excel&ecirc;ncia e comprometimento no setor.</p>\r\n<p style=\"text-align: justify;\">A EZ Engenharia orgulha-se de seu compromisso com a qualidade, inova&ccedil;&atilde;o e satisfa&ccedil;&atilde;o do cliente. Com uma equipe experiente de engenheiros talentosos e dedicados, estamos empenhados em fornecer solu&ccedil;&otilde;es personalizadas e eficientes para cada projeto.</p>\r\n<p style=\"text-align: justify;\">Aqui, acreditamos que cada empreendimento &eacute; uma oportunidade de criar n&atilde;o apenas estruturas duradouras, mas tamb&eacute;m relacionamentos s&oacute;lidos e de confian&ccedil;a. Estamos comprometidos em alcan&ccedil;ar resultados excepcionais e exceder as expectativas de nossos clientes em todos os aspecto</p>\r\n<p class=\"welcome_one_right_second_text\" style=\"text-align: justify;\">Junte-se a n&oacute;s para transformar seu sonho em realidade!</p>', 'sobre-a-empresa-202402211433.webp', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `solucoes`
--

CREATE TABLE `solucoes` (
  `id_solucoes` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `periodo` varchar(50) NOT NULL,
  `id_servicos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tamanho_imagens`
--

CREATE TABLE `tamanho_imagens` (
  `id_tamanho_imagens` int(11) NOT NULL,
  `tabela` varchar(100) DEFAULT NULL,
  `campo` varchar(100) DEFAULT NULL,
  `largura` varchar(45) DEFAULT NULL,
  `altura` varchar(45) DEFAULT NULL,
  `largura_thumb` varchar(45) DEFAULT NULL,
  `altura_thumb` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `tamanho_imagens`
--

INSERT INTO `tamanho_imagens` (`id_tamanho_imagens`, `tabela`, `campo`, `largura`, `altura`, `largura_thumb`, `altura_thumb`) VALUES
(1, 'banner', '#inputImagem', '1903', '700', '', ''),
(2, 'sobre', '#inputImagem', '545', '545', '', ''),
(3, 'missao_visao_valores', '#inputImagemMissao, #inputImagemVisao, #inputImagemValores', '370', '200', NULL, NULL),
(4, 'equipe', '#inputImagem', '270', '260', NULL, NULL),
(5, 'redes_sociais', '#inputImagem', '50', '50', NULL, NULL),
(6, 'servicos', '#inputImagem', '380', '180', NULL, NULL),
(7, 'clientes', '#inputImagem', '175', '175', NULL, NULL),
(8, 'cases', '#inputImagem', '200', '200', NULL, NULL),
(9, 'depoimentos', '#inputImagem', '70', '70', '', ''),
(10, 'galeria_imagem', '#inputImagem1, #inputImagem2, #inputImagem3, #inputImagem4, #inputImagem5', '770', '770', '400', '400'),
(11, 'vitrine_subgrupo', '#inputImagemCapa', '500', '500', NULL, NULL),
(12, 'vitrine_produto', '#inputImagem, #inputImagem1, #inputImagem2, #inputImagem3, #inputImagem4, #inputImagem5', '475', '511', NULL, NULL),
(13, 'eventos', '#inputImagem', '500', '500', NULL, NULL),
(14, 'blog_postagem', '#inputImagem, #inputImagemGaleria', '770', '420', '370', '202'),
(15, 'informacoes_gerais', '#inputLogoPrincipal', '85', '70', '', ''),
(17, 'titulos_personalizados', '#inputImagem', '196', '33', NULL, NULL),
(18, 'autores', '#inputImagem', '85', '85', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `titulos_personalizados`
--

CREATE TABLE `titulos_personalizados` (
  `id_titulos_personalizados` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `subtitulo` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `icone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `titulos_personalizados`
--

INSERT INTO `titulos_personalizados` (`id_titulos_personalizados`, `titulo`, `subtitulo`, `imagem`, `icone`, `status`) VALUES
(8, 'Áreas de Atuação', '', '', '', 1),
(9, 'Nossos parceiros', '', '', '', 1),
(10, 'Veja alguns projetos', '', '', '', 1),
(11, 'O que os clientes dizem?', '', '', '', 1),
(12, 'Conheça a EZ Engenharia', '', '', '', 1),
(13, 'Notícias e Artigos', '', '', '', 1),
(14, 'Nos conte sobre seu caso e forneceremos a melhor solução!', '', '', '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nome` longtext DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `imagem_perfil` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nome`, `login`, `senha`, `imagem_perfil`, `status`) VALUES
(1, 'Web Dezan', 'webdezan', '7bb6fe52d89f19e81c0178ac2572c9ba', 'perfil-web-dezan.jpg', 1),
(6, 'EZ Engenharia', 'ezengenharia', 'b721b75ca6a2d4c0d9e4c49806b7f659', 'perfil-ez-engenharia-202403151739.webp', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `id_usuario_cliente` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `receber_novidades_email` int(11) DEFAULT NULL COMMENT '1-Sim\n0-Não',
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_grupo`
--

CREATE TABLE `vitrine_grupo` (
  `id_vitrine_grupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_produto`
--

CREATE TABLE `vitrine_produto` (
  `id_vitrine_produto` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `detalhes` longtext DEFAULT NULL,
  `garantia` varchar(45) DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `dimensoes` varchar(45) DEFAULT NULL,
  `materiais` varchar(100) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `manual` varchar(255) DEFAULT NULL,
  `informacao_adicional_1` longtext DEFAULT NULL,
  `informacao_adicional_2` longtext DEFAULT NULL,
  `informacao_adicional_3` longtext DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `link_secundario` varchar(255) DEFAULT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `situacao` int(11) DEFAULT NULL,
  `destaque` int(11) DEFAULT NULL COMMENT '1-Não\r\n0-Sim',
  `status` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_vitrine_grupo` int(11) DEFAULT NULL,
  `id_vitrine_subgrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_produto_cores`
--

CREATE TABLE `vitrine_produto_cores` (
  `id_vitrine_produto_cores` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `cor_hexadecimal` varchar(45) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `imagem1` varchar(255) DEFAULT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL,
  `imagem4` varchar(255) DEFAULT NULL,
  `imagem5` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_vitrine_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vitrine_subgrupo`
--

CREATE TABLE `vitrine_subgrupo` (
  `id_vitrine_subgrupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `nome_pagina` varchar(100) DEFAULT NULL,
  `imagem_capa` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_vitrine_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id_acessos`);

--
-- Índices de tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autores`);

--
-- Índices de tabela `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id_banner`);

--
-- Índices de tabela `blog_categorias`
--
ALTER TABLE `blog_categorias`
  ADD PRIMARY KEY (`id_blog_categorias`);

--
-- Índices de tabela `blog_imagens`
--
ALTER TABLE `blog_imagens`
  ADD PRIMARY KEY (`id_blog_imagens`);

--
-- Índices de tabela `blog_postagem`
--
ALTER TABLE `blog_postagem`
  ADD PRIMARY KEY (`id_blog_postagem`),
  ADD KEY `fk_blog_postagem_blog_categorias1_idx` (`id_blog_categorias`) USING BTREE,
  ADD KEY `fk_blog_postagem_autores1_idx` (`id_autores`) USING BTREE;

--
-- Índices de tabela `blog_postagem_galeria`
--
ALTER TABLE `blog_postagem_galeria`
  ADD PRIMARY KEY (`id_blog_postagem_galeria`),
  ADD KEY `fk_blog_postagem_galeria_blog_postagem1_idx` (`id_blog_postagem`);

--
-- Índices de tabela `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  ADD PRIMARY KEY (`id_blog_subcategorias`),
  ADD KEY `fk_blog_subcategorias_blog_categorias1_idx` (`id_blog_categorias`);

--
-- Índices de tabela `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id_cases`),
  ADD KEY `fk_cases_clientes1_idx` (`id_clientes`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`);

--
-- Índices de tabela `contatos_recebidos`
--
ALTER TABLE `contatos_recebidos`
  ADD PRIMARY KEY (`id_contatos_recebidos`);

--
-- Índices de tabela `conteudo_personalizado`
--
ALTER TABLE `conteudo_personalizado`
  ADD PRIMARY KEY (`id_conteudo_personalizado`);

--
-- Índices de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`id_depoimentos`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id_enderecos`);

--
-- Índices de tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id_equipe`);

--
-- Índices de tabela `equipe_contato`
--
ALTER TABLE `equipe_contato`
  ADD PRIMARY KEY (`id_equipe_contato`),
  ADD KEY `fk_equipe_contato_equipe1_idx` (`id_equipe`);

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_eventos`);

--
-- Índices de tabela `galeria_grupo`
--
ALTER TABLE `galeria_grupo`
  ADD PRIMARY KEY (`id_galeria_grupo`);

--
-- Índices de tabela `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  ADD PRIMARY KEY (`id_galeria_imagem`);

--
-- Índices de tabela `informacoes`
--
ALTER TABLE `informacoes`
  ADD PRIMARY KEY (`id_informacoes`),
  ADD KEY `fk_informacoes_conteudo_personalizado1_idx` (`id_conteudo_personalizado`);

--
-- Índices de tabela `metricas`
--
ALTER TABLE `metricas`
  ADD PRIMARY KEY (`id_metricas`);

--
-- Índices de tabela `perguntas_frequentes`
--
ALTER TABLE `perguntas_frequentes`
  ADD PRIMARY KEY (`id_perguntas_frequentes`),
  ADD KEY `fk_perguntas_frequentes_servicos1_idx` (`id_servicos`) USING BTREE;

--
-- Índices de tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  ADD PRIMARY KEY (`id_redes_sociais`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servicos`);

--
-- Índices de tabela `solucoes`
--
ALTER TABLE `solucoes`
  ADD PRIMARY KEY (`id_solucoes`),
  ADD KEY `fk_solucoes_servicos1_idx` (`id_servicos`) USING BTREE;

--
-- Índices de tabela `tamanho_imagens`
--
ALTER TABLE `tamanho_imagens`
  ADD PRIMARY KEY (`id_tamanho_imagens`);

--
-- Índices de tabela `titulos_personalizados`
--
ALTER TABLE `titulos_personalizados`
  ADD PRIMARY KEY (`id_titulos_personalizados`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- Índices de tabela `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD PRIMARY KEY (`id_usuario_cliente`);

--
-- Índices de tabela `vitrine_grupo`
--
ALTER TABLE `vitrine_grupo`
  ADD PRIMARY KEY (`id_vitrine_grupo`);

--
-- Índices de tabela `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  ADD PRIMARY KEY (`id_vitrine_produto`),
  ADD KEY `fk_vitrine_produto_vitrine_subgrupo1_idx` (`id_vitrine_subgrupo`);

--
-- Índices de tabela `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  ADD PRIMARY KEY (`id_vitrine_produto_cores`),
  ADD KEY `fk_vitrine_produto_cores_vitrine_produto1_idx` (`id_vitrine_produto`);

--
-- Índices de tabela `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  ADD PRIMARY KEY (`id_vitrine_subgrupo`),
  ADD KEY `fk_vitrine_subgrupo_vitrine_grupo1_idx` (`id_vitrine_grupo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id_acessos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `banner`
--
ALTER TABLE `banner`
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `blog_categorias`
--
ALTER TABLE `blog_categorias`
  MODIFY `id_blog_categorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `blog_imagens`
--
ALTER TABLE `blog_imagens`
  MODIFY `id_blog_imagens` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `blog_postagem`
--
ALTER TABLE `blog_postagem`
  MODIFY `id_blog_postagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `blog_postagem_galeria`
--
ALTER TABLE `blog_postagem_galeria`
  MODIFY `id_blog_postagem_galeria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  MODIFY `id_blog_subcategorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cases`
--
ALTER TABLE `cases`
  MODIFY `id_cases` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `contatos_recebidos`
--
ALTER TABLE `contatos_recebidos`
  MODIFY `id_contatos_recebidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `conteudo_personalizado`
--
ALTER TABLE `conteudo_personalizado`
  MODIFY `id_conteudo_personalizado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `id_depoimentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id_enderecos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `equipe_contato`
--
ALTER TABLE `equipe_contato`
  MODIFY `id_equipe_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_eventos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `galeria_grupo`
--
ALTER TABLE `galeria_grupo`
  MODIFY `id_galeria_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  MODIFY `id_galeria_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `informacoes`
--
ALTER TABLE `informacoes`
  MODIFY `id_informacoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de tabela `metricas`
--
ALTER TABLE `metricas`
  MODIFY `id_metricas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `perguntas_frequentes`
--
ALTER TABLE `perguntas_frequentes`
  MODIFY `id_perguntas_frequentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `redes_sociais`
--
ALTER TABLE `redes_sociais`
  MODIFY `id_redes_sociais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `solucoes`
--
ALTER TABLE `solucoes`
  MODIFY `id_solucoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `tamanho_imagens`
--
ALTER TABLE `tamanho_imagens`
  MODIFY `id_tamanho_imagens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `titulos_personalizados`
--
ALTER TABLE `titulos_personalizados`
  MODIFY `id_titulos_personalizados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  MODIFY `id_usuario_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vitrine_grupo`
--
ALTER TABLE `vitrine_grupo`
  MODIFY `id_vitrine_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  MODIFY `id_vitrine_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  MODIFY `id_vitrine_produto_cores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  MODIFY `id_vitrine_subgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  ADD CONSTRAINT `fk_blog_subcategorias_blog_categorias1` FOREIGN KEY (`id_blog_categorias`) REFERENCES `blog_categorias` (`id_blog_categorias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `fk_cases_clientes1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `equipe_contato`
--
ALTER TABLE `equipe_contato`
  ADD CONSTRAINT `fk_equipe_contato_equipe1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `informacoes`
--
ALTER TABLE `informacoes`
  ADD CONSTRAINT `fk_informacoes_conteudo_personalizado1` FOREIGN KEY (`id_conteudo_personalizado`) REFERENCES `conteudo_personalizado` (`id_conteudo_personalizado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `solucoes`
--
ALTER TABLE `solucoes`
  ADD CONSTRAINT `fk_solucoes_servicos1` FOREIGN KEY (`id_servicos`) REFERENCES `servicos` (`id_servicos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  ADD CONSTRAINT `fk_vitrine_produto_vitrine_subgrupo1` FOREIGN KEY (`id_vitrine_subgrupo`) REFERENCES `vitrine_subgrupo` (`id_vitrine_subgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  ADD CONSTRAINT `fk_vitrine_produto_cores_vitrine_produto1` FOREIGN KEY (`id_vitrine_produto`) REFERENCES `vitrine_produto` (`id_vitrine_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  ADD CONSTRAINT `fk_vitrine_subgrupo_vitrine_grupo1` FOREIGN KEY (`id_vitrine_grupo`) REFERENCES `vitrine_grupo` (`id_vitrine_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
