<?php

require_once "Conexao.class.php";

class Depoimentos extends Conexao {
    /* =============== VARIAVEIS =============== */

    private $id_depoimentos;
    private $nome;
    private $texto;
    private $imagem;
    private $empresa;
    private $retorno_dados;

    /* =============== FUNÇÃO SALVA DADOS =============== */

    public function salva_dados() {
        try {

            $pdo = parent::getDB();

            if ($this->id_depoimentos === "") {
                $salva_dados = $pdo->prepare('
                    INSERT INTO depoimentos (
                        nome,
                        texto,
                        imagem,
                        empresa
                    ) VALUES (
                        ?,
                        ?,
                        ?,
                        ?
                    );
                ');
                $salva_dados->execute(array(
                    "$this->nome",
                    "$this->texto",
                    "$this->imagem",
                    "$this->empresa"
                ));
                $this->setRetorno_dados($pdo->lastInsertId());
            } else {
                $salva_dados = $pdo->prepare('
                    UPDATE depoimentos SET 
                        nome = ?,
                        texto = ?,
                        imagem = ?,
                        empresa = ?
                    WHERE 
                        id_depoimentos = ?;
                ');
                $salva_dados->execute(array(
                    "$this->nome",
                    "$this->texto",
                    "$this->imagem",
                    "$this->empresa",
                    "$this->id_depoimentos"
                ));
                $this->setRetorno_dados($this->id_depoimentos);
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
                    id_depoimentos,
                    empresa,
                    nome,
                    imagem
                FROM
                    depoimentos
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
                    texto,
                    imagem,
                    empresa
                FROM
                    depoimentos
                WHERE
                    id_depoimentos =  ?
            ");
            $edita_dados->execute(array(
                "$this->id_depoimentos"
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

    function getId_depoimentos() {
        return $this->id_depoimentos;
    }

    function getNome() {
        return $this->nome;
    }

    function getTexto() {
        return $this->texto;
    }

    function getImagem() {
        return $this->imagem;
    }

    function getEmpresa() {
        return $this->empresa;
    }

    function getRetorno_dados() {
        return $this->retorno_dados;
    }

    function setId_depoimentos($id_depoimentos) {
        $this->id_depoimentos = $id_depoimentos;
    }

    function setNome($nome) {
        $this->nome = $nome;
    }

    function setTexto($texto) {
        $this->texto = $texto;
    }

    function setImagem($imagem) {
        $this->imagem = $imagem;
    }

    function setEmpresa($empresa) {
        $this->empresa = $empresa;
    }

    function setRetorno_dados($retorno_dados) {
        $this->retorno_dados = $retorno_dados;
    }

}
