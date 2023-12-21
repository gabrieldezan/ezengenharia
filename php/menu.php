<div class="site-header__header-one-wrap clearfix">
    <div class="header_top_one">
        <div class="container">
            <div class="header_top_one_inner clearfix">
                <div class="header_top_one_inner_left float-left">
                    <div class="header_social_1">
                        <ul class="list-unstyled">
                            <li>
                                <a target="_blank" href="<?php echo "https://wa.me/55" . preg_replace("/[\s\W]+/", "", $voResultadoConfiguracoes->whatsapp) ?>" title="WhatsApp">
                                    <i class="fab fa-whatsapp"></i>
                                </a>
                            </li>
                            <?php
                            $vsSqlRedesSociais = "SELECT titulo, link, icone FROM redes_sociais";
                            $vrsExecutaRedesSociais = mysqli_query($Conexao, $vsSqlRedesSociais) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoRedesSociais = mysqli_fetch_object($vrsExecutaRedesSociais)) {
                            ?>
                                <li>
                                    <a target="_blank" href="<?php echo $voResultadoRedesSociais->link ?>" title="<?php echo $voResultadoRedesSociais->titulo ?>">
                                        <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoRedesSociais->icone) . '"></i>' ?>
                                    </a>
                                </li>
                            <?php
                            }
                            ?>
                        </ul>
                    </div>
                </div>
                <div class="header_top_one_inner_right float-right">
                    <div class="header_topmenu_1">
                        <ul class="list-unstyled">
                            <li><a href="<?php echo "mailto:" . $voResultadoConfiguracoes->email ?>"><span class="fas fa-envelope"></span><?php echo $voResultadoConfiguracoes->email ?></a></li>
                            <li><a href="<?php echo "tel:55" . preg_replace("/[\s\W]+/", "", $voResultadoContatos->telefone) ?>"><span class="flaticon-telephone"></span><?php echo $voResultadoContatos->telefone ?></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <header class="main-nav__header-one">
        <div class="container">
            <nav class="header-navigation one stricky">
                <div class="container-box clearfix">
                    <div class="main-nav__left main-nav__left_one float-left">
                        <div class="logo_one">
                            <a href="<?php echo URL ?>" class="main-nav__logo">
                                <img src="<?php echo URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" class="main-logo" title="<?php echo $voResultadoConfiguracoes->nome_empresa ?>" alt="<?php echo $voResultadoConfiguracoes->nome_empresa ?>">
                            </a>
                        </div>
                        <a href="#" class="side-menu__toggler">
                            <i class="fa fa-bars"></i>
                        </a>
                    </div>

                    <div class="main-nav__main-navigation one float-right">
                        <ul class=" main-nav__navigation-box float-left">
                            <?php if ($pagina == "home") { ?>
                                <li class="current">
                                    <a href="<?php echo URL ?>">Home</a>
                                </li>
                            <?php } else { ?>
                                <li>
                                    <a href="<?php echo URL ?>">Home</a>
                                </li>
                            <?php }
                            if ($pagina == "sobre") { ?>
                                <li class="current">
                                    <a href="<?php echo URL . "sobre" ?>">Sobre</a>
                                </li>
                            <?php } else { ?>
                                <li>
                                    <a href="<?php echo URL . "sobre" ?>">Sobre</a>
                                </li>
                            <?php }
                            if ($pagina == "portfolio" || $pagina == "projeto") { ?>
                                <li class="current dropdown">
                                    <a href="<?php echo URL . "portfolio" ?>">Portfólio</a>
                                    <ul>
                                        <?php
                                        $vsSqlCategoriasPortfolio = "SELECT descricao, url_amigavel FROM galeria_grupo WHERE status = 1";
                                        $vrsExecutaCategoriasPortfolio = mysqli_query($Conexao, $vsSqlCategoriasPortfolio) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                        while ($voResultadoCategoriasPortfolio = mysqli_fetch_object($vrsExecutaCategoriasPortfolio)) {
                                        ?>
                                            <li><a href="<?php echo URL . "portfolio?grupo=" . $voResultadoCategoriasPortfolio->url_amigavel ?>"><?php echo $voResultadoCategoriasPortfolio->descricao ?></a></li>
                                        <?php
                                        }
                                        ?>
                                    </ul>
                                </li>
                            <?php } else { ?>
                                <li class="dropdown">
                                    <a href="<?php echo URL . "portfolio" ?>">Portfólio</a>
                                    <ul>
                                        <?php
                                        $vsSqlCategoriasPortfolio = "SELECT descricao, url_amigavel FROM galeria_grupo WHERE status = 1";
                                        $vrsExecutaCategoriasPortfolio = mysqli_query($Conexao, $vsSqlCategoriasPortfolio) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                                        while ($voResultadoCategoriasPortfolio = mysqli_fetch_object($vrsExecutaCategoriasPortfolio)) {
                                        ?>
                                            <li><a href="<?php echo URL . "portfolio?grupo=" . $voResultadoCategoriasPortfolio->url_amigavel ?>"><?php echo $voResultadoCategoriasPortfolio->descricao ?></a></li>
                                        <?php
                                        }
                                        ?>
                                    </ul>
                                </li>
                                <?php }
                            $vsSqlCountBlog = "SELECT COUNT(*) AS numero_posts FROM blog_postagem WHERE status = 1 AND data_publicacao < '$data_hora_atual'";
                            $vrsExecutaCountBlog = mysqli_query($Conexao, $vsSqlCountBlog) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                            while ($voResultadoCountBlog = mysqli_fetch_object($vrsExecutaCountBlog)) {
                                if ($voResultadoCountBlog->numero_posts > 0) {
                                    if ($pagina == "blog" || $pagina == "post") { ?>
                                        <li class="current">
                                            <a href="<?php echo URL . "blog" ?>">Blog</a>
                                        </li>
                                    <?php } else { ?>
                                        <li>
                                            <a href="<?php echo URL . "blog" ?>">Blog</a>
                                        </li>
                                <?php
                                    }
                                }
                            }
                            if ($pagina == "contato") { ?>
                                <li class="current">
                                    <a href="<?php echo URL . "contato" ?>">Contato</a>
                                </li>
                            <?php } else { ?>
                                <li>
                                    <a href="<?php echo URL . "contato" ?>">Contato</a>
                                </li>
                            <?php } ?>
                        </ul>
                        <?php
                        $vsSqlBotaoOrcamento = "SELECT titulo, link FROM informacoes WHERE id_conteudo_personalizado = 14 LIMIT 1";
                        $vrsExecutaBotaoOrcamento = mysqli_query($Conexao, $vsSqlBotaoOrcamento) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                        while ($voResultadoBotaoOrcamento = mysqli_fetch_object($vrsExecutaBotaoOrcamento)) {
                        ?>
                            <div class="main-nav__right main-nav__right_one float-left">
                                <div class="header_btn_1">
                                    <a target="_blank" href="<?php echo $voResultadoBotaoOrcamento->link ?>"><?php echo $voResultadoBotaoOrcamento->titulo ?></a>
                                </div>
                            </div>
                        <?php
                        }
                        ?>
                    </div>
                </div>
            </nav>
        </div>
    </header>
</div>