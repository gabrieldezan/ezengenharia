<?php
$checa_grupo .= $_GET["grupo"] != "" ? " AND gi.id_galeria_imagem IN (SELECT ig.id_galeria_imagem FROM imagens_grupos ig WHERE ig.id_galeria_grupos IN (" . $_GET["grupo"] . "))" : "";
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
    <meta property="og:title" content="<?php echo "Portfólio | " . $voResultadoConfiguracoes->titulo ?>" />
    <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_secundaria ?>" />
    <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "portfolio" ?>" />
    <title><?php echo "Portfólio | " . $voResultadoConfiguracoes->titulo ?></title>
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
                        <li><span>Portfólio</span></li>
                    </ul>
                    <h2>Portfólio</h2>
                </div>
            </section>
        <?php
        }
        ?>

        <section class="our_projects_one our_projects_page">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <ul class="project-filter style1 post-filter has-dynamic-filters-counter list-unstyled">
                            <?php if (!isset($_GET["grupo"])) { ?>
                                <li data-filter=".todos" class="active"><span class="filter-text">Todos</span></li>
                            <?php
                            } else { ?>
                                <li data-filter=".todos"><span class="filter-text">Todos</span></li>
                                <?php
                            }
                            $vsSqlCategoriasProjetos = "SELECT descricao, url_amigavel FROM galeria_grupo WHERE status = 1";
                            $vrsExecutaCategoriasProjetos = mysqli_query($Conexao, $vsSqlCategoriasProjetos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoCategoriasProjetos = mysqli_fetch_object($vrsExecutaCategoriasProjetos)) {
                                if ($voResultadoCategoriasProjetos->url_amigavel == $_GET["grupo"]) {
                                ?>
                                    <li id="<?php echo $voResultadoCategoriasProjetos->url_amigavel ?>" class="active" data-filter="<?php echo "." . $voResultadoCategoriasProjetos->url_amigavel ?>"><span class="filter-text"><?php echo $voResultadoCategoriasProjetos->descricao ?></span></li>
                                <?php
                                } else {
                                ?>
                                    <li id="<?php echo $voResultadoCategoriasProjetos->url_amigavel ?>" data-filter="<?php echo "." . $voResultadoCategoriasProjetos->url_amigavel ?>"><span class="filter-text"><?php echo $voResultadoCategoriasProjetos->descricao ?></span></li>
                                <?php
                                }
                            }
                            ?>
                        </ul>
                    </div>
                </div>
                <div class="row filter-layout masonary-layout">
                    <?php
                    $vsSqlProjetos = "
                        SELECT
                            gi.id_galeria_imagem,
                            gi.titulo,
                            gi.imagem1,
                            CONCAT(gi.url_amigavel, '-', gi.id_galeria_imagem) AS url_projeto
                        FROM
                            galeria_imagem gi
                        ORDER BY
                            gi.id_galeria_imagem DESC
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
                                GROUP_CONCAT(DISTINCT gg.url_amigavel SEPARATOR ' ') AS grupos,
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
                            <div class="col-xl-4 col-lg-4 col-md-6 col-6 todos <?php echo $voResultadoGrupos->grupos ?>">
                                <div class="our_projects_one_single">
                                    <div class="our_projects_one_image">
                                        <img src="<?php echo URL . "wdadmin/uploads/galeria_imagem/" . $imagemProjetosThumb ?>" title="<?php echo $voResultadoProjetos->titulo ?>" alt="<?php echo $voResultadoProjetos->titulo ?>">
                                        <a href="<?php echo URL . "projeto/" . $voResultadoProjetos->url_projeto ?>">
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

    <script>
        function projectMasonaryLayout() {
            if ($(".masonry-layout").length) {
                $(".masonry-layout").isotope({
                    layoutMode: "masonry",
                });
            }

            if ($(".post-filter").length) {
                var applyFilter = function(selector) {
                    $(".post-filter li").removeClass("active");
                    $(".post-filter li[data-filter='" + selector + "']").addClass("active");
                    $(".filter-layout").imagesLoaded(function() {
                        $(".filter-layout").isotope({
                            filter: selector,
                            animationOptions: {
                                duration: 500,
                                easing: "linear",
                                queue: false,
                            },
                        });
                    });
                };

                $(".post-filter li")
                    .children(".filter-text")
                    .on("click", function() {
                        var Self = $(this);
                        var selector = Self.parent().attr("data-filter");
                        applyFilter(selector);
                        return false;
                    });

                <?php if (isset($_GET["grupo"])) { ?>
                    var defaultFilter = "<?php echo "." . $_GET["grupo"] ?>";
                    applyFilter(defaultFilter);
                <?php } else { ?>
                    var defaultFilter = ".todos";
                    applyFilter(defaultFilter);
                <?php
                }
                ?>
            }

            if ($(".post-filter.has-dynamic-filters-counter").length) {
                var filterItems = $(".post-filter li");
                filterItems.each(function() {
                    var filterElement = $(this).attr("data-filter");
                });
            }
        }

        projectMasonaryLayout();
    </script>

</body>

</html>