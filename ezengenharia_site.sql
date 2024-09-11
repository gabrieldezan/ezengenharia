-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 11/09/2024 às 18:30
-- Versão do servidor: 10.6.18-MariaDB-cll-lve
-- Versão do PHP: 8.1.29

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
(1, 'Eloiza Zanoni', '<p style=\"text-align: justify;\">We will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p>', 'autor-202212210929.webp', 1);

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
(21, 'Post de teste 2', '<p style=\"text-align: justify;\">There are not many of passages of lorem ipsum available alteration in some form. Donec scelerisque dolor id nunc dictum, interdum gravida mauris rhoncus. Aliquam at ultrices nunc. In sem leo, fermentum at lorem in, porta finibus mauris. Lorem ipsum dolor sit amet, conse ctetur adipisicing elit sed do eiusm od tempor ut labore. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctornisi elit consequat ipsum. Lorem ipsum is simply free text used by copytyping refreshing. Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries. Lorem Ipsum is simply dummy text of the new design printng and type setting Ipsum Take a look at our round up of the best shows coming soon to your telly box has been the is industrys. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has industr standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of.</p>\r\n<p style=\"text-align: justify;\">Neque porro est qui dolorem ipsum quia quaed inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Aelltes port lacus quis enim var sed efficitur turpis gilla sed sit amet finibus eros. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the ndustry stan when an unknown printer took a galley.</p>', 'post de teste 2-202312131535.webp', '2023-12-13 15:35:29', '2023-12-13 15:34:00', '', 'post-de-teste-2', 0, 0, 4, 0, 1);

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
(14, 'Botão orçamento menu', 0, 0, '0', '0', 0, 1, 0, 0, 0);

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
(46, 'Projetos', 'fal fa-user-hard-hat', '', '<p>Nossa equipe altamente qualificada e experiente se empenha em fornecer planejamento detalhado e eficiente, alinhando as solu&ccedil;&otilde;es com a execu&ccedil;&atilde;o, priorizando sempre a economia e a seguran&ccedil;a.</p>', '', '0000-00-00', '00:00:00', 0, 12),
(47, 'Execução', 'fal fa-digging', '', '<p>Atrav&eacute;s de documentos como Or&ccedil;amento Anal&iacute;tico, Cronograma F&iacute;sico-financeiro, garantimos que sua obra ser&aacute; executada dentro do prazo e custo previstos, garantindo a qualidade e evitando qualquer imprevisito durante a execu&ccedil;&atilde;o.</p>', '', '0000-00-00', '00:00:00', 0, 12),
(48, 'Regularização', 'fal fa-file-signature', '', '<p>Com uma abordagem especializada e &aacute;gil, simplificamos processos burocr&aacute;ticos, atingindo a conformidade legal para seu im&oacute;vel de maneira eficaz e sem complica&ccedil;&otilde;es.</p>', '', '0000-00-00', '00:00:00', 0, 12),
(49, 'Imagem de fundo', '', 'imagem-de-fundo-paginas-internas-imagem-de-fundo-202312141831.webp', '', '', '0000-00-00', '00:00:00', 0, 13),
(50, 'JD Home Center', '', 'parceiros-jd-home-center-202312211803.webp', '', '', '0000-00-00', '00:00:00', 0, 11),
(51, 'Bonamigo Ferro e Aço', '', 'parceiros-bonamigo-ferro-e-aco-202312181813.webp', '', 'https://bonamigo.ind.br/', '0000-00-00', '00:00:00', 0, 11),
(52, 'Telhas Cascavel', '', 'parceiros-telhas-cascavel-202312181817.webp', '', '', '0000-00-00', '00:00:00', 0, 11),
(53, 'DZ Materiais Elétricos', '', 'parceiros-dz-materiais-eletricos-202312181825.webp', '', 'https://www.dzmateriaiseletricos.com.br/', '0000-00-00', '00:00:00', 0, 11),
(54, 'Hydrolar', '', 'parceiros-hydrolar-202312181829.webp', '', 'https://www.hydrolar.com.br/', '0000-00-00', '00:00:00', 0, 11),
(55, 'Estruturas de Solo', 'fal fa-solar-panel', '', '<p>Seguindo a via da sustentabilidade, nossa empresa fornece o servi&ccedil;o de instala&ccedil;&atilde;o de estruturas de solo para m&oacute;dulos solares. Neste servi&ccedil;o, a qualidade dos materiais e os alinhamentos s&atilde;o sempre nossa maior prioridade, trazendo garantia e tranquilidade para seu investimento.</p>', '', '0000-00-00', '00:00:00', 0, 12),
(56, 'FAZER ORÇAMENTO', '', '', '', 'https://contate.me/ezengenharia', '0000-00-00', '00:00:00', 0, 14);

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
('EZ Engenharia', 'EZ Engenharia', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour. Lorem are many variations of passages of Lorem Ipsum available, but the majority have suffered.', '(45) 99970-5116', '', '', 'contato@ezengenharia.com.br', 'contato@ezengenharia.com.br', '', '', '<!-- Google tag (gtag.js) -->\r\n<script async src=\"https://www.googletagmanager.com/gtag/js?id=G-Z3P5BVDG32\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'G-Z3P5BVDG32\');\r\n</script>', '', NULL, 'favicon-ez-engenharia-202312111414.webp', 'logo-ez-engenharia-202312111414.webp', '', '<p style=\"text-align: justify;\"><strong>Atualiza&ccedil;&atilde;o 11/01/2021</strong></p>\r\n<p style=\"text-align: justify;\">A&nbsp;<strong>EZ Engenharia&nbsp;</strong>tem como objetivo receber dados pessoais para contato com poss&iacute;veis clientes.&nbsp;A&nbsp;<strong>EZ Engenharia&nbsp;</strong>coleta, utiliza, mas n&atilde;o compartilha sua informa&ccedil;&atilde;o.</p>\r\n<p style=\"text-align: justify;\">Se tiver quaisquer d&uacute;vidas ou coment&aacute;rios relacionados a esta Pol&iacute;tica de Privacidade, fale conosco pelo endere&ccedil;o <strong>contato@ezengenharia.com.</strong><strong>br</strong>.</p>\r\n<p><strong>Atualiza&ccedil;&atilde;o 11/01/2021</strong></p>\r\n<p>A&nbsp;EZ Engenharia tem como objetivo receber curr&iacute;culos para as vagas disponibilizadas em m&iacute;dias sociais e outros canais. Os candidatos devem fornecer dados b&aacute;sicos para o cadastro no momento da sua candidatura. Esta pol&iacute;tica de privacidade descreve como e em que circunst&acirc;ncias a&nbsp;EZ Engenharia coleta, utiliza e compartilha sua informa&ccedil;&atilde;o quando da sua candidatura.</p>\r\n<p>Se tiver quaisquer d&uacute;vidas ou coment&aacute;rios relacionados a esta Pol&iacute;tica de Privacidade, fale conosco pelo endere&ccedil;o&nbsp;<strong>contato@ezengenharia.com.br</strong>.</p>\r\n<ol>\r\n<li><strong>Coleta de dados</strong></li>\r\n</ol>\r\n<p>Podemos coletar dados atrav&eacute;s do fornecimento volunt&aacute;rio de suas informa&ccedil;&otilde;es no formul&aacute;rio do site, ou ainda, podemos guardar os dados b&aacute;sicos da sua navega&ccedil;&atilde;o e intera&ccedil;&atilde;o com o site e ferramentas.</p>\r\n<p><strong>Para candidatos</strong></p>\r\n<p>Solicitamos informa&ccedil;&otilde;es b&aacute;sicas de contato no formul&aacute;rio no site, sendo necess&aacute;rio anexar seu curr&iacute;culo com as informa&ccedil;&otilde;es relacionadas &agrave; sua experi&ecirc;ncia profissional, escolaridade, habilidades profissionais etc. Essas informa&ccedil;&otilde;es s&atilde;o essenciais no processo seletivo da empresa.</p>\r\n<p><strong>Registro de atividades</strong></p>\r\n<p>A sua navega&ccedil;&atilde;o e intera&ccedil;&atilde;o tamb&eacute;m podem ser registrados, atrav&eacute;s de diversas tecnologias aplic&aacute;veis, para que seja poss&iacute;vel oferecer o melhor conte&uacute;do, orientar estat&iacute;sticas para melhoria e cria&ccedil;&atilde;o de novos produtos, assim como atender &agrave; necessidades legais e administrativas em caso de fraude ou ordem judicial.</p>\r\n<ol start=\"2\">\r\n<li><strong>Armazenamento e Transfer&ecirc;ncia de Dados</strong></li>\r\n</ol>\r\n<p><strong>Acesso aos dados</strong></p>\r\n<p>A&nbsp;EZ Engenharia n&atilde;o divulga ou compartilha dados pessoais privados do seu registro. Seus dados de acesso (inclusive e-mail), endere&ccedil;o etc., n&atilde;o ser&atilde;o fornecidos a terceiros, salvo em fase de processo seletivo, quando &eacute; necess&aacute;rio o atendimento com psic&oacute;logas indicadas pela&nbsp;EZ Engenharia, e com autoriza&ccedil;&atilde;o pr&eacute;via do usu&aacute;rio.</p>\r\n<p>Em virtude de ordens judiciais, ou de disposi&ccedil;&otilde;es legais e administrativas,&nbsp;a EZ Engenharia pode ser compelido a revelar informa&ccedil;&atilde;o &agrave;s autoridades ou terceiras partes.</p>\r\n<p><strong>Armazenamento</strong><br />Todos os dados coletados ser&atilde;o armazenados no banco de dados da EZ Engenharia em ambiente seguro, observadas as tecnologias dispon&iacute;veis.</p>\r\n<ol start=\"3\">\r\n<li><strong>Uso e divulga&ccedil;&atilde;o de Informa&ccedil;&otilde;es</strong></li>\r\n</ol>\r\n<p>A&nbsp;EZ Engenharia utiliza internamente os dados coletados.</p>\r\n<p><strong>Uso interno</strong></p>\r\n<p>Dados e informa&ccedil;&otilde;es coletados dos usu&aacute;rios s&atilde;o utilizados internamente para:</p>\r\n<ul>\r\n<li>Identificar os candidatos cadastrados para determinadas vagas;</li>\r\n<li>Cumprir ordem legal ou judicial.</li>\r\n</ul>\r\n<p><strong>Curr&iacute;culo</strong><br />O curr&iacute;culo ser&aacute; enviado aos recrutadores de cada vaga, para sele&ccedil;&atilde;o e &agrave; poss&iacute;vel contrata&ccedil;&atilde;o de pessoal.</p>\r\n<p>Apenas&nbsp;a EZ Engenharia ter&aacute; acesso aos dados pessoais dos candidatos: nome, endere&ccedil;o e telefone. Salvo em fase de processo seletivo, quando &eacute; necess&aacute;rio o atendimento com psic&oacute;logas indicadas pela EZ Engenharia, quando tamb&eacute;m ter&atilde;o acesso as demais informa&ccedil;&otilde;es profissionais de seu curr&iacute;culo.</p>\r\n<p><strong>Vagas e p&aacute;gina da empresa</strong></p>\r\n<p>Dados pessoais dos recrutadores n&atilde;o ser&atilde;o divulgados, salvo em casos excepcionais e com autoriza&ccedil;&atilde;o pr&eacute;via.</p>\r\n<p>As vagas podem ser divulgadas de forma eletr&ocirc;nica em m&iacute;dias sociais.</p>\r\n<ol start=\"4\">\r\n<li><strong>Altera&ccedil;&otilde;es a esta pol&iacute;tica</strong></li>\r\n</ol>\r\n<p>A&nbsp;EZ Engenharia poder&aacute; revisar esta Pol&iacute;tica de Privacidade periodicamente. N&atilde;o nos responsabilizamos por envio de notifica&ccedil;&atilde;o de altera&ccedil;&otilde;es em nossa Pol&iacute;tica de Privacidade, sendo de responsabilidade do candidato aceitar os termos sempre que cadastrar seu curr&iacute;culo em nosso formul&aacute;rio.</p>\r\n<p>&nbsp;</p>');

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
(1, 'Projetos elaborados', 76, '', 'far fa-drafting-compass', 1, 1),
(2, 'Área construída', 3861, 'm²', 'far fa-digging', 2, 1),
(3, 'Área regularizada ', 2034, 'm²', 'far fa-check-circle', 3, 1),
(4, 'Estruturas de solo', 1838, 'módulos', 'far fa-solar-panel', 4, 1);

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
(10, 'Instagram', 'https://instagram.com/engeloizanoni', '', 'fab fa-instagram');

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
  MODIFY `id_autores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id_blog_postagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
  MODIFY `id_contatos_recebidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `conteudo_personalizado`
--
ALTER TABLE `conteudo_personalizado`
  MODIFY `id_conteudo_personalizado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id_informacoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
