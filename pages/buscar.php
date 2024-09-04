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
    <meta property="og:title" content="<?php echo "Blog | " . $voResultadoConfiguracoes->titulo ?>" />
    <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" />
    <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "blog" ?>" />
    <title><?php echo "Blog | " . $voResultadoConfiguracoes->titulo ?></title>
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
                <h2>Blog</h2>
            </div>
        </section>
        <?php
        }
        ?>

        <section class="blog_one blog-page">
            <div class="container">
                <div class="row">
                    <input type="hidden" id="vsUrl" name="vsUrl" value="<?php echo URL ?>">
                    <div class="col-xl-8 col-lg-8 col-sm-12">
                        <?php
                        // seta o número de rows por página
                        $rowperpage = 4;

                        // pega o número total de postagens
                        $vsSqlNumeroPosts = "
                            SELECT
                                COUNT(*) AS numero_posts
                            FROM
                                blog_postagem
                            WHERE
                                status = 1 AND
                                data_publicacao < '$data_hora_atual'
                            ORDER BY
                                id_blog_postagem DESC
                        ";
                        $voResultadoNumeroPosts = mysqli_query($Conexao, $vsSqlNumeroPosts);
                        $voRowNumeroPosts = mysqli_fetch_array($voResultadoNumeroPosts);
                        $numeroPosts = $voRowNumeroPosts['numero_posts'];

                        if ($numeroPosts > 0) {
                        ?>
                            <div class="row">
                                <?php
                                $vsSqlPosts = "
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
                                        DATE_FORMAT(data_publicacao, '%Y') AS ano_publicacao
                                    FROM
                                        blog_postagem bp
                                        LEFT JOIN autores a ON bp.id_autores = a.id_autores
                                    WHERE
                                        bp.status = 1 AND
                                        bp.data_publicacao < '$data_hora_atual'
                                    ORDER BY
                                        bp.data_publicacao DESC
                                    LIMIT
                                        0, $rowperpage
                                ";
                                $voResultadoPosts = mysqli_query($Conexao, $vsSqlPosts);
                                while ($voRowPosts = mysqli_fetch_array($voResultadoPosts)) {
                                    $imagemBlog = explode(".", $voRowPosts['imagem']);
                                    if (file_exists("wdadmin/uploads/blog_postagem/" . $imagemBlog[0] . "-thumb.webp")) {
                                        $imagemBlogThumb = $imagemBlog[0] . "-thumb.webp";
                                    } else {
                                        $imagemBlogThumb = $voRowPosts['imagem'];
                                    }
                                ?>
                                    <div class="col-xl-6 col-lg-6 post">
                                        <div class="blog_one_single wow fadeInRight" data-wow-duration="1500ms" data-wow-delay="300ms">
                                            <a href="<?php echo URL . "post/" . $voRowPosts['url_publicacao'] ?>">
                                                <div class="blog_one_image">
                                                    <img src="<?php echo URL . "wdadmin/uploads/blog_postagem/" . $imagemBlogThumb ?>" title="<?php echo $voRowPosts['titulo'] ?>" alt="<?php echo $voRowPosts['titulo'] ?>">
                                                    <div class="blog_one_date_box">
                                                        <p><?php echo $voRowPosts['dia_publicacao'] ?><br><?php echo $voRowPosts['mes_publicacao'] ?><br><?php echo $voRowPosts['ano_publicacao'] ?></p>
                                                    </div>
                                                </div>
                                            </a>
                                            <div class="blog-one__content">
                                                <ul class="list-unstyled blog-one__meta">
                                                    <li><?php echo "Por " . $voRowPosts['autor'] ?></li>
                                                </ul>
                                                <div class="blog_one_title">
                                                    <h3><a href="<?php echo URL . "post/" . $voRowPosts['url_publicacao'] ?>"><?php echo $voRowPosts['titulo'] ?></a></h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php
                                }
                                ?>
                            </div>
                        <?php
                        } else {
                        ?>
                            <div class="row justify-content-center">
                                <div class="text-center">
                                    <h3>Nenhum post encontrado</h3>
                                </div>
                            </div>
                        <?php
                        }
                        if ($numeroPosts > 4) { ?>
                            <div class="text-center blog-page__load-more">
                                <a href="javascript:void(0)" class="thm-btn mais-posts">Ver mais</a>
                            </div>
                            <input type="hidden" id="row" value="0">
                            <input type="hidden" id="all" value="<?php echo $numeroPosts; ?>">
                        <?php
                        }
                        ?>
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

    <?php
    // MENU MOBILE
    include 'php/menu-mobile.php';

    // CSS
    include 'php/css.php';

    // SCRIPTS
    include 'php/scripts.php';
    ?>

    <script src="<?php echo URL . "assets/js/posts.min.js" ?>"></script>

</body>

</html>