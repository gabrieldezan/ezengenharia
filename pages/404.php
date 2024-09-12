<!DOCTYPE html>
<html lang="pt-br">

<head>
    <?php
    // HEAD
    include 'php/head.php';
    ?>
    <meta name="robots" content="noindex, nofollow" />
    <meta name="googlebot" content="noindex, nofollow" />
    <meta name="description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:title" content="<?php echo "404 | " . $voResultadoConfiguracoes->titulo ?>" />
    <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" />
    <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "404" ?>" />
    <title><?php echo "404 | " . $voResultadoConfiguracoes->titulo ?></title>
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
                        <li><span>404</span></li>
                    </ul>
                    <h2>404</h2>
                </div>
            </section>
        <?php
        }
        ?>

        <section class="our_projects_one">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="block-title text-center">
                            <h4>Desculpe, não conseguimos encontrar essa página!</h4>
                            <h2>A página que você procura não existe.</h2>
                            <br />
                            <a href="<?php echo URL ?>" class="thm-btn">Voltar para a home</a>
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