<?php

require_once "../class/GaleriaImagens.class.php";

$GaleriaImagens = new GaleriaImagens();

if ($GaleriaImagens->consulta_dados()):
    print $GaleriaImagens->getRetorno_dados();
else:
    print 0;
endif;