$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    /*APLICA CAIXA DE TEXTO*/
    $('#inputResumo').wysihtml5();

    /*APLICA CAIXA DE TEXTO*/
    if ($("#inputDescricao").length > 0) {
        tinymce.init({
            selector: "textarea#inputDescricao",
            language: 'pt_BR',
            language_url: vsUrl + '/js/pt_BR.js',
            theme: "modern",
            height: 250,
            width: '100%',
            plugins: [
                "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                "save table contextmenu directionality emoticons template paste textcolor"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",

        });
    }

    /*ALTERA TITULO DA PAGINA*/
    $(this).attr("title", "WD Admin - Cadastro de Serviços");

    verifica_tamanho_imagens("servicos");

    $("#form_servicos").on('submit', (function (e) {

        Loading();

        e.preventDefault();
        $.ajax({
            url: vsUrl + "controllers/SalvaDadosServicos.php",
            type: "POST",
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data > 0) {
                    $("#inputIdServicos").val() === "" ? AtualizaIdUrl(data) : "";
                    $("#inputIdServicos").val(data);
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

    // /*BOTÃO NOVO*/
    // $("#botao_nova_solucao").click(function (e) {
    //     limpa_form_solucoes();
    // });

    // /*SUBMETE FORM SOLUÇÕES*/
    // $("#form_solucoes").on('submit', (function (e) {

    //     Loading();

    //     e.preventDefault();
    //     $.ajax({
    //         url: vsUrl + "controllers/SalvaDadosSolucoes.php",
    //         type: "POST",
    //         data: new FormData(this),
    //         contentType: false,
    //         cache: false,
    //         processData: false,
    //         success: function (data) {
    //             if (data > 0) {
    //                 limpa_form_solucoes();
    //                 consulta_solucoes();
    //                 Sucesso();
    //             } else {
    //                 CloseLoading();
    //                 Aviso();
    //             }
    //         },
    //         error: function () {
    //             CloseLoading();
    //             Erro();
    //         }
    //     });
    //     return false;
    // }));

    /*CHAMA FUNÇÃO PARA VERIFICAR EDIÇÃO OU CADASTRO*/
    verifica_edicao();

});

/*FUNÇÃO QUE VERIFICA SE EXISTE UM ID*/
function verifica_edicao() {

    /*PEGA ID*/
    var id = $("#inputIdServicos").val();

    /*LIMPA AREA DE IMAGEM*/
    $(".dropify-clear").click();

    /*CASO EXISTA O ID, EXECUTA A FUNÇÃO DE EDIÇÃO*/
    if (id !== "") {
        edita_servicos(id);
        // consulta_solucoes();
    } else {
        CloseLoading();
    }
}

/*CARREGA DADOS DO SERVIÇO SELECIONADO*/
function edita_servicos(viIdServicos) {

    $.ajax({
        url: vsUrl + "controllers/RetornaServicosSelecionado.php",
        type: "POST",
        dataType: "json",
        async: false,
        data: ({
            viIdServicos: viIdServicos
        }),
        success: function (data) {
            if (data !== 0) {
                $("#inputTitulo").val(data[0].titulo);
                $("#inputResumo").val(data[0].resumo);
                $("#inputDescricao").val(data[0].descricao);
                $("#inputImagemAtual").val(data[0].imagem);
                $("#imgImagemAtual").attr("src", vsUrl + "uploads/servicos/" + data[0].imagem);
                $("#inputStatus").val(data[0].status);
                CloseLoading();
            } else {
                $("#inputIdServicos").val("");
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

/*CARREGA CORES DA SOLUÇÃO*/
// function consulta_solucoes() {

//     var viIdServicos = $("#hiddenIdServicos").val();

//     $.ajax({
//         url: vsUrl + "controllers/RetornaSolucoes.php",
//         type: "POST",
//         dataType: "json",
//         async: false,
//         data: ({
//             viIdServicos: viIdServicos
//         }),
//         success: function (data) {
//             if (data != 0) {
//                 $("#tabela_solucoes tbody").html("");
//                 for (i = 0; i < data.length; i++) {
//                     $("#tabela_solucoes tbody").append(
//                         "<tr>" +
//                         "<td>" + data[i].titulo + "</td>" +
//                         "<td>" + data[i].valor + "</td>" +
//                         "<td>" + data[i].periodo + "</td>" +
//                         "<td align=\"center\">" +
//                         "<button type=\"button\" class=\"btn btn-secondary btn-sm\" onclick=\"edita_dados_solucao(" + data[i].id_solucoes + ")\" data-toggle=\"tooltip\" data-placement=\"left\" title=\"Editar solução " + data[i].titulo + "\"><i class=\"far fa-edit fa-fw\" aria-hidden=\"true\"></i></button>&nbsp;" +
//                         "<button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"confirma_exclusao_registro(" + data[i].id_solucoes + ", 'solucoes', 'solucoes', '', '', '', '', '');\" data-toggle=\"tooltip\" title=\"Remover " + data[i].titulo + "\"><i class=\"far fa-trash-alt fa-fw\" aria-hidden=\"true\"></i></button>" +
//                         "</td>" +
//                         "</tr>"
//                     );
//                 }
//                 $('[data-toggle="tooltip"]').tooltip();
//             } else {
//                 $("#tabela_solucoes tbody").html("");
//                 $("#tabela_solucoes tbody").append(
//                     "<tr>" +
//                     "<td align=\"center\" colspan=\"10\">Nenhuma solução encontrada!</td>" +
//                     "</tr>"
//                 );
//             }
//             CloseLoading();
//         },
//         error: function () {
//             CloseLoading();
//             Erro();
//         }
//     });
// }

// /*CARREGA DADOS DA SOLUÇÃO SELECIONADA*/
// function edita_dados_solucao(viIdSolucoes) {

//     Loading();

//     $.ajax({
//         url: vsUrl + "controllers/RetornaSolucoesSelecionado.php",
//         type: "POST",
//         dataType: "json",
//         data: ({
//             viIdSolucoes: viIdSolucoes
//         }),
//         success: function (data) {
//             limpa_form_solucoes();
//             $("#inputIdSolucoes").val(viIdSolucoes);
//             $("#inputTituloSolucoes").val(data[0].titulo);
//             $("#inputValorSolucoes").val(data[0].valor);
//             $("#inputPeriodoSolucoes").val(data[0].periodo);
//             CloseLoading();
//         },
//         error: function () {
//             CloseLoading();
//             Erro();
//         }
//     });
// }

// /*LIMPA FORMULÁRIO SOLUÇÕES*/
// function limpa_form_solucoes() {
//     $(".dropify-clear").click();
//     $("#inputIdSolucoes").val("");
//     $("#inputTituloSolucoes").val("");
//     $("#inputValorSolucoes").val("");
//     $("#inputPeriodoSolucoes").val("");
// }