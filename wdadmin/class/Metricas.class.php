<?php

require_once "Conexao.class.php";

class Metricas extends Conexao {
    /* =============== VARIAVEIS =============== */

    private $id_metricas;
    private $titulo;
    private $numero;
    private $medida;
    private $posicao;
    private $status;
    private $retorno_dados;

    /* =============== FUNÇÃO SALVA DADOS =============== */

    public function salva_dados() {
        try {

            $pdo = parent::getDB();

            if ($this->id_metricas === "") {
                $salva_dados = $pdo->prepare('
                    INSERT INTO metricas (
                        titulo,
                        numero,
                        medida,
                        posicao,
                        status
                    ) VALUES (
                        ?,
                        ?,
                        ?,
                        ?,
                        ?
                    );
                ');
                $salva_dados->execute(array(
                    "$this->titulo",
                    "$this->numero",
                    "$this->medida",
                    "$this->posicao",
                    "$this->status"
                ));
                $this->setRetorno_dados($pdo->lastInsertId());
            } else {
                $salva_dados = $pdo->prepare('
                    UPDATE metricas SET 
                        titulo = ?,
                        numero = ?,
                        medida = ?,
                        posicao = ?,
                        status = ?
                    WHERE 
                        id_metricas = ?;
                ');
                $salva_dados->execute(array(
                    "$this->titulo",
                    "$this->numero",
                    "$this->medida",
                    "$this->posicao",
                    "$this->status",
                    "$this->id_metricas"
                ));
                $this->setRetorno_dados($this->id_metricas);
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
                    id_metricas,
                    titulo,
                    CONCAT(numero, ' ', medida) AS numero_medida,
                    CASE status
                        WHEN 1 THEN 'success'
                        WHEN 0 THEN 'danger'
                    END AS status_class,
                    CASE status
                        WHEN 1 THEN 'Sim'
                        WHEN 0 THEN 'Não'
                    END AS status
                FROM
                    metricas
                ORDER BY
                    posicao
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
                    titulo,
                    numero,
                    medida,
                    posicao,
                    status
                FROM
                    metricas
                WHERE
                    id_metricas = ?
            ");
            $edita_dados->execute(array(
                "$this->id_metricas"
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

    function getId_metricas() {
        return $this->id_metricas;
    }

    function getTitulo() {
        return $this->titulo;
    }

    function getNumero() {
        return $this->numero;
    }

    function getMedida() {
        return $this->medida;
    }

    function getPosicao() {
        return $this->posicao;
    }

    function getStatus() {
        return $this->status;
    }

    function getRetorno_dados() {
        return $this->retorno_dados;
    }

    function setId_metricas($id_metricas) {
        $this->id_metricas = $id_metricas;
    }

    function setTitulo($titulo) {
        $this->titulo = $titulo;
    }

    function setNumero($numero) {
        $this->numero = $numero;
    }

    function setMedida($medida) {
        $this->medida = $medida;
    }

    function setPosicao($posicao) {
        $this->posicao = $posicao;
    }

    function setStatus($status) {
        $this->status = $status;
    }

    function setRetorno_dados($retorno_dados) {
        $this->retorno_dados = $retorno_dados;
    }

}
