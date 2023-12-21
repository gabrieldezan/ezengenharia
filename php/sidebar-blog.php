<div class="col-xl-4 col-lg-4">
    <div class="blog_details_sidebar">
        <div class="sidebar__single sidebar__search">
            <form action="#" class="sidebar__search-form">
                <input type="search" placeholder="Procure aqui...">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="sidebar__single sidebar__post">
            <h3 class="sidebar__title">Mais Populares</h3>
            <ul class="sidebar__post-list list-unstyled">
                <?php
                $vsSqlPostsMaisPopulares = "
                    SELECT
                        titulo,
                        imagem,
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
                        blog_postagem
                    WHERE
                        status = 1 AND
                        data_publicacao < '$data_hora_atual'
                    ORDER BY
                        visualizacoes DESC
                    LIMIT 5
                ";
                $vrsExecutaPostsMaisPopulares = mysqli_query($Conexao, $vsSqlPostsMaisPopulares) or die("Erro ao efetuar a operação no banco de dados! <br> Arquivo:" . __FILE__ . "<br>Linha:" . __LINE__ . "<br>Erro:" . mysqli_error($Conexao));
                while ($voResultadoPostsMaisPopulares = mysqli_fetch_object($vrsExecutaPostsMaisPopulares)) {
                    $imagemBlog = explode(".", $voResultadoPostsMaisPopulares->imagem);
                    if (file_exists("wdadmin/uploads/blog_postagem/" . $imagemBlog[0] . "-thumb.webp")) {
                        $imagemBlogThumb = $imagemBlog[0] . "-thumb.webp";
                    } else {
                        $imagemBlogThumb = $voResultadoPostsMaisPopulares->imagem;
                    }
                ?>
                    <li>
                        <div class="sidebar__post-image">
                            <img src="<?php echo URL . "wdadmin/uploads/blog_postagem/" . $imagemBlogThumb ?>" title="<?php echo $voResultadoPostsMaisPopulares->titulo ?>" alt="<?php echo $voResultadoPostsMaisPopulares->titulo ?>">
                        </div>
                        <div class="sidebar__post-content">
                            <h3>
                                <span class="sidebar__post-content_meta"><?php echo $voResultadoPostsMaisPopulares->dia_publicacao . " " . $voResultadoPostsMaisPopulares->mes_publicacao . ", " . $voResultadoPostsMaisPopulares->ano_publicacao ?></span>
                                <a href="<?php echo URL . "post/" . $voResultadoPostsMaisPopulares->url_publicacao ?>" class="sibebar_post_content_title"><?php echo $voResultadoPostsMaisPopulares->titulo ?></a>
                            </h3>
                        </div>
                    </li>
                <?php
                }
                ?>
            </ul>
        </div>
    </div>
</div>