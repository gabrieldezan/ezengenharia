<?php
$vsSqlProjeto = "
    SELECT
        id_galeria_imagem,
        titulo,
        imagem1,
        imagem2,
        imagem3,
        imagem4,
        imagem5,
        descricao
    FROM
        galeria_imagem
    WHERE
        CONCAT(url_amigavel, '-', id_galeria_imagem) = '$parametro'
";
$vrsExecutaProjeto = mysqli_query($Conexao, $vsSqlProjeto) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$vrsQntProjeto = mysqli_num_rows($vrsExecutaProjeto);
if ($vrsQntProjeto > 0) {
    $voResultadoProjeto = mysqli_fetch_object($vrsExecutaProjeto);
?>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <?php
        // HEAD
        include 'php/head.php';
        ?>
        <meta name="robots" content="index, follow" />
        <meta name="googlebot" content="index, follow" />
        <meta name="description" content="<?php echo substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, 197), ' ')) . '...'; ?>" />
        <meta property="og:title" content="<?php echo $voResultadoProjeto->titulo . " | " . $voResultadoConfiguracoes->titulo ?>" />
        <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, 197), ' ')) . '...'; ?>" />
        <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/galeria_imagem/" . $voResultadoProjeto->imagem1 ?>" />
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "projeto/" . $parametro ?>" />
        <title><?php echo $voResultadoProjeto->titulo . " | " . $voResultadoConfiguracoes->titulo ?></title>
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
                            <li><span><?php echo $voResultadoProjeto->titulo ?></span></li>
                        </ul>
                        <h2><?php echo $voResultadoProjeto->titulo ?></h2>
                    </div>
                </section>
            <?php
            }
            ?>

            <section class="services_details">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8 col-lg-7">
                            <div class="services_details_right">
                                <div class="services_details_right_img">
                                    <div class="thm-swiper__slider swiper-container" data-swiper-options='{"spaceBetween": 100, "slidesPerView": 4, "autoplay": { "delay": 5000 }, "breakpoints": { "0": { "spaceBetween": 0, "slidesPerView": 1 }, "425": { "spaceBetween": 0, "slidesPerView": 1 }, "575": { "spaceBetween": 30, "slidesPerView": 1 }, "767": { "spaceBetween": 30, "slidesPerView": 1 }, "991": { "spaceBetween": 20, "slidesPerView": 1 }, "1289": { "spaceBetween": 20, "slidesPerView": 1 }, "1440": { "spaceBetween": 20, "slidesPerView": 1 } }, "navigation": { "nextEl": ".banner-slider-button-next", "prevEl": ".banner-slider-button-prev", "clickable": true }, "pagination": { "el": "#main-slider-pagination", "type": "bullets", "clickable": true }}'>
                                        <div class="swiper-wrapper">
                                            <div class="swiper-slide">
                                                <img src="<?php echo URL . "wdadmin/uploads/galeria_imagem/" . $voResultadoProjeto->imagem1 ?>" title="<?php echo $voResultadoProjeto->titulo ?>" alt="<?php echo $voResultadoProjeto->titulo ?>">
                                            </div>
                                            <?php if (!empty($voResultadoProjeto->imagem2)) { ?>
                                                <div class="swiper-slide">
                                                    <img src="<?php echo URL . "wdadmin/uploads/galeria_imagem/" . $voResultadoProjeto->imagem2 ?>" title="<?php echo $voResultadoProjeto->titulo ?>" alt="<?php echo $voResultadoProjeto->titulo ?>">
                                                </div>
                                            <?php }
                                            if (!empty($voResultadoProjeto->imagem3)) { ?>
                                                <div class="swiper-slide">
                                                    <img src="<?php echo URL . "wdadmin/uploads/galeria_imagem/" . $voResultadoProjeto->imagem3 ?>" title="<?php echo $voResultadoProjeto->titulo ?>" alt="<?php echo $voResultadoProjeto->titulo ?>">
                                                </div>
                                            <?php }
                                            if (!empty($voResultadoProjeto->imagem4)) { ?>
                                                <div class="swiper-slide">
                                                    <img src="<?php echo URL . "wdadmin/uploads/galeria_imagem/" . $voResultadoProjeto->imagem4 ?>" title="<?php echo $voResultadoProjeto->titulo ?>" alt="<?php echo $voResultadoProjeto->titulo ?>">
                                                </div>
                                            <?php }
                                            if (!empty($voResultadoProjeto->imagem5)) { ?>
                                                <div class="swiper-slide">
                                                    <img src="<?php echo URL . "wdadmin/uploads/galeria_imagem/" . $voResultadoProjeto->imagem5 ?>" title="<?php echo $voResultadoProjeto->titulo ?>" alt="<?php echo $voResultadoProjeto->titulo ?>">
                                                </div>
                                            <?php } ?>
                                        </div>
                                        <div class="swiper-pagination projeto" id="main-slider-pagination" style="color:black;"></div>
                                        <div class="banner-slider-nav">
                                            <div class="banner-slider-button-prev projeto-prev"><span class="far fa-long-arrow-alt-right"></span></div>
                                            <div class="banner-slider-button-next projeto-next"><span class="far fa-long-arrow-alt-right"></span> </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="services_details_right_text">
                                    <h4><?php echo $voResultadoProjeto->titulo ?></h4>
                                    <?php
                                    $vsSqlGrupos = "
                                        SELECT
                                            GROUP_CONCAT(DISTINCT gg.descricao SEPARATOR ' / ') AS descricao_grupos
                                        FROM
                                            galeria_grupo gg
                                            LEFT JOIN imagens_grupos ig ON ig.id_galeria_grupos = gg.id_galeria_grupo
                                        WHERE
                                            ig.id_galeria_imagem = $voResultadoProjeto->id_galeria_imagem
                                    ";
                                    $vrsExecutaGrupos = mysqli_query($Conexao, $vsSqlGrupos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                    while ($voResultadoGrupos = mysqli_fetch_object($vrsExecutaGrupos)) {
                                    ?>
                                        <span><?php echo $voResultadoGrupos->descricao_grupos ?></span>
                                    <?php
                                    }
                                    ?>
                                    <div>
                                        <?php echo $voResultadoProjeto->descricao; ?>
                                    </div>
                                </div>
                                <div class="blog_detail__bottom">
                                    <p>Compartilhe esse projeto:</p>
                                    <div class="blog_detail__social-list">
                                        <a href="<?php echo "https://api.whatsapp.com/send?text=Veja o projeto: https://" . $_SERVER['HTTP_HOST'] . URL . "projeto/" . $parametro ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Whatsapp"><i class="fab fa-whatsapp"></i></a>
                                        <a href="<?php echo "https://facebook.com/sharer.php?u=https://" . $_SERVER['HTTP_HOST'] . URL . "projeto/" . $parametro . "&title=" . $voResultadoProjeto->titulo ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Facebook"><i class="fab fa-facebook"></i></a>
                                        <a href="<?php echo "https://twitter.com/share?url=https://" . $_SERVER['HTTP_HOST'] . URL . "projeto/" . $parametro . "&title=" . $voResultadoProjeto->titulo ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                        <a href="<?php echo "https://pinterest.com/pin/create/button/?url=https://" . $_SERVER['HTTP_HOST'] . URL . "projeto/" . $parametro . "&amp;media=" . URL . "wdadmin/uploads/galeria_imagem/" . $voResultadoProjeto->imagem1 . "&amp;description=" . substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, 140), ' ')) . '...'; ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Pinterest"><i class="fab fa-pinterest"></i></a>
                                        <a href="<?php echo "https://linkedin.com/shareArticle?mini=true&url=https://" . $_SERVER['HTTP_HOST'] . URL . "projeto/" . $parametro . "&title=" . $voResultadoProjeto->titulo . '&summary=' . substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoProjeto->descricao)), 0, 140), ' ')) . '...' . "&source=" . $voResultadoConfiguracoes->nome_empresa ?>" rel="nofollow" target="blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-lg-5 mobile-hide">
                            <div class="sidebar">
                                <ul class="services_all_list list-unstyled">
                                    <?php
                                    $vsSqlCategoriasProjetos = "SELECT descricao, url_amigavel FROM galeria_grupo WHERE status = 1 ORDER BY descricao";
                                    $vrsExecutaCategoriasProjetos = mysqli_query($Conexao, $vsSqlCategoriasProjetos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                    while ($voResultadoCategoriasProjetos = mysqli_fetch_object($vrsExecutaCategoriasProjetos)) {
                                    ?>
                                        <li><a href="<?php echo URL . "portfolio" ?>"><?php echo $voResultadoCategoriasProjetos->descricao ?><span class="far fa-long-arrow-alt-right"></span></a></li>
                                    <?php
                                    }
                                    ?>
                                </ul>
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
<?php
} else {
    include "pages/404.php";
}
