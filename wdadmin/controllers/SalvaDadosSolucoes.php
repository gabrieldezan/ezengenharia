<?php

require_once "../class/Solucoes.class.php";

$Solucoes = new Solucoes();

$Solucoes->setId_solucoes($_POST['inputIdSolucoes']);
$Solucoes->setTitulo($_POST['inputTituloSolucoes']);
$Solucoes->setValor($_POST['inputValorSolucoes']);
$Solucoes->setPeriodo($_POST['inputPeriodoSolucoes']);
$Solucoes->setId_servicos($_POST['hiddenIdServicos']);

if ($Solucoes->salva_dados()) {
    print $Solucoes->getRetorno_dados();
} else {
    print 0;
}