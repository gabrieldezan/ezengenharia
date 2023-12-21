<?php

require_once "Conexao.class.php";

class Autores extends Conexao {
    /* =============== VARIAVEIS =============== */

    private $id_autores;
    private $nome;
    private $descricao;
    private $imagem;
    private $status;
    private $retorno_dados;

    /* =============== FUNÇÃO SALVA DADOS =============== */

    public function salva_dados() {
        try {

            $pdo = parent::getDB();

            if ($this->id_autores === "") {
                $salva_dados = $pdo->prepare('
                    INSERT INTO autores (
                        nome,
                        descricao,
                        imagem,
                        status
                    ) VALUES (
                        ?,
                        ?,
                        ?,
                        ?
                    );
                ');
                $salva_dados->execute(array(
                    "$this->nome",
                    "$this->descricao",
                    "$this->imagem",
                    "$this->status"
                ));
                $this->setRetorno_dados($pdo->lastInsertId());
            } else {
                $salva_dados = $pdo->prepare('
                    UPDATE autores SET 
                        nome        = ?,
                        descricao   = ?,
                        imagem      = ?,
                        status      = ?
                    WHERE 
                        id_autores  = ?;
                ');
                $salva_dados->execute(array(
                    "$this->nome",
                    "$this->descricao",
                    "$this->imagem",
                    "$this->status",
                    "$this->id_autores"
                ));
                $this->setRetorno_dados($this->id_autores);
            }
            return true;
        } catch (PDOException $e) {
            echo 'Erro: ' . $e->getMessage();
            return false;
        }
    }

    /* =============== FUNÇÃO CONSULTA DADOS =============== */

    public function consulta_dados() {

        try {
            $pdo = parent::getDB();

            $consulta_dados = $pdo->prepare("
                SELECT
                    id_autores,
                    nome,
                    descricao,
                    imagem,
                    CASE status
                        WHEN 1 THEN 'success'
                        WHEN 0 THEN 'danger'
                    END AS status_class,
                    CASE status
                        WHEN 1 THEN 'Ativo'
                        WHEN 0 THEN 'Inativo'
                    END AS status
                FROM
                    autores
            ");
            $consulta_dados->execute();
            if ($consulta_dados->rowCount() > 0):
                $this->setRetorno_dados(json_encode($consulta_dados->fetchAll()));
                return true;
            else:
                return false;
            endif;
        } catch (PDOException $e) {
            echo 'Erro: ' . $e->getMessage();
            return false;
        }
    }

    /* =============== FUNÇÃO EDITA DADOS =============== */

    public function edita_dados() {

        try {
            $pdo = parent::getDB();

            $edita_dados = $pdo->prepare("
                SELECT
                    nome,
                    descricao,
                    imagem,
                    status
                FROM
                    autores
                WHERE
                    id_autores =  ?
            ");
            $edita_dados->execute(array(
                "$this->id_autores"
            ));
            if ($edita_dados->rowCount() > 0):
                $this->setRetorno_dados(json_encode($edita_dados->fetchAll()));
                return true;
            else:
                return false;
            endif;
        } catch (Exception $e) {
            echo 'Erro: ' . $e->getMessage();
            return false;
        }
    }
    
    /* =============== GETTERS E SETTERS =============== */

    function getId_autores() {
        return $this->id_autores;
    }

    function getNome() {
        return $this->nome;
    }

    function getDescricao() {
        return $this->descricao;
    }

    function getImagem() {
        return $this->imagem;
    }

    function getStatus() {
        return $this->status;
    }

    function getRetorno_dados() {
        return $this->retorno_dados;
    }

    function setId_autores($id_autores) {
        $this->id_autores = $id_autores;
    }

    function setNome($nome) {
        $this->nome = $nome;
    }

    function setDescricao($descricao) {
        $this->descricao = $descricao;
    }

    function setImagem($imagem) {
        $this->imagem = $imagem;
    }

    function setStatus($status) {
        $this->status = $status;
    }

    function setRetorno_dados($retorno_dados) {
        $this->retorno_dados = $retorno_dados;
    }

}