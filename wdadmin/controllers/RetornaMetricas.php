<?php

require_once "../class/Metricas.class.php";

$Metricas = new Metricas();

if ($Metricas->consulta_dados()):
    print $Metricas->getRetorno_dados();
else:
    print 0;
endif;