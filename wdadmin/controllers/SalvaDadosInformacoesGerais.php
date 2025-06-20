<?php

require_once "../class/Arquivos.class.php";
require_once "../class/InformacoesGerais.class.php";

include 'MontaUrlAmigavel.php';

$Arquivos = new Arquivos();
$InformacoesGerais = new InformacoesGerais();

$InformacoesGerais->setNome_empresa($_POST['inputNomeEmpresa']);
$InformacoesGerais->setTitulo($_POST['inputTitulo']);
$InformacoesGerais->setDescricao($_POST['inputDescricao']);
$InformacoesGerais->setWhatsapp($_POST['inputWhatsApp']);
$InformacoesGerais->setCelular1($_POST['inputCelular1']);
$InformacoesGerais->setCelular2($_POST['inputCelular2']);
$InformacoesGerais->setEmail($_POST['inputEmail']);
$InformacoesGerais->setEmail_contato($_POST['inputEmailContato']);
$InformacoesGerais->setGoogle_search_console($_POST['inputGoogleSearchConsole']);
$InformacoesGerais->setGoogle_analytics($_POST['inputGoogleAnalytics']);
$InformacoesGerais->setFacebook_pixel($_POST['inputFacebookPixel']);

$Arquivos->setArquivo_atual($_POST['inputLogoFaviconAtual']);
$Arquivos->setNovo_arquivo($_FILES['inputLogoFavicon']);
$Arquivos->setNome_amigavel("favicon-" . url_amigavel($_POST['inputNomeEmpresa']));
$Arquivos->setPasta("informacoes_gerais");
$Arquivos->insere_arquivo();
$InformacoesGerais->setFavicon($Arquivos->getRetorno_arquivo());

$Arquivos->setArquivo_atual($_POST['inputLogoPrincipalAtual']);
$Arquivos->setNovo_arquivo($_FILES['inputLogoPrincipal']);
$Arquivos->setNome_amigavel("logo-" . url_amigavel($_POST['inputNomeEmpresa']));
$Arquivos->setPasta("informacoes_gerais");
$Arquivos->insere_arquivo();
$InformacoesGerais->setLogo_principal($Arquivos->getRetorno_arquivo());

$Arquivos->setArquivo_atual($_POST['inputLogoSecundariaAtual']);
$Arquivos->setNovo_arquivo($_FILES['inputLogoSecundaria']);
$Arquivos->setNome_amigavel("logo-alternativa-" . url_amigavel($_POST['inputNomeEmpresa']));
$Arquivos->setPasta("informacoes_gerais");
$Arquivos->insere_arquivo();
$InformacoesGerais->setLogo_secundaria($Arquivos->getRetorno_arquivo());

$InformacoesGerais->setPoliticas_privacidade($_POST['inputPoliticasPrivacidade']);

if ($InformacoesGerais->salva_dados()) {
    print $InformacoesGerais->getRetorno_dados();
} else {
    print 0;
}