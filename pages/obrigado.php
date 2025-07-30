<?php
$vsSqlObrigado = "SELECT titulo, icone, texto, link FROM informacoes WHERE id_conteudo_personalizado = 15 ORDER BY id_informacoes DESC LIMIT 1";
$vrsExecutaObrigado = mysqli_query($Conexao, $vsSqlObrigado) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$vrsQntObrigado = mysqli_num_rows($vrsExecutaObrigado);
if ($vrsQntObrigado > 0) {
    $voResultadoObrigado = mysqli_fetch_object($vrsExecutaObrigado);
?>
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
        <meta property="og:title" content="<?php echo $voResultadoObrigado->titulo . " | " . $voResultadoConfiguracoes->titulo ?>" />
        <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
        <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_secundaria ?>" />
        <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "obrigado" ?>" />
        <title><?php echo $voResultadoObrigado->titulo . " | " . $voResultadoConfiguracoes->titulo ?></title>
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
                            <li><span><?php echo $voResultadoObrigado->titulo ?></span></li>
                        </ul>
                        <h2><?php echo $voResultadoObrigado->titulo ?></h2>
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
                            <?php echo $voResultadoObrigado->texto ?>
                                <br />
                                <a href="<?php echo $voResultadoObrigado->link ?>" class="thm-btn"><?php echo $voResultadoObrigado->icone ?></a>
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
