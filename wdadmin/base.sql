-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2023 at 07:30 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giraldis_site`
--

-- --------------------------------------------------------

--
-- Table structure for table `acessos`
--

CREATE TABLE `acessos` (
  `id_acessos` int(11) NOT NULL,
  `funcao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acessos`
--

INSERT INTO `acessos` (`id_acessos`, `funcao`, `status`) VALUES
(1, 'menu_banners_slideshow', 1),
(2, 'menu_central_servicos', 1),
(3, 'menu_relacao_cliente', 1),
(4, 'menu_galeria', 0),
(5, 'menu_vitrine', 0),
(6, 'menu_eventos', 0),
(7, 'menu_blog', 1);

-- --------------------------------------------------------

--
-- Table structure for table `autores`
--

CREATE TABLE `autores` (
  `id_autores` int(11) NOT NULL,
  `nome` longtext DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `autores`
--

INSERT INTO `autores` (`id_autores`, `nome`, `descricao`, `imagem`, `status`) VALUES
(1, 'Autor', '<p style=\"text-align: justify;\">We will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', 'autor-202212210929.webp', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id_banner` int(11) NOT NULL,
  `imagem` longtext DEFAULT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `texto_botao` varchar(100) DEFAULT NULL,
  `link_nova_aba` int(11) DEFAULT NULL COMMENT '0-Não 1-Sim	',
  `posicao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- --------------------------------------------------------

--
-- Table structure for table `blog_categorias`
--

CREATE TABLE `blog_categorias` (
  `id_blog_categorias` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_imagens`
--

CREATE TABLE `blog_imagens` (
  `id_blog_imagens` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_postagem`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_postagem_galeria`
--

CREATE TABLE `blog_postagem_galeria` (
  `id_blog_postagem_galeria` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `id_blog_postagem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_subcategorias`
--

CREATE TABLE `blog_subcategorias` (
  `id_blog_subcategorias` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `posicao` int(11) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_blog_categorias` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
  `id_cases` int(11) NOT NULL,
  `servico` varchar(255) DEFAULT NULL,
  `arquivo` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `id_clientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contatos_recebidos`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conteudo_personalizado`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `depoimentos`
--

CREATE TABLE `depoimentos` (
  `id_depoimentos` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `id_clientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enderecos`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `equipe`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `equipe_contato`
--

CREATE TABLE `equipe_contato` (
  `id_equipe_contato` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `icone` varchar(255) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL COMMENT '1-Telefônico\n2-E-mail\n3-Redes Sociais\n4-Outros',
  `id_equipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eventos`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `galeria_grupo`
--

CREATE TABLE `galeria_grupo` (
  `id_galeria_grupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `galeria_imagem`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `informacoes`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `informacoes_gerais`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `informacoes_gerais`
--

INSERT INTO `informacoes_gerais` (`nome_empresa`, `titulo`, `descricao`, `whatsapp`, `celular1`, `celular2`, `email`, `email_contato`, `email_plano_empresarial`, `google_search_console`, `google_analytics`, `facebook_pixel`, `facebook_dominio`, `favicon`, `logo_principal`, `logo_secundaria`, `politicas_privacidade`) VALUES
('', '', '', '', '', '', '', 'alan@webdezan.com.br', '', '', '', '', NULL, '', '', '', '<p style=\"text-align: justify;\"><strong>Atualiza&ccedil;&atilde;o 11/01/2021</strong></p>\r\n<p style=\"text-align: justify;\">A&nbsp;<strong>Giraldi\'s Contabilidade&nbsp;</strong>tem como objetivo receber dados pessoais para contato com poss&iacute;veis clientes.&nbsp;A&nbsp;<strong>Giraldi\'s Contabilidade&nbsp;</strong>coleta, utiliza, mas n&atilde;o compartilha sua informa&ccedil;&atilde;o.</p>\r\n<p style=\"text-align: justify;\">Se tiver quaisquer d&uacute;vidas ou coment&aacute;rios relacionados a esta Pol&iacute;tica de Privacidade, fale conosco pelo endere&ccedil;o <strong>contato@giraldis.cnt.</strong><strong>br</strong>.</p>\r\n<p><strong>Atualiza&ccedil;&atilde;o 11/01/2021</strong></p>\r\n<p>A&nbsp;Giraldi\'s Contabilidade tem como objetivo receber curr&iacute;culos para as vagas disponibilizadas em m&iacute;dias sociais e outros canais. Os candidatos devem fornecer dados b&aacute;sicos para o cadastro no momento da sua candidatura. Esta pol&iacute;tica de privacidade descreve como e em que circunst&acirc;ncias a&nbsp;Giraldi\'s Contabilidade coleta, utiliza e compartilha sua informa&ccedil;&atilde;o quando da sua candidatura.</p>\r\n<p>Se tiver quaisquer d&uacute;vidas ou coment&aacute;rios relacionados a esta Pol&iacute;tica de Privacidade, fale conosco pelo endere&ccedil;o&nbsp;<strong>contato@giraldis.cnt.br</strong>.</p>\r\n<ol>\r\n<li><strong>Coleta de dados</strong></li>\r\n</ol>\r\n<p>Podemos coletar dados atrav&eacute;s do fornecimento volunt&aacute;rio de suas informa&ccedil;&otilde;es no formul&aacute;rio do site, ou ainda, podemos guardar os dados b&aacute;sicos da sua navega&ccedil;&atilde;o e intera&ccedil;&atilde;o com o site e ferramentas.</p>\r\n<p><strong>Para candidatos</strong></p>\r\n<p>Solicitamos informa&ccedil;&otilde;es b&aacute;sicas de contato no formul&aacute;rio no site, sendo necess&aacute;rio anexar seu curr&iacute;culo com as informa&ccedil;&otilde;es relacionadas &agrave; sua experi&ecirc;ncia profissional, escolaridade, habilidades profissionais etc. Essas informa&ccedil;&otilde;es s&atilde;o essenciais no processo seletivo da empresa.</p>\r\n<p><strong>Registro de atividades</strong></p>\r\n<p>A sua navega&ccedil;&atilde;o e intera&ccedil;&atilde;o tamb&eacute;m podem ser registrados, atrav&eacute;s de diversas tecnologias aplic&aacute;veis, para que seja poss&iacute;vel oferecer o melhor conte&uacute;do, orientar estat&iacute;sticas para melhoria e cria&ccedil;&atilde;o de novos produtos, assim como atender &agrave; necessidades legais e administrativas em caso de fraude ou ordem judicial.</p>\r\n<ol start=\"2\">\r\n<li><strong>Armazenamento e Transfer&ecirc;ncia de Dados</strong></li>\r\n</ol>\r\n<p><strong>Acesso aos dados</strong></p>\r\n<p>A&nbsp;Giraldi\'s Contabilidade n&atilde;o divulga ou compartilha dados pessoais privados do seu registro. Seus dados de acesso (inclusive e-mail), endere&ccedil;o etc., n&atilde;o ser&atilde;o fornecidos a terceiros, salvo em fase de processo seletivo, quando &eacute; necess&aacute;rio o atendimento com psic&oacute;logas indicadas pela&nbsp;Giraldi\'s Contabilidade, e com autoriza&ccedil;&atilde;o pr&eacute;via do usu&aacute;rio.</p>\r\n<p>Em virtude de ordens judiciais, ou de disposi&ccedil;&otilde;es legais e administrativas,&nbsp;a Giraldi\'s Contabilidade pode ser compelido a revelar informa&ccedil;&atilde;o &agrave;s autoridades ou terceiras partes.</p>\r\n<p><strong>Armazenamento</strong><br />Todos os dados coletados ser&atilde;o armazenados no banco de dados da Giraldi\'s Contabilidade em ambiente seguro, observadas as tecnologias dispon&iacute;veis.</p>\r\n<ol start=\"3\">\r\n<li><strong>Uso e divulga&ccedil;&atilde;o de Informa&ccedil;&otilde;es</strong></li>\r\n</ol>\r\n<p>A&nbsp;Giraldi\'s Contabilidade utiliza internamente os dados coletados.</p>\r\n<p><strong>Uso interno</strong></p>\r\n<p>Dados e informa&ccedil;&otilde;es coletados dos usu&aacute;rios s&atilde;o utilizados internamente para:</p>\r\n<ul>\r\n<li>Identificar os candidatos cadastrados para determinadas vagas;</li>\r\n<li>Cumprir ordem legal ou judicial.</li>\r\n</ul>\r\n<p><strong>Curr&iacute;culo</strong><br />O curr&iacute;culo ser&aacute; enviado aos recrutadores de cada vaga, para sele&ccedil;&atilde;o e &agrave; poss&iacute;vel contrata&ccedil;&atilde;o de pessoal.</p>\r\n<p>Apenas&nbsp;a Giraldi\'s Contabilidade ter&aacute; acesso aos dados pessoais dos candidatos: nome, endere&ccedil;o e telefone. Salvo em fase de processo seletivo, quando &eacute; necess&aacute;rio o atendimento com psic&oacute;logas indicadas pela Giraldi\'s Contabilidade, quando tamb&eacute;m ter&atilde;o acesso as demais informa&ccedil;&otilde;es profissionais de seu curr&iacute;culo.</p>\r\n<p><strong>Vagas e p&aacute;gina da empresa</strong></p>\r\n<p>Dados pessoais dos recrutadores n&atilde;o ser&atilde;o divulgados, salvo em casos excepcionais e com autoriza&ccedil;&atilde;o pr&eacute;via.</p>\r\n<p>As vagas podem ser divulgadas de forma eletr&ocirc;nica em m&iacute;dias sociais.</p>\r\n<ol start=\"4\">\r\n<li><strong>Altera&ccedil;&otilde;es a esta pol&iacute;tica</strong></li>\r\n</ol>\r\n<p>A&nbsp;Giraldi\'s Contabilidade poder&aacute; revisar esta Pol&iacute;tica de Privacidade periodicamente. N&atilde;o nos responsabilizamos por envio de notifica&ccedil;&atilde;o de altera&ccedil;&otilde;es em nossa Pol&iacute;tica de Privacidade, sendo de responsabilidade do candidato aceitar os termos sempre que cadastrar seu curr&iacute;culo em nosso formul&aacute;rio.</p>\r\n<p>&nbsp;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `missao_visao_valores`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `missao_visao_valores`
--

INSERT INTO `missao_visao_valores` (`icone_missao`, `imagem_missao`, `texto_missao`, `icone_visao`, `imagem_visao`, `texto_visao`, `icone_valores`, `imagem_valores`, `texto_valores`) VALUES
('', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `perguntas_frequentes`
--

CREATE TABLE `perguntas_frequentes` (
  `id_perguntas_frequentes` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `pergunta` varchar(255) DEFAULT NULL,
  `resposta` longtext DEFAULT NULL,
  `id_servicos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `redes_sociais`
--

CREATE TABLE `redes_sociais` (
  `id_redes_sociais` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `link` longtext DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  `icone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `servicos`
--

CREATE TABLE `servicos` (
  `id_servicos` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `resumo` longtext DEFAULT NULL,
  `descricao` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sobre`
--

CREATE TABLE `sobre` (
  `titulo` varchar(255) DEFAULT NULL,
  `resumo_texto` varchar(255) DEFAULT NULL,
  `texto` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `link` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sobre`
--

INSERT INTO `sobre` (`titulo`, `resumo_texto`, `texto`, `imagem`, `link`) VALUES
('', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `solucoes`
--

CREATE TABLE `solucoes` (
  `id_solucoes` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `periodo` varchar(50) NOT NULL,
  `id_servicos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tamanho_imagens`
--

CREATE TABLE `tamanho_imagens` (
  `id_tamanho_imagens` int(11) NOT NULL,
  `tabela` varchar(100) DEFAULT NULL,
  `campo` varchar(100) DEFAULT NULL,
  `largura` varchar(45) DEFAULT NULL,
  `altura` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tamanho_imagens`
--

INSERT INTO `tamanho_imagens` (`id_tamanho_imagens`, `tabela`, `campo`, `largura`, `altura`) VALUES
(1, 'banner', '#inputImagem', '1920', '800'),
(2, 'sobre', '#inputImagem', '570', '400'),
(3, 'missao_visao_valores', '#inputImagemMissao, #inputImagemVisao, #inputImagemValores', '370', '200'),
(4, 'equipe', '#inputImagem', '270', '260'),
(5, 'redes_sociais', '#inputImagem', '50', '50'),
(6, 'servicos', '#inputImagem', '380', '180'),
(7, 'clientes', '#inputImagem', '175', '175'),
(8, 'cases', '#inputImagem', '200', '200'),
(9, 'depoimentos', '#inputImagem', '100', '100'),
(10, 'galeria_imagem', '#inputImagem1, #inputImagem2, #inputImagem3, #inputImagem4, #inputImagem5', '1000', '720'),
(11, 'vitrine_subgrupo', '#inputImagemCapa', '500', '500'),
(12, 'vitrine_produto', '#inputImagem, #inputImagem1, #inputImagem2, #inputImagem3, #inputImagem4, #inputImagem5', '475', '511'),
(13, 'eventos', '#inputImagem', '500', '500'),
(14, 'blog_postagem', '#inputImagem, #inputImagemGaleria', '770', '420'),
(15, 'informacoes_gerais', '#inputLogoPrincipal', '200', '61'),
(17, 'titulos_personalizados', '#inputImagem', '196', '33'),
(18, 'autores', '#inputImagem', '85', '85');

-- --------------------------------------------------------

--
-- Table structure for table `titulos_personalizados`
--

CREATE TABLE `titulos_personalizados` (
  `id_titulos_personalizados` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `subtitulo` longtext DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `icone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nome` longtext DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `imagem_perfil` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nome`, `login`, `senha`, `imagem_perfil`, `status`) VALUES
(1, 'Web Dezan', 'webdezan', '7bb6fe52d89f19e81c0178ac2572c9ba', 'perfil-web-dezan.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario_cliente`
--

CREATE TABLE `usuario_cliente` (
  `id_usuario_cliente` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receber_novidades_email` int(11) DEFAULT NULL COMMENT '1-Sim\n0-Não',
  `status` int(11) DEFAULT NULL COMMENT '1-Ativo\n0-Inativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vitrine_grupo`
--

CREATE TABLE `vitrine_grupo` (
  `id_vitrine_grupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `imagem` longtext DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vitrine_produto`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vitrine_produto_cores`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `vitrine_subgrupo`
--

CREATE TABLE `vitrine_subgrupo` (
  `id_vitrine_subgrupo` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `nome_pagina` varchar(100) DEFAULT NULL,
  `imagem_capa` varchar(255) DEFAULT NULL,
  `url_amigavel` varchar(255) DEFAULT NULL,
  `id_vitrine_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acessos`
--
ALTER TABLE `acessos`
  ADD PRIMARY KEY (`id_acessos`);

--
-- Indexes for table `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autores`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id_banner`);

--
-- Indexes for table `blog_categorias`
--
ALTER TABLE `blog_categorias`
  ADD PRIMARY KEY (`id_blog_categorias`);

--
-- Indexes for table `blog_imagens`
--
ALTER TABLE `blog_imagens`
  ADD PRIMARY KEY (`id_blog_imagens`);

--
-- Indexes for table `blog_postagem`
--
ALTER TABLE `blog_postagem`
  ADD PRIMARY KEY (`id_blog_postagem`),
  ADD KEY `fk_blog_postagem_blog_categorias1_idx` (`id_blog_categorias`) USING BTREE,
  ADD KEY `fk_blog_postagem_autores1_idx` (`id_autores`) USING BTREE;

--
-- Indexes for table `blog_postagem_galeria`
--
ALTER TABLE `blog_postagem_galeria`
  ADD PRIMARY KEY (`id_blog_postagem_galeria`),
  ADD KEY `fk_blog_postagem_galeria_blog_postagem1_idx` (`id_blog_postagem`);

--
-- Indexes for table `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  ADD PRIMARY KEY (`id_blog_subcategorias`),
  ADD KEY `fk_blog_subcategorias_blog_categorias1_idx` (`id_blog_categorias`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
  ADD PRIMARY KEY (`id_cases`),
  ADD KEY `fk_cases_clientes1_idx` (`id_clientes`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`);

--
-- Indexes for table `contatos_recebidos`
--
ALTER TABLE `contatos_recebidos`
  ADD PRIMARY KEY (`id_contatos_recebidos`);

--
-- Indexes for table `conteudo_personalizado`
--
ALTER TABLE `conteudo_personalizado`
  ADD PRIMARY KEY (`id_conteudo_personalizado`);

--
-- Indexes for table `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD PRIMARY KEY (`id_depoimentos`),
  ADD KEY `fk_depoimentos_clientes1_idx` (`id_clientes`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id_enderecos`);

--
-- Indexes for table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id_equipe`);

--
-- Indexes for table `equipe_contato`
--
ALTER TABLE `equipe_contato`
  ADD PRIMARY KEY (`id_equipe_contato`),
  ADD KEY `fk_equipe_contato_equipe1_idx` (`id_equipe`);

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id_eventos`);

--
-- Indexes for table `galeria_grupo`
--
ALTER TABLE `galeria_grupo`
  ADD PRIMARY KEY (`id_galeria_grupo`);

--
-- Indexes for table `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  ADD PRIMARY KEY (`id_galeria_imagem`),
  ADD KEY `fk_galeria_item_galeria_grupo_idx` (`id_galeria_grupo`);

--
-- Indexes for table `informacoes`
--
ALTER TABLE `informacoes`
  ADD PRIMARY KEY (`id_informacoes`),
  ADD KEY `fk_informacoes_conteudo_personalizado1_idx` (`id_conteudo_personalizado`);

--
-- Indexes for table `perguntas_frequentes`
--
ALTER TABLE `perguntas_frequentes`
  ADD PRIMARY KEY (`id_perguntas_frequentes`),
  ADD KEY `fk_perguntas_frequentes_servicos1_idx` (`id_servicos`) USING BTREE;

--
-- Indexes for table `redes_sociais`
--
ALTER TABLE `redes_sociais`
  ADD PRIMARY KEY (`id_redes_sociais`);

--
-- Indexes for table `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id_servicos`);

--
-- Indexes for table `solucoes`
--
ALTER TABLE `solucoes`
  ADD PRIMARY KEY (`id_solucoes`),
  ADD KEY `fk_solucoes_servicos1_idx` (`id_servicos`) USING BTREE;

--
-- Indexes for table `tamanho_imagens`
--
ALTER TABLE `tamanho_imagens`
  ADD PRIMARY KEY (`id_tamanho_imagens`);

--
-- Indexes for table `titulos_personalizados`
--
ALTER TABLE `titulos_personalizados`
  ADD PRIMARY KEY (`id_titulos_personalizados`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- Indexes for table `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  ADD PRIMARY KEY (`id_usuario_cliente`);

--
-- Indexes for table `vitrine_grupo`
--
ALTER TABLE `vitrine_grupo`
  ADD PRIMARY KEY (`id_vitrine_grupo`);

--
-- Indexes for table `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  ADD PRIMARY KEY (`id_vitrine_produto`),
  ADD KEY `fk_vitrine_produto_vitrine_subgrupo1_idx` (`id_vitrine_subgrupo`);

--
-- Indexes for table `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  ADD PRIMARY KEY (`id_vitrine_produto_cores`),
  ADD KEY `fk_vitrine_produto_cores_vitrine_produto1_idx` (`id_vitrine_produto`);

--
-- Indexes for table `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  ADD PRIMARY KEY (`id_vitrine_subgrupo`),
  ADD KEY `fk_vitrine_subgrupo_vitrine_grupo1_idx` (`id_vitrine_grupo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acessos`
--
ALTER TABLE `acessos`
  MODIFY `id_acessos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id_banner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog_categorias`
--
ALTER TABLE `blog_categorias`
  MODIFY `id_blog_categorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_imagens`
--
ALTER TABLE `blog_imagens`
  MODIFY `id_blog_imagens` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_postagem`
--
ALTER TABLE `blog_postagem`
  MODIFY `id_blog_postagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `blog_postagem_galeria`
--
ALTER TABLE `blog_postagem_galeria`
  MODIFY `id_blog_postagem_galeria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  MODIFY `id_blog_subcategorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cases`
--
ALTER TABLE `cases`
  MODIFY `id_cases` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contatos_recebidos`
--
ALTER TABLE `contatos_recebidos`
  MODIFY `id_contatos_recebidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `conteudo_personalizado`
--
ALTER TABLE `conteudo_personalizado`
  MODIFY `id_conteudo_personalizado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `depoimentos`
--
ALTER TABLE `depoimentos`
  MODIFY `id_depoimentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id_enderecos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `equipe_contato`
--
ALTER TABLE `equipe_contato`
  MODIFY `id_equipe_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id_eventos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `galeria_grupo`
--
ALTER TABLE `galeria_grupo`
  MODIFY `id_galeria_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  MODIFY `id_galeria_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `informacoes`
--
ALTER TABLE `informacoes`
  MODIFY `id_informacoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `perguntas_frequentes`
--
ALTER TABLE `perguntas_frequentes`
  MODIFY `id_perguntas_frequentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `redes_sociais`
--
ALTER TABLE `redes_sociais`
  MODIFY `id_redes_sociais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id_servicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `solucoes`
--
ALTER TABLE `solucoes`
  MODIFY `id_solucoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tamanho_imagens`
--
ALTER TABLE `tamanho_imagens`
  MODIFY `id_tamanho_imagens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `titulos_personalizados`
--
ALTER TABLE `titulos_personalizados`
  MODIFY `id_titulos_personalizados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuario_cliente`
--
ALTER TABLE `usuario_cliente`
  MODIFY `id_usuario_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vitrine_grupo`
--
ALTER TABLE `vitrine_grupo`
  MODIFY `id_vitrine_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  MODIFY `id_vitrine_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  MODIFY `id_vitrine_produto_cores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  MODIFY `id_vitrine_subgrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_subcategorias`
--
ALTER TABLE `blog_subcategorias`
  ADD CONSTRAINT `fk_blog_subcategorias_blog_categorias1` FOREIGN KEY (`id_blog_categorias`) REFERENCES `blog_categorias` (`id_blog_categorias`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
  ADD CONSTRAINT `fk_cases_clientes1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `depoimentos`
--
ALTER TABLE `depoimentos`
  ADD CONSTRAINT `fk_depoimentos_clientes1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `equipe_contato`
--
ALTER TABLE `equipe_contato`
  ADD CONSTRAINT `fk_equipe_contato_equipe1` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `galeria_imagem`
--
ALTER TABLE `galeria_imagem`
  ADD CONSTRAINT `fk_galeria_item_galeria_grupo` FOREIGN KEY (`id_galeria_grupo`) REFERENCES `galeria_grupo` (`id_galeria_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `informacoes`
--
ALTER TABLE `informacoes`
  ADD CONSTRAINT `fk_informacoes_conteudo_personalizado1` FOREIGN KEY (`id_conteudo_personalizado`) REFERENCES `conteudo_personalizado` (`id_conteudo_personalizado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `solucoes`
--
ALTER TABLE `solucoes`
  ADD CONSTRAINT `fk_solucoes_servicos1` FOREIGN KEY (`id_servicos`) REFERENCES `servicos` (`id_servicos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vitrine_produto`
--
ALTER TABLE `vitrine_produto`
  ADD CONSTRAINT `fk_vitrine_produto_vitrine_subgrupo1` FOREIGN KEY (`id_vitrine_subgrupo`) REFERENCES `vitrine_subgrupo` (`id_vitrine_subgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vitrine_produto_cores`
--
ALTER TABLE `vitrine_produto_cores`
  ADD CONSTRAINT `fk_vitrine_produto_cores_vitrine_produto1` FOREIGN KEY (`id_vitrine_produto`) REFERENCES `vitrine_produto` (`id_vitrine_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `vitrine_subgrupo`
--
ALTER TABLE `vitrine_subgrupo`
  ADD CONSTRAINT `fk_vitrine_subgrupo_vitrine_grupo1` FOREIGN KEY (`id_vitrine_grupo`) REFERENCES `vitrine_grupo` (`id_vitrine_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
