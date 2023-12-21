<footer class="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-xl-4 col-lg-4 col-md-6">
                <div class="footer-widget__column footer-widget__about wow fadeInUp animated" data-wow-delay="100ms">
                    <div class="footer-widget__about_logo">
                        <a href="<?php echo URL ?>">
                            <img src="<?php echo URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" title="<?php echo $voResultadoConfiguracoes->nome_empresa ?>" alt="<?php echo $voResultadoConfiguracoes->nome_empresa ?>">
                        </a>
                    </div>
                    <?php
                    $vsSqlTextoRodape = "SELECT resumo_texto FROM sobre";
                    $vrsExecutaTextoRodape = mysqli_query($Conexao, $vsSqlTextoRodape) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                    while ($voResultadoTextoRodape = mysqli_fetch_object($vrsExecutaTextoRodape)) {
                    ?>
                        <div class="footer-widget_about_text__box">
                            <p><?php echo $voResultadoTextoRodape->resumo_texto ?></p>
                        </div>
                    <?php
                    }
                    ?>
                    <div class="site-footer__social">
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
            <div class="col-xl-4 col-lg-4 col-md-6">
                <div class="footer-widget__column footer-widget__explore wow fadeInUp animated" data-wow-delay="200ms">
                    <div class="footer-widget__title">
                        <h3>Explore</h3>
                    </div>
                    <ul class="footer-widget__explore_list list-unstyled">
                        <li><a href="<?php echo URL . "sobre" ?>">Sobre</a></li>
                        <?php
                        $vsSqlCountBlog = "SELECT COUNT(*) AS numero_posts FROM blog_postagem WHERE status = 1 AND data_publicacao < '$data_hora_atual'";
                        $vrsExecutaCountBlog = mysqli_query($Conexao, $vsSqlCountBlog) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                        while ($voResultadoCountBlog = mysqli_fetch_object($vrsExecutaCountBlog)) {
                            if ($voResultadoCountBlog->numero_posts > 0) {
                        ?>
                                <li><a href="<?php echo URL . "blog" ?>">Blog</a></li>
                        <?php
                            }
                        }
                        ?>
                        <li><a href="<?php echo URL . "contato" ?>">Contato</a></li>
                    </ul>
                    <ul class="footer-widget__explore_list_two list-unstyled">
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
                </div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-6">
                <div class="footer-widget__column footer-widget__newsletter wow fadeInUp animated" data-wow-delay="400ms" style="visibility: visible; animation-delay: 400ms; animation-name: fadeInUp;">
                    <div class="footer-widget__title">
                        <h3>Entre em Contato</h3>
                    </div>
                    <div class="footer-widget__column footer-widget__about wow fadeInUp animated" data-wow-delay="100ms">
                        <ul class="list-unstyled">
                            <li>
                                <div class="footer-widget_about_icon">
                                    <span class="fas fa-map-marker-alt"></span>
                                </div>
                                <div class="footer-widget_about_text">
                                    <?php if (!empty($voResultadoContatos->link)) { ?>
                                        <a target="_blank" href="<?php echo $voResultadoContatos->link ?>"><?php echo $voResultadoContatos->endereco . " - " . $voResultadoContatos->cidade . "-" . $voResultadoContatos->estado ?></a>
                                    <?php } else { ?>
                                        <?php echo $voResultadoContatos->endereco . " - " . $voResultadoContatos->cidade . "-" . $voResultadoContatos->estado ?>
                                    <?php } ?>
                                </div>
                            </li>
                            <li>
                                <div class="footer-widget_about_icon">
                                    <span class="fas fa-envelope"></span>
                                </div>
                                <div class="footer-widget_about_text">
                                    <a href="<?php echo "mailto:" . $voResultadoConfiguracoes->email ?>"><?php echo $voResultadoConfiguracoes->email ?></a>
                                </div>
                            </li>
                            <li>
                                <div class="footer-widget_about_icon">
                                    <span class="flaticon-telephone"></span>
                                </div>
                                <div class="footer-widget_about_text">
                                    <a href="<?php echo "tel:55" . preg_replace("/[\s\W]+/", "", $voResultadoContatos->telefone) ?>"><?php echo $voResultadoContatos->telefone ?></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="site-footer_bottom">
    <div class="container">
        <div class="site-footer_bottom_copyright">
            <p><?php echo $voResultadoConfiguracoes->nome_empresa . ". Todos os direitos reservados | " ?><a href="<?php echo URL . "politica-privacidade" ?>">Política de Privacidade</a>.</p>
        </div>
        <div>
            <a href="https://webdezan.com.br/" target="_blank">
                <img src="<?php echo URL . "assets/images/webdezan.webp" ?>" title="Web Dezan - Agência Digital" alt="Web Dezan - Agência Digital">
            </a>
        </div>
    </div>
</div>
<div class="button-go-top">
    <a href="<?php echo "https://wa.me/55" . preg_replace("/[\s\W]+/", "", $voResultadoConfiguracoes->whatsapp) ?>" target="_blank" title="Whatsapp" class="go-top show">
        <img src="<?php echo URL . "assets/images/whatsapp.png" ?>" title="WhatsApp" alt="WhatsApp">
    </a>
</div>