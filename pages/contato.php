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
    <meta property="og:title" content="<?php echo "Contato | " . $voResultadoConfiguracoes->titulo ?>" />
    <meta property="og:description" content="<?php echo substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, strrpos(substr(strip_tags(trim($voResultadoConfiguracoes->descricao)), 0, 197), ' ')) . '...'; ?>" />
    <meta property="og:image" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" />
    <meta property="og:url" content="<?php echo "https://" . $_SERVER['HTTP_HOST'] . URL . "contato" ?>" />
    <title><?php echo "Contato | " . $voResultadoConfiguracoes->titulo ?></title>
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
                        <li><span>Contato</span></li>
                    </ul>
                    <h2>Contato</h2>
                </div>
            </section>
        <?php
        }
        ?>

        <section class="all_contact_info">
            <div class="container">
                <div class="all_contact_info_inner">
                    <div class="row">
                        <div class="col-xl-4 col-lg-4">
                            <div class="all_contact_info_single mail_info">
                                <div class="icon"><span class="fas fa-envelope"></span></div>
                                <div class="content">
                                    <a href="<?php echo "mailto:" . $voResultadoConfiguracoes->email ?>"><?php echo $voResultadoConfiguracoes->email ?></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3">
                            <div class="all_contact_info_single phone_info">
                                <div class="icon"><span class="fas fa-phone-volume"></span></div>
                                <div class="content">
                                    <a href="<?php echo "tel:" . preg_replace("/[\s\W]+/", "", $voResultadoContatos->telefone) ?>"><?php echo $voResultadoContatos->telefone ?></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-5">
                            <div class="all_contact_info_single location_info">
                                <div class="icon"><span class="fas fa-map-marker-alt"></span></div>
                                <div class="content">
                                    <?php if (!empty($voResultadoContatos->link)) { ?>
                                        <a target="_blank" href="<?php echo $voResultadoContatos->link ?>"><?php echo $voResultadoContatos->endereco . " - " . $voResultadoContatos->cidade . "-" . $voResultadoContatos->estado ?></a>
                                    <?php } else { ?>
                                        <p><?php echo $voResultadoContatos->endereco . " - " . $voResultadoContatos->cidade . "-" . $voResultadoContatos->estado ?></p>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="contact-one">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5">
                        <div class="contact_one_left">
                            <?php
                            $vsSqlTituloContato = "SELECT titulo, subtitulo FROM titulos_personalizados WHERE id_titulos_personalizados = 14";
                            $vrsExecutaTituloContato = mysqli_query($Conexao, $vsSqlTituloContato) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoTituloContato = mysqli_fetch_object($vrsExecutaTituloContato)) {
                            ?>
                                <div class="block-title text-left">
                                    <h2><?php echo $voResultadoTituloContato->titulo ?></h2>
                                </div>
                                <div class="contact_one_left-text">
                                    <p><?php echo $voResultadoTituloContato->subtitulo ?></p>
                                </div>
                            <?php
                            }
                            ?>
                            <div class="contact_one_left__social">
                                <a target="_blank" href="<?php echo "https://wa.me/55" . preg_replace("/[\s\W]+/", "", $voResultadoConfiguracoes->whatsapp) ?>" title="WhatsApp">
                                    <i class="fab fa-whatsapp"></i>
                                </a>
                                <?php
                                $vsSqlRedesSociais = "SELECT titulo, link, icone FROM redes_sociais";
                                $vrsExecutaRedesSociais = mysqli_query($Conexao, $vsSqlRedesSociais) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                while ($voResultadoRedesSociais = mysqli_fetch_object($vrsExecutaRedesSociais)) {
                                ?>
                                    <a target="_blank" href="<?php echo $voResultadoRedesSociais->link ?>" title="<?php echo $voResultadoRedesSociais->titulo ?>">
                                        <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoRedesSociais->icone) . '"></i>' ?>
                                    </a>
                                <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-7">
                        <div class="contact-one__form__wrap">
                            <form id="form_contato" class="contact-one__form">
                                <input type="hidden" id="vsUrl" name="vsUrl" value="<?php echo URL ?>">
                                <input type="hidden" id="vsEmailContato" name="vsEmailContato" value="<?php echo EMAIL_CONTATO ?>">
                                <input type="hidden" id="vsNomeEmpresa" name="vsNomeEmpresa" value="<?php echo $voResultadoConfiguracoes->nome_empresa ?>">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <input type="text" id="vsNome" name="vsNome" placeholder="Nome *" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <input type="email" id="vsEmail" name="vsEmail" placeholder="E-mail *" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <input type="text" id="vsTelefone" name="vsTelefone" placeholder="Telefone *" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <select id="vsAssunto" name="vsAssunto" required>
                                                <option value="">Selecione uma opção</option>
                                                <option value="Projeto Arquitetônico">Projeto Arquitetônico</option>
                                                <option value="Projetos de Engenharia">Projetos de Engenharia</option>
                                                <option value="Regularização de Obra">Regularização de Obra</option>
                                                <option value="Acompanhamento de Obra">Acompanhamento de Obra</option>
                                                <option value="Construção">Construção</option>
                                                <option value="Estruturas de Solo para Energia Solar">Estruturas de Solo para Energia Solar</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <textarea id="vsMensagem" name="vsMensagem" placeholder="Mensagem"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-group contact__btn">
                                            <button type="submit" id="botao_enviar_mensagem" class="thm-btn contact-one__btn full-width">Enviar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <?php if (!empty($voResultadoContatos->mapa)) { ?>
            <section class="google_map two">
                <?php echo $voResultadoContatos->mapa ?>
            </section>
        <?php
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
    ?>
    <link rel="stylesheet" href="<?php echo URL . "wdadmin/assets/plugins/sweetalert/sweetalert.min.css" ?>">

    <?php
    // SCRIPTS
    include 'php/scripts.php';
    ?>
    <script src="<?php echo URL . "wdadmin/js/jquery.mask.min.js" ?>" rel="stylesheet"></script>
    <script src="<?php echo URL . "wdadmin/assets/plugins/sweetalert/sweetalert.min.js" ?>"></script>
    <script src="<?php echo URL . "wdadmin/js/contato.min.js" ?>"></script>

</body>

</html>