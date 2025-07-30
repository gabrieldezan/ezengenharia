$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    /*ALTERA TITULO DA PAGINA*/
    $(this).attr("title", "WD Admin - Cadastro de Métricas");

    $("#form_metricas").on('submit', (function (e) {

        Loading();

        e.preventDefault();
        $.ajax({
            url: vsUrl + "controllers/SalvaDadosMetricas.php",
            type: "POST",
            async: true,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data > 0) {
                    $("#inputIdMetricas").val() === "" ? AtualizaIdUrl(data) : "";
                    $("#inputIdMetricas").val(data);
                    CloseLoading();
                    Sucesso();
                } else {
                    CloseLoading();
                    Aviso();
                }
            },
            error: function () {
                CloseLoading();
                Erro();
            }
        });
        return false;
    }));

    /*CHAMA FUNÇÃO PARA VERIFICAR EDIÇÃO OU CADASTRO*/
    verifica_edicao();

});

/*FUNÇÃO QUE VERIFICA SE EXISTE UM ID*/
function verifica_edicao() {

    /*PEGA ID*/
    var id = $("#inputIdMetricas").val();

    /*CASO EXISTA O ID, EXECUTA A FUNÇÃO DE EDIÇÃO*/
    if (id !== "") {
        edita_metricas(id);
    } else {
        CloseLoading();
    }
}

/*CARREGA DADOS DO USUÁRIO SELECIONADO*/
function edita_metricas(viIdMetricas) {

    $.ajax({
        url: vsUrl + "controllers/RetornaMetricasSelecionado.php",
        type: "POST",
        dataType: "json",
        async: false,
        data: ({
            viIdMetricas: viIdMetricas
        }),
        success: function (data) {
            if (data !== 0) {
                $("#inputTitulo").val(data[0].titulo);
                $("#inputNumero").val(data[0].numero);
                $("#inputMedida").val(data[0].medida);
                $("#inputIcone").val(data[0].icone);
                $("#inputPosicao").val(data[0].posicao);
                $("#inputStatus").val(data[0].status);
                CloseLoading();
            } else {
                AvisoPersonalizado("Dados não encontrados!");
                $("#inputIdMetricas").val("");
            }
            CloseLoading();
        },
        error: function () {
            CloseLoading();
            Erro();
        }
    });
}