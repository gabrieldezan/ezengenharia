<?php

require_once "../class/Metricas.class.php";

$Metricas = new Metricas();
$Metricas->setId_Metricas($_POST['inputIdMetricas']);
$Metricas->setTitulo($_POST['inputTitulo']);
$Metricas->setNumero($_POST['inputNumero']);
$Metricas->setMedida($_POST['inputMedida']);
$Metricas->setIcone($_POST['inputIcone']);
$Metricas->setPosicao($_POST['inputPosicao']);
$Metricas->setStatus($_POST['inputStatus']);

if ($Metricas->salva_dados()):
    print $Metricas->getRetorno_dados();
else:
    print 0;
endif;