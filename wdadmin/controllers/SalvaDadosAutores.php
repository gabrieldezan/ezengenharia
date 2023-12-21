<?php

session_start();
date_default_timezone_set('America/Sao_Paulo');

require_once "../class/Arquivos.class.php";
require_once "../class/Autores.class.php";

include 'MontaUrlAmigavel.php';

$Arquivos = new Arquivos();
$Arquivos->setArquivo_atual($_POST['inputImagemAtual']);
$Arquivos->setNovo_arquivo($_FILES['inputImagem']);
$Arquivos->setNome_amigavel(url_amigavel($_POST['inputNome']));
$Arquivos->setPasta("autores");

$Arquivos->insere_arquivo();

$Autores = new Autores();
$Autores->setId_autores($_POST['inputIdAutores']);
$Autores->setNome($_POST['inputNome']);
$Autores->setDescricao($_POST['inputDescricao']);
$Autores->setImagem($Arquivos->getRetorno_arquivo());
$Autores->setStatus($_POST['inputStatus']);

if ($Autores->salva_dados()):
    print $Autores->getRetorno_dados();
else:
    print 0;
endif;