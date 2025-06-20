<div class="mobile-nav__wrapper">
    <div class="mobile-nav__overlay side-menu__toggler mobile-nav__toggler"></div>
    <div class="mobile-nav__content">
        <span class="mobile-nav__close side-menu__toggler mobile-nav__toggler"><i class="fa fa-times"></i></span>
        <div class="logo-box">
            <a href="<?php echo URL ?>" aria-label="<?php echo "Logo " . $voResultadoConfiguracoes->nome_empresa ?>">
                <img src="<?php echo URL . "wdadmin/uploads/informacoes_gerais/" . $voResultadoConfiguracoes->logo_principal ?>" title="<?php echo $voResultadoConfiguracoes->nome_empresa ?>" alt="<?php echo $voResultadoConfiguracoes->nome_empresa ?>" width="85" height="70">
            </a>
        </div>
        <div class="mobile-nav__container clearfix"></div>
        <ul class="mobile-nav__contact list-unstyled">
            <li>
                <i class="fas fa-envelope"></i>
                <a href="<?php echo "mailto:" . $voResultadoConfiguracoes->email ?>"><?php echo $voResultadoConfiguracoes->email ?></a>
            </li>
            <li>
                <i class="fas fa-phone-volume"></i>
                <a href="<?php echo "tel:55" . preg_replace("/[\s\W]+/", "", $voResultadoContatos->telefone) ?>"><?php echo $voResultadoContatos->telefone ?></a>
            </li>
        </ul>
        <div class="mobile-nav__top">
            <div class="mobile-nav__social">
                <a target="_blank" href="<?php echo "https://wa.me/55" . preg_replace("/[\s\W]+/", "", $voResultadoConfiguracoes->whatsapp) ?>" aria-label="WhatsApp">
                    <i class="fab fa-whatsapp"></i>
                </a>
                <?php
                $vsSqlRedesSociais = "SELECT titulo, link, icone FROM redes_sociais";
                $vrsExecutaRedesSociais = mysqli_query($Conexao, $vsSqlRedesSociais) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                while ($voResultadoRedesSociais = mysqli_fetch_object($vrsExecutaRedesSociais)) {
                ?>
                    <a target="_blank" href="<?php echo $voResultadoRedesSociais->link ?>" title="<?php echo $voResultadoRedesSociais->titulo ?>" aria-label="<?php echo url_amigavel($voResultadoRedesSociais->titulo) ?>">
                        <?php echo '<i class="' . str_replace(array('<i class="', '"></i>'), '', $voResultadoRedesSociais->icone) . '"></i>' ?>
                    </a>
                <?php
                }
                ?>
            </div>
        </div>
    </div>
</div>