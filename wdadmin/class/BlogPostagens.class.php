<?php

require_once "Conexao.class.php";

class BlogPostagens extends Conexao
{
    /* =============== VARIAVEIS =============== */

    private $id_blog_postagem;
    private $titulo;
    private $texto;
    private $imagem;
    private $data_criacao;
    private $data_publicacao;
    private $video;
    private $url_amigavel;
    private $status;
    private $id_blog_categorias;
    private $id_blog_subcategorias;
    private $id_autores;
    private $retorno_dados;

    /* =============== FUNÇÃO SALVA DADOS =============== */

    public function salva_dados()
    {
        try {

            $pdo = parent::getDB();
            if ($this->id_blog_postagem === "") {
                $salva_dados = $pdo->prepare('
                    INSERT INTO blog_postagem (
                        titulo,
                        texto,
                        imagem,
                        data_criacao,
                        data_publicacao,
                        video,
                        url_amigavel,
                        status,
                        id_blog_categorias,
                        id_blog_subcategorias,
                        id_autores
                    ) VALUES (
                        ?,
                        ?,
                        ?,
                        ?,
                        ?,
                        ?,
                        ?,
                        ?,
                        ?,
                        ?,
                        ?
                    );
                ');
                $salva_dados->execute(array(
                    "$this->titulo",
                    "$this->texto",
                    "$this->imagem",
                    "$this->data_criacao",
                    "$this->data_publicacao",
                    "$this->video",
                    "$this->url_amigavel",
                    "$this->status",
                    "$this->id_blog_categorias",
                    "$this->id_blog_subcategorias",
                    "$this->id_autores"
                ));
                $this->setRetorno_dados($pdo->lastInsertId());
            } else {
                $salva_dados = $pdo->prepare('
                    UPDATE blog_postagem SET 
                        titulo = ?,
                        texto = ?,
                        imagem = ?,
                        data_publicacao = ?,
                        video = ?,
                        url_amigavel = ?,
                        status = ?,
                        id_blog_categorias = ?,
                        id_blog_subcategorias = ?,
                        id_autores = ?
                    WHERE 
                        id_blog_postagem = ?;
                ');
                $salva_dados->execute(array(
                    "$this->titulo",
                    "$this->texto",
                    "$this->imagem",
                    "$this->data_publicacao",
                    "$this->video",
                    "$this->url_amigavel",
                    "$this->status",
                    "$this->id_blog_categorias",
                    "$this->id_blog_subcategorias",
                    "$this->id_autores",
                    "$this->id_blog_postagem"
                ));
                $this->setRetorno_dados($this->id_blog_postagem);
            }
            return true;
        } catch (PDOException $e) {
            echo 'Erro: ' . $e->getMessage();
            return false;
        }
    }

    /* =============== FUNÇÃO CONSULTA DADOS =============== */

    public function consulta_dados()
    {

        try {
            $pdo = parent::getDB();

            if ($this->id_blog_categorias != "T") {
                $vsWhereFiltroCategoria = "AND bm.id_blog_categorias = $this->id_blog_categorias";
            } else {
                $vsWhereFiltroCategoria = "";
            }

            if ($this->id_blog_subcategorias != "T") {
                $vsWhereFiltroSubcategoria = "AND bs.id_blog_subcategorias = $this->id_blog_subcategorias";
            } else {
                $vsWhereFiltroSubcategoria = "";
            }

            $consulta_dados = $pdo->prepare("
                SELECT 
                    bp.visualizacoes,
                    bp.id_blog_postagem,
                    bp.imagem,
                    bp.url_amigavel,
                    bp.titulo,
                    bm.descricao as categoria,
                    bs.descricao as subcategoria,
                    a.nome as autor,
                    bp.data_criacao,
                    DATE_FORMAT(bp.data_criacao, '%d/%m/%Y às %H:%i') AS data_criacao_formatado,
                    bp.data_publicacao,
                    DATE_FORMAT(bp.data_publicacao, '%d/%m/%Y às %H:%i') AS data_publicacao_formatado,
                    IF(NOW()>=bp.data_publicacao, 'success', 'info') as cor_linha,
                    IF(NOW()>=bp.data_publicacao, '', 'disabled') as bloqueia_botao,
                    CASE bp.status
                        WHEN 1 THEN 'success'
                        WHEN 0 THEN 'danger'
                    END AS status_class,
                    CASE bp.status
                        WHEN 1 THEN 'Publicado'
                        WHEN 0 THEN 'Rascunho'
                    END AS status
                FROM
                    blog_postagem bp
                    LEFT JOIN blog_subcategorias bs ON bp.id_blog_subcategorias = bs.id_blog_subcategorias
                    LEFT JOIN blog_categorias bm ON bp.id_blog_categorias = bm.id_blog_categorias
                    LEFT JOIN autores a ON a.id_autores = bp.id_autores
                    $vsWhereFiltroCategoria
                    $vsWhereFiltroSubcategoria
                ORDER BY
                    data_publicacao DESC
            ");
            $consulta_dados->execute();
            if ($consulta_dados->rowCount() > 0) :
                $this->setRetorno_dados(json_encode($consulta_dados->fetchAll()));
                return true;
            else :
                return false;
            endif;
        } catch (PDOException $e) {
            echo 'Erro: ' . $e->getMessage();
            return false;
        }
    }

    /* =============== FUNÇÃO EDITA DADOS =============== */

    public function edita_dados()
    {

        try {
            $pdo = parent::getDB();

            $edita_dados = $pdo->prepare("
                SELECT
                    bp.titulo,
                    bp.texto,
                    bp.imagem,
                    DATE_FORMAT(bp.data_publicacao, '%Y-%m-%dT%H:%i') AS data_publicacao,
                    bp.video,
                    bp.url_amigavel,
                    bp.id_blog_categorias,
                    bp.id_blog_subcategorias,
                    a.id_autores,
                    bp.status
                FROM
                    blog_postagem bp
                    LEFT JOIN blog_subcategorias bs ON bp.id_blog_subcategorias = bs.id_blog_subcategorias
                    LEFT JOIN autores a ON bp.id_autores = a.id_autores
                WHERE
                    id_blog_postagem = ?
            ");
            $edita_dados->execute(array(
                "$this->id_blog_postagem"
            ));
            if ($edita_dados->rowCount() > 0) :
                $this->setRetorno_dados(json_encode($edita_dados->fetchAll()));
                return true;
            else :
                return false;
            endif;
        } catch (Exception $e) {
            echo 'Erro: ' . $e->getMessage();
            return false;
        }
    }

    /* =============== GETTERS E SETTERS =============== */

    function getId_blog_postagem()
    {
        return $this->id_blog_postagem;
    }

    function getTitulo()
    {
        return $this->titulo;
    }

    function getTexto()
    {
        return $this->texto;
    }

    function getImagem()
    {
        return $this->imagem;
    }

    function getData_criacao()
    {
        return $this->data_criacao;
    }

    function getData_publicacao()
    {
        return $this->data_publicacao;
    }

    function getVideo()
    {
        return $this->video;
    }

    function getUrl_amigavel()
    {
        return $this->url_amigavel;
    }

    function getStatus()
    {
        return $this->status;
    }

    function getId_blog_categorias()
    {
        return $this->id_blog_categorias;
    }

    function getId_blog_subcategorias()
    {
        return $this->id_blog_subcategorias;
    }

    function getId_autores()
    {
        return $this->id_autores;
    }

    function getRetorno_dados()
    {
        return $this->retorno_dados;
    }

    function setId_blog_postagem($id_blog_postagem)
    {
        $this->id_blog_postagem = $id_blog_postagem;
    }

    function setTitulo($titulo)
    {
        $this->titulo = $titulo;
    }

    function setTexto($texto)
    {
        $this->texto = $texto;
    }

    function setImagem($imagem)
    {
        $this->imagem = $imagem;
    }

    function setData_criacao($data_criacao)
    {
        $this->data_criacao = $data_criacao;
    }

    function setData_publicacao($data_publicacao)
    {
        $this->data_publicacao = $data_publicacao;
    }

    function setVideo($video)
    {
        $this->video = $video;
    }

    function setUrl_amigavel($url_amigavel)
    {
        $this->url_amigavel = $url_amigavel;
    }

    function setStatus($status)
    {
        $this->status = $status;
    }

    function setId_blog_categorias($id_blog_categorias)
    {
        $this->id_blog_categorias = $id_blog_categorias;
    }

    function setId_blog_subcategorias($id_blog_subcategorias)
    {
        $this->id_blog_subcategorias = $id_blog_subcategorias;
    }

    function setId_autores($id_autores)
    {
        $this->id_autores = $id_autores;
    }

    function setRetorno_dados($retorno_dados)
    {
        $this->retorno_dados = $retorno_dados;
    }
}
