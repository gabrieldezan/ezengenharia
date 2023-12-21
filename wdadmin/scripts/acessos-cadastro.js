$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    /*ALTERA TITULO DA PAGINA*/
    $(this).attr("title", "WD Admin - Cadastro de Acessos");

    $("#form_acessos").on('submit', (function (e) {

        Loading();

        e.preventDefault();
        $.ajax({
            url: vsUrl + "controllers/SalvaDadosAcessos.php",
            type: "POST",
            async: true,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data > 0) {
                    $("#inputIdAcessos").val() === "" ? AtualizaIdUrl(data) : "";
                    $("#inputIdAcessos").val(data);
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
    var id = $("#inputIdAcessos").val();

    /*CASO EXISTA O ID, EXECUTA A FUNÇÃO DE EDIÇÃO*/
    if (id !== "") {
        edita_acessos(id);
    } else {
        CloseLoading();
    }
}

/*CARREGA DADOS DO USUÁRIO SELECIONADO*/
function edita_acessos(viIdAcessos) {

    $.ajax({
        url: vsUrl + "controllers/RetornaAcessosSelecionado.php",
        type: "POST",
        dataType: "json",
        async: false,
        data: ({
            viIdAcessos: viIdAcessos
        }),
        success: function (data) {
            if (data !== 0) {
                $("#inputFuncao").val(data[0].funcao);
                $("#inputStatus").val(data[0].status);
                CloseLoading();
            } else {
                AvisoPersonalizado("Dados não encontrados!");
                $("#inputIdAcessos").val("");
            }
            CloseLoading();
        },
        error: function () {
            CloseLoading();
            Erro();
        }
    });
}