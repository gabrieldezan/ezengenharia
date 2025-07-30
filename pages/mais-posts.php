<?php

error_reporting(0);
date_default_timezone_set('America/Sao_Paulo');
$data_hora_atual = date("Y-m-d H:i:s");
include '../wdadmin/config.php';
include '../php/conexao.php';

$Conexao = conecta();

$row = $_POST['row'];
$rowperpage = 4;
// pega a quantidade total de objetos no banco de dados
$vsSqlPosts = "
    SELECT
        bp.titulo,
        bp.texto,
        bp.imagem,
        a.nome AS autor,
        CONCAT(url_amigavel, '-', id_blog_postagem) AS url_publicacao,
        DATE_FORMAT(data_publicacao, '%d') AS dia_publicacao,
        CASE (DATE_FORMAT(data_publicacao, '%M'))
            WHEN 'January' THEN 'Fev'
            WHEN 'February' THEN 'Fev'
            WHEN 'March' THEN 'Mar'
            WHEN 'April' THEN 'Abr'
            WHEN 'May' THEN 'Mai'
            WHEN 'June' THEN 'Jun'
            WHEN 'July' THEN 'Jul'
            WHEN 'August' THEN 'Ago'
            WHEN 'September' THEN 'Set'
            WHEN 'October' THEN 'Out'
            WHEN 'November' THEN 'Nov'
            WHEN 'December' THEN 'Dez'
        END AS mes_publicacao,
        DATE_FORMAT(data_publicacao, '%Y') AS ano_publicacao
    FROM
        blog_postagem bp
        LEFT JOIN autores a ON bp.id_autores = a.id_autores
    WHERE
        bp.status = 1 AND
        bp.data_publicacao < '$data_hora_atual'
    ORDER BY
        bp.data_publicacao DESC
    LIMIT
        " . $row . "," . $rowperpage;
$voResultadoPosts = mysqli_query($Conexao, $vsSqlPosts);
while ($voRowPosts = mysqli_fetch_array($voResultadoPosts)) {
    $imagemBlog = explode(".", $voRowPosts['imagem']);
    if (file_exists("wdadmin/uploads/blog_postagem/" . $imagemBlog[0] . "-thumb.webp")) {
        $imagemBlogThumb = $imagemBlog[0] . "-thumb.webp";
    } else {
        $imagemBlogThumb = $voRowPosts['imagem'];
    }
?>
    <div class="col-xl-6 col-lg-6">
        <div class="blog_one_single wow fadeInRight" data-wow-duration="1500ms" data-wow-delay="300ms">
            <div class="blog_one_image">
                <img src="<?php echo URL . "wdadmin/uploads/blog_postagem/" . $imagemBlogThumb ?>" title="<?php echo $voRowPosts['titulo'] ?>" alt="<?php echo $voRowPosts['titulo'] ?>">
                <div class="blog_one_date_box">
                    <p><?php echo $voRowPosts['dia_publicacao'] ?><br><?php echo $voRowPosts['mes_publicacao'] ?><br><?php echo $voRowPosts['ano_publicacao'] ?></p>
                </div>
            </div>
            <div class="blog-one__content">
                <ul class="list-unstyled blog-one__meta">
                    <li><?php echo "por " . $voRowPosts['autor'] ?></li>
                </ul>
                <div class="blog_one_title">
                    <h3><a href="<?php echo URL . "post/" . $voRowPosts['url_publicacao'] ?>"><?php echo $voRowPosts['titulo'] ?></a></h3>
                </div>
            </div>
        </div>
    </div>
<?php
}
?>