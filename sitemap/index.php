<?php

error_reporting(0);

date_default_timezone_set('America/Sao_Paulo');
$data_hora_atual = date("Y-m-d H:i:s");

include '../wdadmin/config.php';
include '../php/conexao.php';

$Conexao = conecta();

$vsSql = "SELECT * FROM informacoes_gerais";
$vrExecuta = mysqli_query($Conexao, $vsSql) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
$voResultadoConfiguracoes = mysqli_fetch_object($vrExecuta);

// RAIZ DO XML
header("Content-Type:text/xml");
$xml = new DOMDocument('1.0', 'utf-8');
$xml->formatOutput = true;
$urlset = $xml->createElement('urlset');
$xml->appendChild($urlset);

// CRIA O ELEMENTO urlset
$urlset->setAttribute('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9');
$urlset->setAttribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');
$urlset->setAttribute('xsi:schemaLocation', 'http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd');
$xml->appendChild($urlset);

$url = $xml->createElement('url');
$url->appendChild($xml->createElement('loc', URL_SITE));
$url->appendChild($xml->createElement('lastmod', date('c', time())));
$url->appendChild($xml->createElement('priority', '1.00'));
$urlset->appendChild($url);

$url = $xml->createElement('url');
$url->appendChild($xml->createElement('loc', URL_SITE . 'sobre'));
$url->appendChild($xml->createElement('lastmod', date('c', time())));
$url->appendChild($xml->createElement('priority', '0.50'));
$urlset->appendChild($url);

$url = $xml->createElement('url');
$url->appendChild($xml->createElement('loc', URL_SITE . 'blog'));
$url->appendChild($xml->createElement('lastmod', date('c', time())));
$url->appendChild($xml->createElement('priority', '0.50'));
$urlset->appendChild($url);

// CONSULTA BLOG
$vsSqlBlog = "SELECT CONCAT(url_amigavel, '-', id_blog_postagem) AS url_publicacao FROM blog_postagem WHERE status = 1 AND data_publicacao < '$data_hora_atual' ORDER BY data_publicacao DESC";
$vrsExecutaBlog = mysqli_query($Conexao, $vsSqlBlog) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
while ($linhaBlog = mysqli_fetch_assoc($vrsExecutaBlog)) {
    $url = $xml->createElement('url');
    $url->appendChild($xml->createElement('loc', URL_SITE . 'post/' . $linhaBlog['url_publicacao']));
    $url->appendChild($xml->createElement('lastmod', date('c', time())));
    $url->appendChild($xml->createElement('priority', '0.50'));
    $urlset->appendChild($url);
}

$url = $xml->createElement('url');
$url->appendChild($xml->createElement('loc', URL_SITE . 'portfolio'));
$url->appendChild($xml->createElement('lastmod', date('c', time())));
$url->appendChild($xml->createElement('priority', '0.50'));
$urlset->appendChild($url);

// CONSULTA PROJETOS
$vsSqlProjetos = "SELECT CONCAT(url_amigavel, '-', id_galeria_imagem) AS url_projeto FROM galeria_imagem ORDER BY id_galeria_imagem DESC";
$vrsExecutaProjetos = mysqli_query($Conexao, $vsSqlProjetos) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
while ($linhaProjetos = mysqli_fetch_assoc($vrsExecutaProjetos)) {
    $url = $xml->createElement('url');
    $url->appendChild($xml->createElement('loc', URL_SITE . 'projeto/' . $linhaProjetos['url_projeto']));
    $url->appendChild($xml->createElement('lastmod', date('c', time())));
    $url->appendChild($xml->createElement('priority', '0.50'));
    $urlset->appendChild($url);
}

$url = $xml->createElement('url');
$url->appendChild($xml->createElement('loc', URL_SITE . 'contato'));
$url->appendChild($xml->createElement('lastmod', date('c', time())));
$url->appendChild($xml->createElement('priority', '0.50'));
$urlset->appendChild($url);

$url = $xml->createElement('url');
$url->appendChild($xml->createElement('loc', URL_SITE . 'politica-privacidade'));
$url->appendChild($xml->createElement('lastmod', date('c', time())));
$url->appendChild($xml->createElement('priority', '0.50'));
$urlset->appendChild($url);

echo $xml->saveXML();
exit;