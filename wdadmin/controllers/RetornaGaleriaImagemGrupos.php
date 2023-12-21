<?php

require_once "../class/GaleriaImagens.class.php";

$GaleriaImagens = new GaleriaImagens();
$GaleriaImagens->setId_galeria_imagem($_POST['viIdGaleriaImagens']);

if ($GaleriaImagens->edita_dados_grupos()):
    print json_encode($GaleriaImagens->getRetorno_dados());
else:
    print 0;
endif;