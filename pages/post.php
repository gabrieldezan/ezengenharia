<?php
$vsSqlPost = "
    SELECT
        bp.id_blog_postagem,
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
        DATE_FORMAT(data_publicacao, '%Y') AS ano_publicacao
    FROM
        blog_postagem bp
        LEFT JOIN autores a ON bp.id_autores = a.id_autores
    WHERE
        bp.status = 1 AND
        bp.data_publicacao < '$data_hora_atual' AND
        CONCAT(url_amigavel, '-', id_blog_postagem) = '$parametro'
";
$vrsExecutaPost = mysqli_query($Conexao, $vsSqlPost) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$vrsQntPost = mysqli_num_rows($vrsExecutaPost);

if ($vrsQntPost > 0) {
    $voResultadoPost = mysqli_fetch_object($vrsExecutaPost);

    $vsSqlView = "UPDATE blog_postagem SET visualizacoes = visualizacoes+1 WHERE url_amigavel= '$parametro'";
    mysqli_query($Conexao, $vsSqlView) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));

    $vsSqlPostsRelacionados = "SELECT titulo, imagem, url_amigavel, DATE_FORMAT(data_publicacao, '%d/%m/%Y') AS data_publicacao_formatada FROM blog_postagem WHERE data_publicacao < '$data_hora_atual' AND id_blog_postagem != '$voResultadoPost->id_blog_postagem' LIMIT 3";
    $vrsExecutaPostsRelacionados = mysqli_query($Conexao, $vsSqlPostsRelacionados) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
    $vrsQntPostsRelacionados = mysqli_num_rows($vrsExecutaPostsRelacionados);

    $vsSqlPostGaleria = "SELECT descricao, imagem FROM blog_postagem_galeria WHERE id_blog_postagem = '$voResultadoPost->id_blog_postagem'";
    $vrsExecutaPostGaleria = mysqli_query($Conexao, $vsSqlPostGaleria) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
    $vrsQntPostGaleria = mysqli_num_rows($vrsExecutaPostGaleria);
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
        <meta name="description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
        <meta property="og:title" content="<?php echo $voResultadoConfiguracoes->titulo ?>" />
        <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
        <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" />
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "post/" ?>" />
        <title><?php echo $voResultadoPost->titulo . " | " . $voResultadoConfiguracoes->titulo ?></title>
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
                            <li><span>Blog</span></li>
                        </ul>
                        <h2><?php echo $voResultadoPost->titulo ?></h2>
                    </div>
                </section>
            <?php
            }
            ?>

            <section class="blog_details">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8 col-lg-7">
                            <div class="blog_details_left">
                                <div class="blog_details_left_image">
                                    <img src="<?php echo URL . "wdadmin/uploads/blog_postagem/" . $voResultadoPost->imagem ?>" title="<?php echo $voResultadoPost->titulo ?>" alt="<?php echo $voResultadoPost->titulo ?>">
                                    <div class="blog_details_date_box">
                                        <p><?php echo $voResultadoPost->dia_publicacao ?><br><?php echo $voResultadoPost->mes_publicacao ?><br><?php echo $voResultadoPost->ano_publicacao ?></p>
                                    </div>
                                </div>
                                <div class="blog_details_content">
                                    <ul class="list-unstyled blog-details__meta">
                                        <li><?php echo "Por " . $voResultadoPost->autor ?></li>
                                    </ul>
                                    <div class="blog_details_title">
                                        <h3><?php echo $voResultadoPost->titulo ?></h3>
                                    </div>
                                    <div class="blog_details_text">
                                        <?php echo $voResultadoPost->texto ?>
                                    </div>
                                </div>
                                <?php if ($vrsQntPostGaleria > 0) { ?>
                                    <div class="thm-swiper__slider swiper-container" data-swiper-options='{"slidesPerView": 1, "loop": true, "autoplay": true, "autoplayHoverPause": true, "autoplayTimeout": 2500}'>
                                        <div class="swiper-wrapper">
                                            <?php while ($voResultadoPostGaleria = mysqli_fetch_object($vrsExecutaPostGaleria)) { ?>
                                                <div class="swiper-slide">
                                                    <img src="<?php echo URL . "wdadmin/uploads/blog_postagem_galeria/" . $voResultadoPostGaleria->imagem ?>" title="<?php echo $voResultadoPostGaleria->descricao ?>" alt="<?php echo $voResultadoPostGaleria->descricao ?>">
                                                </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                <?php } ?>
                                <div class="blog_detail__bottom">
                                    <div class="blog_detail__social-list">
                                        <span>Compartilhe essa postagem:</span>
                                        <a href="<?php echo "https://api.whatsapp.com/send?text=Veja a postagem: https://" . $_SERVER['HTTP_HOST'] . URL . "post/" . $parametro ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Whatsapp"><i class="fab fa-whatsapp"></i></a>
                                        <a href="<?php echo "https://facebook.com/sharer.php?u=https://" . $_SERVER['HTTP_HOST'] . URL . "post/" . $parametro . "title=" . $voResultadoPost->titulo ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Facebook"><i class="fab fa-facebook"></i></a>
                                        <a href="<?php echo "https://twitter.com/share?url=https://" . $_SERVER['HTTP_HOST'] . URL . "post/" . $parametro . "&title=" . $voResultadoPost->titulo ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Twitter"><i class="fab fa-twitter"></i></a>
                                        <a href="<?php echo "https://pinterest.com/pin/create/button/?url=https://" . $_SERVER['HTTP_HOST'] . URL . "post/" . $parametro . "&amp;media=" . URL . "wdadmin/uploads/blog_postagem/" . $voResultadoPost->imagem ?>&amp;description=<?php echo substr(strip_tags(trim($voResultadoPost->texto)), 0, strrpos(substr(strip_tags(trim($voResultadoPost->texto)), 0, 140), ' ')) . '...'; ?>" onclick="window.open(this.href, 'windowName', 'width=600, height=400, left=24, top=24, scrollbars, resizable'); return false;" rel="nofollow" target="blank" title="Pinterest"><i class="fab fa-pinterest"></i></a>
                                        <a href="<?php echo "https://linkedin.com/shareArticle?mini=true&url=https://" . $_SERVER['HTTP_HOST'] . URL . "post/" . $parametro . "&title=" . $voResultadoPost->titulo . "&summary=" . substr(strip_tags(trim($voResultadoPost->texto)), 0, strrpos(substr(strip_tags(trim($voResultadoPost->texto)), 0, 140), ' ')) . '...' . "&source=" . $voResultadoConfiguracoes->nome_empresa ?>" rel="nofollow" target="blank" title="Linkedin"><i class="fab fa-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <?php
                        // SIDEBAR
                        include 'php/sidebar-blog.php';
                        ?>

                    </div>
                </div>
            </section>

            <?php
            // FOOTER
            include 'php/footer.php';
            ?>

        </div>

        <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

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
