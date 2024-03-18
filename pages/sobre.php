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
    <meta property="og:title" content="<?php echo "Sobre | " . $voResultadoConfiguracoes->titulo ?>" />
    <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" />
    <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "sobre" ?>" />
    <title><?php echo "Sobre | " . $voResultadoConfiguracoes->titulo ?></title>
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

        $vsSqlImagemFundo = "SELECT imagem FROM informacoes WHERE id_conteudo_personalizado = 13 LIMIT 1";
        $vrsExecutaImagemFundo = mysqli_query($Conexao, $vsSqlImagemFundo) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
        while ($voResultadoImagemFundo = mysqli_fetch_object($vrsExecutaImagemFundo)) {
        ?>
            <section class="page-header" style="background-image: url(<?php echo URL . 'wdadmin/uploads/informacoes/' . $voResultadoImagemFundo->imagem ?>);">
                <div class="container">
                    <ul class="thm-breadcrumb list-unstyled">
                        <li><a href="<?php echo URL ?>">Home</a></li>
                        <li><span>Sobre</span></li>
                    </ul>
                    <h2>Sobre</h2>
                </div>
            </section>
        <?php
        }
        ?>

        <section class="welcome_one">
            <div class="welcome_one_shape_bg" style="background-image: url(<?php echo URL . 'assets/images/resources/welcome_one_shape-bg.png' ?>)"></div>
            <div class="container">
                <div class="row">
                    <?php
                    $vsSqlSobre = "SELECT texto, imagem FROM sobre";
                    $vrsExecutaSobre = mysqli_query($Conexao, $vsSqlSobre) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoSobre = mysqli_fetch_object($vrsExecutaSobre)) {
                    ?>
                        <div class="col-xl-6">
                            <div class="welcome_one_left">
                                <div class="welcome_one_left_image">
                                    <img src="<?php echo URL . "wdadmin/uploads/sobre/" . $voResultadoSobre->imagem ?>" title="<?php echo "Sobre a " . $voResultadoConfiguracoes->nome_empresa ?>" alt="<?php echo "Sobre a " . $voResultadoConfiguracoes->nome_empresa ?>">
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

        <section class="counter_two three" style="background-image: url(<?php echo URL . 'assets/images/resources/counter_two_bg.jpg' ?>)">
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

        <section class="four_boxes">
            <div class="container">
                <div class="row justify-content-center">
                    <?php
                    $vsSqlMVV = "SELECT texto_missao, icone_missao, texto_visao, icone_visao, texto_valores, icone_valores FROM missao_visao_valores";
                    $vrsExecutaMVV = mysqli_query($Conexao, $vsSqlMVV) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoMVV = mysqli_fetch_object($vrsExecutaMVV)) {
                    ?>
                        <div class="col-xl-6 col-lg-6 col-md-6">
                            <div class="missao four_boxes_single wow fadeInUp" data-wow-delay="100ms" data-wow-duration="1500ms">
                                <div class="four_boxes_icon">
                                    <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoMVV->icone_missao) . '"></i>' ?>
                                </div>
                                <div class="four_boxes_content">
                                    <h3>Missão</h3>
                                    <p><?php echo $voResultadoMVV->texto_missao ?></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6">
                            <div class="visao four_boxes_single wow fadeInUp" data-wow-delay="200ms" data-wow-duration="1500ms">
                                <div class="four_boxes_icon">
                                    <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoMVV->icone_visao) . '"></i>' ?>
                                </div>
                                <div class="four_boxes_content">
                                    <h3>Visão</h3>
                                    <p><?php echo $voResultadoMVV->texto_visao ?></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6">
                            <div class="four_boxes_single wow fadeInUp" data-wow-delay="300ms" data-wow-duration="1500ms">
                                <div class="four_boxes_icon">
                                    <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoMVV->icone_valores) . '"></i>' ?>
                                </div>
                                <div class="four_boxes_content">
                                    <h3>Valores</h3>
                                    <p><?php echo $voResultadoMVV->texto_valores ?></p>
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </section>

        <section class="testimonails_two" style="background-image: url(<?php echo URL . 'assets/images/testimonials/testimonails_2-bg.jpg' ?>)">
            <div class="container">
                <div class="block-title text-center">
                    <?php
                    $vsSqlTituloClientes = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 11";
                    $vrsExecutaTituloClientes = mysqli_query($Conexao, $vsSqlTituloClientes) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoTituloClientes = mysqli_fetch_object($vrsExecutaTituloClientes)) {
                    ?>
                        <h4><?php echo $voResultadoTituloClientes->titulo ?></h4>
                        <h2><?php echo $voResultadoTituloClientes->subtitulo ?></h2>
                    <?php
                    }
                    ?>
                </div>
                <div class="row">
                    <div class="col-xl-12">
                        <div class="thm-swiper__slider swiper-container" data-swiper-options='{"spaceBetween": 100, "slidesPerView": 4, "autoplay": { "delay": 2000 }, "breakpoints": { "0": { "spaceBetween": 0, "slidesPerView": 1 }, "425": { "spaceBetween": 0, "slidesPerView": 1 }, "575": { "spaceBetween": 30, "slidesPerView": 2 }, "767": { "spaceBetween": 30, "slidesPerView": 2 }, "991": { "spaceBetween": 20, "slidesPerView": 2 }, "1289": { "spaceBetween": 20, "slidesPerView": 2 }, "1440": { "spaceBetween": 20, "slidesPerView": 2 } }}'>
                            <div class="swiper-wrapper">
                                <?php
                                $vsSqlDepoimentos = "SELECT nome, texto, empresa, imagem FROM depoimentos ORDER BY RAND()";
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
                                                <img src="<?php echo URL . "wdadmin/uploads/depoimentos/" . $voResultadoDepoimentos->imagem ?>" title="<?php echo $voResultadoDepoimentos->nome ?>" alt="<?php echo $voResultadoDepoimentos->nome ?>">
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

        <?php
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

</body>

</html>