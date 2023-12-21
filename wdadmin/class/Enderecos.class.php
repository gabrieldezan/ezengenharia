<?php

require_once "Conexao.class.php";

class Enderecos extends Conexao {
    /* =============== VARIAVEIS =============== */

    private $id_enderecos;
    private $titulo;
    private $endereco;
    private $cidade;
    private $estado;
    private $mapa;
    private $exibe_endereco;
    private $horario_atendimento;
    private $link;
    private $telefone;
    private $status;
    private $retorno_dados;

    /* =============== FUNÇÃO SALVA DADOS =============== */

    public function salva_dados() {
        try {

            $pdo = parent::getDB();

            if ($this->id_enderecos === "") {
                $salva_dados = $pdo->prepare('
                    INSERT INTO enderecos (
                        titulo,
                        endereco,
                        cidade,
                        estado,
                        mapa,
                        exibe_endereco,
                        horario_atendimento,
                        link,
                        telefone,
                        status
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
                        ?
                    );
                ');
                $salva_dados->execute(array(
                    "$this->titulo",
                    "$this->endereco",
                    "$this->cidade",
                    "$this->estado",
                    "$this->mapa",
                    "$this->exibe_endereco",
                    "$this->horario_atendimento",
                    "$this->link",
                    "$this->telefone",
                    "$this->status"
                ));
                $this->setRetorno_dados($pdo->lastInsertId());
            } else {
                $salva_dados = $pdo->prepare('
                    UPDATE enderecos SET 
                        titulo = ?,
                        endereco = ?,
                        cidade = ?,
                        estado = ?,
                        mapa = ?,
                        exibe_endereco = ?,
                        horario_atendimento = ?,
                        link = ?,
                        telefone = ?,
                        status = ?
                    WHERE 
                        id_enderecos = ?;
                ');
                $salva_dados->execute(array(
                    "$this->titulo",
                    "$this->endereco",
                    "$this->cidade",
                    "$this->estado",
                    "$this->mapa",
                    "$this->exibe_endereco",
                    "$this->horario_atendimento",
                    "$this->link",
                    "$this->telefone",
                    "$this->status",
                    "$this->id_enderecos"
                ));
                $this->setRetorno_dados($this->id_enderecos);
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
                    id_enderecos,
                    titulo,
                    endereco,
                    CONCAT(cidade, '-', estado) AS cidade_estado,
                    CASE status
                        WHEN 1 THEN 'success'
                        WHEN 0 THEN 'danger'
                    END AS status_class,
                    CASE status
                        WHEN 1 THEN 'Sim'
                        WHEN 0 THEN 'Não'
                    END AS status
                FROM
                    enderecos
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
                    endereco,
                    cidade,
                    estado,
                    mapa,
                    exibe_endereco,
                    horario_atendimento,
                    link,
                    telefone,
                    status
                FROM
                    enderecos
                WHERE
                    id_enderecos =  ?
            ");
            $edita_dados->execute(array(
                "$this->id_enderecos"
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

    function getId_enderecos() {
        return $this->id_enderecos;
    }

    function getTitulo() {
        return $this->titulo;
    }

    function getEndereco() {
        return $this->endereco;
    }

    function getCidade() {
        return $this->cidade;
    }

    function getEstado() {
        return $this->estado;
    }

    function getMapa() {
        return $this->mapa;
    }

    function getExibe_endereco() {
        return $this->exibe_endereco;
    }

    function getHorario_atendimento() {
        return $this->horario_atendimento;
    }

    function getLink() {
        return $this->link;
    }

    function getTelefone() {
        return $this->telefone;
    }

    function getStatus() {
        return $this->status;
    }

    function getRetorno_dados() {
        return $this->retorno_dados;
    }

    function setId_enderecos($id_enderecos) {
        $this->id_enderecos = $id_enderecos;
    }

    function setTitulo($titulo) {
        $this->titulo = $titulo;
    }

    function setEndereco($endereco) {
        $this->endereco = $endereco;
    }

    function setCidade($cidade) {
        $this->cidade = $cidade;
    }

    function setEstado($estado) {
        $this->estado = $estado;
    }

    function setMapa($mapa) {
        $this->mapa = $mapa;
    }

    function setExibe_endereco($exibe_endereco) {
        $this->exibe_endereco = $exibe_endereco;
    }

    function setHorario_atendimento($horario_atendimento) {
        $this->horario_atendimento = $horario_atendimento;
    }

    function setLink($link) {
        $this->link = $link;
    }

    function setTelefone($telefone) {
        $this->telefone = $telefone;
    }

    function setStatus($status) {
        $this->status = $status;
    }

    function setRetorno_dados($retorno_dados) {
        $this->retorno_dados = $retorno_dados;
    }

}
