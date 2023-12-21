$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    /*ALTERA TITULO DA PAGINA*/
    $(this).attr("title", "WD Admin - Cadastro de Imagens da Galeria");

    verifica_tamanho_imagens("galeria_imagem");

    $('#inputDescricao').wysihtml5();

    monta_select_multiplo("imagensGrupos", "id_galeria_grupo", "descricao", "galeria_grupo", "WHERE status = 1", "descricao", "");

    $("#form_galeria_imagens").on('submit', (function (e) {

        Loading();

        e.preventDefault();
        $.ajax({
            url: vsUrl + "controllers/SalvaDadosGaleriaImagem.php",
            type: "POST",
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data > 0) {
                    $("#inputIdGaleriaImagens").val() === "" ? AtualizaIdUrl(data) : "";
                    $("#inputIdGaleriaImagens").val(data);
                    verifica_edicao();
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
    var id = $("#inputIdGaleriaImagens").val();

    /*LIMPA AREA DE IMAGEM*/
    $(".dropify-clear").click();

    /*CASO EXISTA O ID, EXECUTA A FUNÇÃO DE EDIÇÃO*/
    if (id !== "") {
        edita_galeria_imagens(id);
    } else {
        CloseLoading();
    }
}

/*CARREGA DADOS DO USUÁRIO SELECIONADO*/
function edita_galeria_imagens(viIdGaleriaImagens) {

    $.ajax({
        url: vsUrl + "controllers/RetornaGaleriaImagemSelecionado.php",
        type: "POST",
        dataType: "json",
        async: false,
        data: ({
            viIdGaleriaImagens: viIdGaleriaImagens
        }),
        success: function (data) {
            if (data !== 0) {
                $("#inputImagem1Atual").val(data[0].imagem1);
                $("#imgImagem1Atual").attr("src", vsUrl + "uploads/galeria_imagem/" + data[0].imagem1);
                $("#inputImagem2Atual").val(data[0].imagem2);
                $("#imgImagem2Atual").attr("src", vsUrl + "uploads/galeria_imagem/" + data[0].imagem2);
                $("#inputImagem3Atual").val(data[0].imagem3);
                $("#imgImagem3Atual").attr("src", vsUrl + "uploads/galeria_imagem/" + data[0].imagem3);
                $("#inputImagem4Atual").val(data[0].imagem4);
                $("#imgImagem4Atual").attr("src", vsUrl + "uploads/galeria_imagem/" + data[0].imagem4);
                $("#inputImagem5Atual").val(data[0].imagem5);
                $("#imgImagem5Atual").attr("src", vsUrl + "uploads/galeria_imagem/" + data[0].imagem5);
                $("#inputTitulo").val(data[0].titulo);
                $("#inputDescricao").val(data[0].descricao);
                $("#inputDetalhes").val(data[0].detalhes);
                $("#inputLink1").val(data[0].link1);
                $("#inputLink2").val(data[0].link2);
                $("#inputYoutube").val(data[0].youtube);
                getGrupos(viIdGaleriaImagens);
                CloseLoading();
            } else {
                $("#inputIdGaleriaImagens").val("");
                CloseLoading();
                AvisoPersonalizado("Dados não encontrados!");
            }
        },
        error: function () {
            CloseLoading();
            Erro();
        }
    });
}

function getGrupos(viIdGaleriaImagens) {

    $.ajax({
        url: vsUrl + "controllers/RetornaGaleriaImagemGrupos.php",
        type: "POST",
        dataType: "json",
        async: true,
        data: ({
            viIdGaleriaImagens: viIdGaleriaImagens
        }),
        success: function (data) {
            monta_select_multiplo("imagensGrupos", "id_galeria_grupo", "descricao", "galeria_grupo", "WHERE status = 1", "descricao", data, false, false);
        },
        error: function () {
            monta_select_multiplo("imagensGrupos", "id_galeria_grupo", "descricao", "galeria_grupo", "WHERE status = 1", "descricao", "", false, false);
            Erro();
        }
    });
}