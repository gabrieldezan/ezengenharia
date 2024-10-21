<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php
    // HEAD
    include 'php/head.php';
    ?>
    <meta name="robots" content="index, follow" />
    <meta name="googlebot" content="index, follow" />
    <meta name="description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>" />
    <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_secundaria ?>" />
    <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL ?>" />
    <title><?php echo $voResultadoConfiguracoes->titulo ?></title>
</head>

<body>

    <?php
    // PRELOADER
    include 'php/preloader.php';
    ?>

    <div class="page-wrapper">

        <?php
        // MENU
        include 'php/menu.php';
        ?>

        <section class="main-slider">
            <div class="swiper-container thm-swiper__slider" data-swiper-options='{"slidesPerView": 1, "loop": true, "effect": "fade", "pagination": { "el": "#main-slider-pagination", "type": "bullets", "clickable": true }, "navigation": { "nextEl": ".banner-slider-button-next", "prevEl": ".banner-slider-button-prev", "clickable": true }, "autoplay": { "delay": 5000 }}'>
                <div class="swiper-wrapper">
                    <?php
                    $vsSqlBanner = "SELECT imagem, titulo, link, link_nova_aba, texto_botao, orientacao_vertical_imagem, orientacao_horizontal_imagem FROM banner ORDER BY posicao";
                    $vrsExecutaBanner = mysqli_query($Conexao, $vsSqlBanner) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoBanner = mysqli_fetch_object($vrsExecutaBanner)) {
                    ?>
                        <div class="swiper-slide">
                            <div class="image-layer" style="<?php echo "background-position: " . $voResultadoBanner->orientacao_vertical_imagem . " " . $voResultadoBanner->orientacao_horizontal_imagem . '; background-image: url(' . URL . 'wdadmin/uploads/banner/' . $voResultadoBanner->imagem . ");" ?>"></div>
                            <div class="container">
                                <div class="swiper-slide-inner">
                                    <div class="row">
                                        <div class="col-xl-12">
                                            <h2><?php echo $voResultadoBanner->titulo ?></h2>
                                            <?php if (!empty($voResultadoBanner->link)) {
                                                if ($voResultadoBanner->link_nova_aba == 1) { ?>
                                                    <a target="_blank" href="<?php echo $voResultadoBanner->link ?>" class="thm-btn"><?php echo $voResultadoBanner->texto_botao ?></a>
                                                <?php } else if ($voResultadoBanner->link_nova_aba == 0) { ?>
                                                    <a href="<?php echo $voResultadoBanner->link ?>" class="thm-btn"><?php echo $voResultadoBanner->texto_botao ?></a>
                                                <?php
                                                }
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
                <div class="swiper-pagination" id="main-slider-pagination"></div>
                <div class="banner-slider-nav">
                    <div class="banner-slider-button-prev"><span class="far fa-long-arrow-alt-right"></span></div>
                    <div class="banner-slider-button-next"><span class="far fa-long-arrow-alt-right"></span></div>
                </div>
            </div>
        </section>

        <section class="our_services_one">
            <div class="container">
                <div class="block-title text-center">
                    <?php
                    $vsSqlTituloAreasAtuacao = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 8";
                    $vrsExecutaTituloAreasAtuacao = mysqli_query($Conexao, $vsSqlTituloAreasAtuacao) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoTituloAreasAtuacao = mysqli_fetch_object($vrsExecutaTituloAreasAtuacao)) {
                        if (!empty($voResultadoTituloAreasAtuacao->subtitulo)) {
                        ?>
                            <h4><?php echo $voResultadoTituloAreasAtuacao->subtitulo ?></h4>
                        <?php
                        }
                        ?>
                        <h2><?php echo $voResultadoTituloAreasAtuacao->titulo ?></h2>
                    <?php
                    }
                    ?>
                </div>
                <div class="row">
                    <?php
                    $vsSqlAreasAtuacao = "SELECT titulo, texto, icone FROM informacoes WHERE id_conteudo_personalizado = 12";
                    $vrsExecutaAreasAtuacao = mysqli_query($Conexao, $vsSqlAreasAtuacao) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    $vrsQntAreasAtuacao = mysqli_num_rows($vrsExecutaAreasAtuacao);
                    while ($voResultadoAreasAtuacao = mysqli_fetch_object($vrsExecutaAreasAtuacao)) {
                        if ($vrsQntAreasAtuacao == 2) {
                            $numeroItens = 6;
                        } else if ($vrsQntAreasAtuacao == 3 || $vrsQntAreasAtuacao == 5 || $vrsQntAreasAtuacao == 6) {
                            $numeroItens = 4;
                        } else if ($vrsQntAreasAtuacao == 4 || $vrsQntAreasAtuacao == 7 || $vrsQntAreasAtuacao == 8) {
                            $numeroItens = 3;
                        } else {
                            $numeroItens = 4;
                        }
                        ?>
                        <div class="<?php echo "col-6 col-xl-" . $numeroItens . " col-lg-" . $numeroItens ?>">
                            <div class="our_services_one_single wow fadeInUp">
                                <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoAreasAtuacao->icone) . '"></i>'; ?>
                                <div class="our_services_one_content">
                                    <h3><?php echo $voResultadoAreasAtuacao->titulo ?></h3>
                                    <p><?php echo strip_tags($voResultadoAreasAtuacao->texto) ?></p>
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </section>

        <section class="counter_two three" style="background-image: url(<?php echo URL . 'assets/images/counter_two_bg.webp' ?>)">
            <div class="container">
                <ul class="counter_two_box list-unstyled">
                    <?php
                    $vsSqlMetricas = "SELECT titulo, numero, medida, icone FROM metricas WHERE status = 1";
                    $vrsExecutaMetricas = mysqli_query($Conexao, $vsSqlMetricas) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoMetricas = mysqli_fetch_object($vrsExecutaMetricas)) {
                    ?>
                        <div class="counter_two_single wow fadeInLeft" data-wow-delay="100ms" data-wow-duration="1500ms">
                            <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoMetricas->icone) . '"></i>' ?>
                            <h2>
                                <span class="counter"><?php echo $voResultadoMetricas->numero ?></span>
                                <?php if (!empty($voResultadoMetricas->medida)) {
                                    echo $voResultadoMetricas->medida;
                                } ?>
                            </h2>
                            <div class="titulo-metrica">
                                <p><?php echo $voResultadoMetricas->titulo ?></p>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </ul>
            </div>
        </section>

        <section class="brand-one">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="block-title text-center">
                            <?php
                            $vsSqlTituloParceiros = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 9";
                            $vrsExecutaTituloParceiros = mysqli_query($Conexao, $vsSqlTituloParceiros) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoTituloParceiros = mysqli_fetch_object($vrsExecutaTituloParceiros)) {
                                if (!empty($voResultadoTituloParceiros->subtitulo)) {
                                ?>
                                    <h4><?php echo $voResultadoTituloParceiros->subtitulo ?></h4>
                                <?php
                                }
                                ?>
                                <h2><?php echo $voResultadoTituloParceiros->titulo ?></h2>
                            <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="brand-one__carousel owl-carousel thm__owl-carousel owl-theme" data-options='{"loop": true, "autoplay": true, "autoplayHoverPause": true, "autoplayTimeout": 2000, "items": 5, "dots": false, "nav": false, "margin": 140, "smartSpeed": 700, "responsive": { "0": {"items": 1, "margin": 30}, "480": {"items": 3, "margin": 30}, "991": {"items": 4, "margin": 50}, "1199": {"items": 4, "margin": 100}}}'>
                        <?php
                        $vsSqlParceiros = "SELECT i.titulo, i.imagem, i.link, cp.imagem_largura, cp.imagem_altura FROM informacoes i, conteudo_personalizado cp WHERE i.id_conteudo_personalizado = 11 AND cp.id_conteudo_personalizado = 11";
                        $vrsExecutaParceiros = mysqli_query($Conexao, $vsSqlParceiros) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                        while ($voResultadoParceiros = mysqli_fetch_object($vrsExecutaParceiros)) {
                        ?>
                            <div class="item">
                                <?php if (!empty($voResultadoParceiros->link)) { ?>
                                    <a target="_blank" href="<?php echo $voResultadoParceiros->link ?>">
                                        <img loading="lazy" src="<?php echo URL . "wdadmin/uploads/informacoes/" . $voResultadoParceiros->imagem ?>" title="<?php echo $voResultadoParceiros->titulo ?>" alt="<?php echo $voResultadoParceiros->titulo ?>" width="<?php echo $voResultadoParceiros->imagem_largura ?>" height="<?php echo $voResultadoParceiros->imagem_altura ?>">
                                    </a>
                                <?php } else { ?>
                                    <img loading="lazy" src="<?php echo URL . "wdadmin/uploads/informacoes/" . $voResultadoParceiros->imagem ?>" title="<?php echo $voResultadoParceiros->titulo ?>" alt="<?php echo $voResultadoParceiros->titulo ?>" width="<?php echo $voResultadoParceiros->imagem_largura ?>" height="<?php echo $voResultadoParceiros->imagem_altura ?>">
                                <?php } ?>
                            </div>
                        <?php
                        }
                        ?>
                    </div>
                </div>
            </div>
        </section>

        <section class="our_projects_one">
            <div class="container">
                <div class="block-title text-center">
                    <?php
                    $vsSqlTituloProjetos = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 10";
                    $vrsExecutaTituloProjetos = mysqli_query($Conexao, $vsSqlTituloProjetos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoTituloProjetos = mysqli_fetch_object($vrsExecutaTituloProjetos)) {
                        if (!empty($voResultadoTituloProjetos->subtitulo)) {
                        ?>
                            <h4><?php echo $voResultadoTituloProjetos->subtitulo ?></h4>
                        <?php
                        }
                        ?>
                        <h2><?php echo $voResultadoTituloProjetos->titulo ?></h2>
                    <?php
                    }
                    ?>
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="owl-carousel thm__owl-carousel owl-theme" data-options='{"loop": true, "autoplay": true, "autoplayHoverPause": true, "autoplayTimeout": 1500, "items": 3, "dots": false, "nav": false, "margin": 140, "smartSpeed": 700, "responsive": { "0": {"items": 2, "margin": 30}, "480": {"items": 2, "margin": 30}, "991": {"items": 2, "margin": 50}, "1199": {"items": 3, "margin": 70}}}'>
                            <?php
                            $vsSqlProjetos = "
                                SELECT
                                    gi.id_galeria_imagem,
                                    gi.titulo,
                                    gi.imagem1,
                                    ti.largura_thumb,
                                    ti.altura_thumb,
                                    CONCAT(gi.url_amigavel, '-', gi.id_galeria_imagem) AS url_projeto
                                FROM
                                    galeria_imagem gi,
                                    tamanho_imagens ti
                                WHERE
                                    ti.id_tamanho_imagens = 10
                                ORDER BY
                                    rand()
                                LIMIT 9
                            ";
                            $vrsExecutaProjetos = mysqli_query($Conexao, $vsSqlProjetos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoProjetos = mysqli_fetch_object($vrsExecutaProjetos)) {
                                $imagemProjetos = explode(".", $voResultadoProjetos->imagem1);
                                    if (file_exists("wdadmin/uploads/galeria_imagem/" . $imagemProjetos[0] . "-thumb.webp")) {
                                        $imagemProjetosThumb = $imagemProjetos[0] . "-thumb.webp";
                                    } else {
                                        $imagemProjetosThumb = $voResultadoProjetos->imagem1;
                                    }
                                $vsSqlGrupos = "
                                    SELECT
                                        GROUP_CONCAT(DISTINCT gg.descricao SEPARATOR ' / ') AS descricao_grupos
                                    FROM
                                        galeria_grupo gg
                                        LEFT JOIN imagens_grupos ig ON ig.id_galeria_grupos = gg.id_galeria_grupo
                                    WHERE
                                        ig.id_galeria_imagem = $voResultadoProjetos->id_galeria_imagem
                                ";
                                $vrsExecutaGrupos = mysqli_query($Conexao, $vsSqlGrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                while ($voResultadoGrupos = mysqli_fetch_object($vrsExecutaGrupos)) {
                                ?>
                                    <div class="item">
                                        <div class=" our_projects_one_single">
                                            <div class="our_projects_one_image">
                                                <img loading="lazy" src="<?php echo URL . "wdadmin/uploads/galeria_imagem/" . $imagemProjetosThumb ?>" title="<?php echo $voResultadoProjetos->titulo ?>" alt="<?php echo $voResultadoProjetos->titulo ?>" width="<?php echo $voResultadoProjetos->largura_thumb ?>" height="<?php echo $voResultadoProjetos->altura_thumb ?>">
                                                <a href="<?php echo URL . "projeto/" . $voResultadoProjetos->url_projeto ?>" title="<?php echo "Visualizar " . $voResultadoProjetos->titulo ?>">
                                                    <div class="our_projects_one_icon">
                                                        <span class="far fa-plus"></span>
                                                    </div>
                                                </a>
                                                <div class="our_projects_one_text">
                                                    <h4>
                                                        <a href="<?php echo URL . "projeto/" . $voResultadoProjetos->url_projeto ?>"><?php echo $voResultadoProjetos->titulo ?></a>
                                                    </h4>
                                                    <span><?php echo $voResultadoGrupos->descricao_grupos ?></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php
                                }
                            }
                            ?>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <a class="thm-btn" href="<?php echo URL . "portfolio" ?>">Ver mais</a>
                    </div>
                </div>
            </div>
        </section>

        <section class="testimonails_two" style="background-image: url(<?php echo URL . 'assets/images/testimonails_2-bg.webp' ?>)">
            <div class="container">
                <div class="block-title text-center">
                    <?php
                    $vsSqlTituloClientes = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 11";
                    $vrsExecutaTituloClientes = mysqli_query($Conexao, $vsSqlTituloClientes) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoTituloClientes = mysqli_fetch_object($vrsExecutaTituloClientes)) {
                        if (!empty($voResultadoTituloClientes->subtitulo)) {
                        ?>
                            <h4><?php echo $voResultadoTituloClientes->subtitulo ?></h4>
                        <?php
                        }
                        ?>
                        <h2><?php echo $voResultadoTituloClientes->titulo ?></h2>
                    <?php
                    }
                    ?>
                </div>
                <div class="row">
                    <div class="col-xl-12">
                        <div class="thm-swiper__slider swiper-container" data-swiper-options='{"loop": true, "spaceBetween": 100, "slidesPerView": 4, "autoplay": { "delay": 2000 }, "breakpoints": { "0": { "spaceBetween": 0, "slidesPerView": 1 }, "425": { "spaceBetween": 0, "slidesPerView": 1 }, "575": { "spaceBetween": 30, "slidesPerView": 2 }, "767": { "spaceBetween": 30, "slidesPerView": 2 }, "991": { "spaceBetween": 20, "slidesPerView": 2 }, "1289": { "spaceBetween": 20, "slidesPerView": 2 }, "1440": { "spaceBetween": 20, "slidesPerView": 2 } }}'>
                            <div class="swiper-wrapper">
                                <?php
                                $vsSqlDepoimentos = "SELECT d.nome, d.texto, d.empresa, d.imagem, ti.largura, ti.altura FROM depoimentos d, tamanho_imagens ti WHERE ti.id_tamanho_imagens = 9 ORDER BY rand()";
                                $vrsExecutaDepoimentos = mysqli_query($Conexao, $vsSqlDepoimentos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                while ($voResultadoDepoimentos = mysqli_fetch_object($vrsExecutaDepoimentos)) {
                                ?>
                                    <div class="swiper-slide">
                                        <div class="testimonails_two_single">
                                            <div class="testimonails_two_quote_icon"><i class="fa fa-quote-left"></i></div>
                                            <div class="testimonails_two_text">
                                                <p><?php echo $voResultadoDepoimentos->texto ?></p>
                                            </div>
                                            <div class="testimonails_two_client_name">
                                                <h3><?php echo $voResultadoDepoimentos->nome ?></h3>
                                                <?php if (!empty($voResultadoDepoimentos->empresa)) { ?>
                                                    <p><?php echo $voResultadoDepoimentos->empresa ?></p>
                                                <?php } ?>
                                            </div>
                                            <div class="testimonails_two_image">
                                                <img loading="lazy" src="<?php echo URL . "wdadmin/uploads/depoimentos/" . $voResultadoDepoimentos->imagem ?>" title="<?php echo $voResultadoDepoimentos->nome ?>" alt="<?php echo $voResultadoDepoimentos->nome ?>" width="<?php echo $voResultadoDepoimentos->largura ?>" height="<?php echo $voResultadoDepoimentos->altura ?>">
                                            </div>
                                        </div>
                                    </div>
                                <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="welcome_one">
            <div class="welcome_one_shape_bg" style="background-image: url(<?php echo URL . 'assets/images/welcome_one_shape-bg.webp' ?>)"></div>
            <div class="container">
                <div class="row">
                    <?php
                    $vsSqlSobre = "SELECT s.imagem, s.texto, ti.largura, ti.altura FROM sobre s, tamanho_imagens ti WHERE ti.id_tamanho_imagens = 2";
                    $vrsExecutaSobre = mysqli_query($Conexao, $vsSqlSobre) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoSobre = mysqli_fetch_object($vrsExecutaSobre)) {
                    ?>
                        <div class="col-xl-6">
                            <div class="welcome_one_left">
                                <div class="welcome_one_left_image">
                                    <img loading="lazy" src="<?php echo URL . "wdadmin/uploads/sobre/" . $voResultadoSobre->imagem ?>" title="<?php echo "Sobre a " . $voResultadoConfiguracoes->nome_empresa ?>" alt="<?php echo "Sobre a " . $voResultadoConfiguracoes->nome_empresa ?>" width="<?php echo $voResultadoSobre->largura ?>" height="<?php echo $voResultadoSobre->altura ?>">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="welcome_one_right_content">
                                <div class="block-title text-left">
                                    <?php
                                    $vsSqlTituloSobre = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 12";
                                    $vrsExecutaTituloSobre = mysqli_query($Conexao, $vsSqlTituloSobre) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                    while ($voResultadoTituloSobre = mysqli_fetch_object($vrsExecutaTituloSobre)) {
                                        if (!empty($voResultadoTituloSobre->subtitulo)) {
                                        ?>
                                            <h4><?php echo $voResultadoTituloSobre->subtitulo ?></h4>
                                        <?php
                                        }
                                        ?>
                                        <h2><?php echo $voResultadoTituloSobre->titulo ?></h2>
                                    <?php
                                    }
                                    ?>
                                </div>
                                <div class="welcome_one_right_text_box">
                                    <?php echo $voResultadoSobre->texto ?>
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </section>

        <?php
        $vsSqlCountBlog = "SELECT COUNT(*) AS numero_posts FROM blog_postagem WHERE status = 1 AND data_publicacao < '$data_hora_atual'";
        $vrsExecutaCountBlog = mysqli_query($Conexao, $vsSqlCountBlog) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
        while ($voResultadoCountBlog = mysqli_fetch_object($vrsExecutaCountBlog)) {
            if ($voResultadoCountBlog->numero_posts > 0) {
            ?>
                <section class="blog_one">
                    <div class="container">
                        <div class="block-title text-center">
                            <?php
                            $vsSqlTituloBlog = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 13";
                            $vrsExecutaTituloBlog = mysqli_query($Conexao, $vsSqlTituloBlog) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoTituloBlog = mysqli_fetch_object($vrsExecutaTituloBlog)) {
                                if (!empty($voResultadoTituloBlog->subtitulo)) {
                            ?>
                                    <h4><?php echo $voResultadoTituloBlog->subtitulo ?></h4>
                                <?php
                                }
                                ?>
                                <h2><?php echo $voResultadoTituloBlog->titulo ?></h2>
                            <?php
                            }
                            ?>
                        </div>
                        <div class="row">
                            <?php
                            $vsSqlBlogHome = "
                                SELECT
                                    bp.titulo,
                                    bp.texto,
                                    bp.imagem,
                                    a.nome AS autor,
                                    CONCAT(url_amigavel, '-', id_blog_postagem) AS url_publicacao,
                                    DATE_FORMAT(data_publicacao, '%d') AS dia_publicacao,
                                    CASE (DATE_FORMAT(data_publicacao, '%M'))
                                        WHEN 'January' THEN 'Fev'
                                        WHEN 'February' THEN 'Fev'
                                        WHEN 'March' THEN 'Mar'
                                        WHEN 'April' THEN 'Abr'
                                        WHEN 'May' THEN 'Mai'
                                        WHEN 'June' THEN 'Jun'
                                        WHEN 'July' THEN 'Jul'
                                        WHEN 'August' THEN 'Ago'
                                        WHEN 'September' THEN 'Set'
                                        WHEN 'October' THEN 'Out'
                                        WHEN 'November' THEN 'Nov'
                                        WHEN 'December' THEN 'Dez'
                                    END AS mes_publicacao,
                                    DATE_FORMAT(data_publicacao, '%Y') AS ano_publicacao,
                                    ti.largura_thumb,
                                    ti.altura_thumb
                                FROM
                                    tamanho_imagens ti,
                                    blog_postagem bp                                    
                                    LEFT JOIN autores a ON bp.id_autores = a.id_autores
                                WHERE
                                    bp.status = 1 AND
                                    bp.data_publicacao < '$data_hora_atual' AND
                                    ti.id_tamanho_imagens = 14
                                ORDER BY
                                    bp.data_publicacao DESC
                                LIMIT 3
                            ";
                            $vrsExecutaBlogHome = mysqli_query($Conexao, $vsSqlBlogHome) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoBlogHome = mysqli_fetch_object($vrsExecutaBlogHome)) {
                                $imagemBlog = explode(".", $voResultadoBlogHome->imagem);
                                if (file_exists("wdadmin/uploads/blog_postagem/" . $imagemBlog[0] . "-thumb.webp")) {
                                    $imagemBlogThumb = $imagemBlog[0] . "-thumb.webp";
                                } else {
                                    $imagemBlogThumb = $voResultadoBlogHome->imagem;
                                }
                                ?>
                                <div class="col-xl-4 col-lg-4">
                                    <div class="blog_one_single wow fadeInLeft" data-wow-duration="1500ms" data-wow-delay="0ms">
                                        <div class="blog_one_image">
                                            <img src="<?php echo URL . "wdadmin/uploads/blog_postagem/" . $imagemBlogThumb ?>" title="<?php echo $voResultadoBlogHome->titulo ?>" alt="<?php echo $voResultadoBlogHome->titulo ?>" width="<?php echo $voResultadoBlogHome->largura_thumb ?>" height="<?php echo $voResultadoBlogHome->altura_thumb ?>">
                                            <div class="blog_one_date_box">
                                                <p><?php echo $voResultadoBlogHome->dia_publicacao ?><br><?php echo $voResultadoBlogHome->mes_publicacao ?><br><?php echo $voResultadoBlogHome->ano_publicacao ?></p>
                                            </div>
                                        </div>
                                        <div class="blog-one__content">
                                            <ul class="list-unstyled blog-one__meta">
                                                <li><?php echo "Por " . $voResultadoBlogHome->autor ?></li>
                                            </ul>
                                            <div class="blog_one_title">
                                                <h3><a href="<?php echo URL . "post/" . $voResultadoBlogHome->url_publicacao ?>"><?php echo $voResultadoBlogHome->titulo ?></a></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php
                            }
                            ?>
                        </div>
                    </div>
                </section>
            <?php
            }
        }

        // FOOTER
        include 'php/footer.php';
        ?>

    </div>

    <?php
    // MENU MOBILE
    include 'php/menu-mobile.php';

    // CSS
    include 'php/css.php';

    // SCRIPTS
    include 'php/scripts.php';
    ?>

    <script>
        function projectMasonaryLayout() {
            if ($(".masonry-layout").length && $(".masonry-layout").isotope({
                    layoutMode: "masonry"
                }), $(".post-filter").length) {
                var t = function(t) {
                    $(".post-filter li").removeClass("active"), $(".post-filter li[data-filter='" + t + "']").addClass("active"), $(".filter-layout").imagesLoaded(function() {
                        $(".filter-layout").isotope({
                            filter: t,
                            animationOptions: {
                                duration: 500,
                                easing: "linear",
                                queue: !1
                            }
                        })
                    })
                };
                $(".post-filter li").children(".filter-text").on("click", function() {
                    var a = $(this).parent().attr("data-filter");
                    return t(a), !1
                }), t(".todos")
            }
            $(".post-filter.has-dynamic-filters-counter").length && $(".post-filter li").each(function() {
                $(this).attr("data-filter")
            })
        }
        projectMasonaryLayout();
    </script>

</body>

</html>