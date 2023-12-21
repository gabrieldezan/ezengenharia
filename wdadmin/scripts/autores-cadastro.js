$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    /*ALTERA TITULO DA PAGINA*/
    $(this).attr("title", "WD Admin - Cadastro de Autores");
    
    if ($("#inputDescricao").length > 0) {
        tinymce.init({
            selector: "textarea#inputDescricao",
            language: 'pt_BR',
            language_url: vsUrl + '/js/pt_BR.js',
            theme: "modern",
            height: 300,
            width: '100%',
            plugins: [
                "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                "save table contextmenu directionality emoticons template paste textcolor"
            ],
            toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",

        });
    }
    
    verifica_tamanho_imagens("autores");

    $("#form_autores").on('submit', (function (e) {

        Loading();

        e.preventDefault();
        $.ajax({
            url: vsUrl + "controllers/SalvaDadosAutores.php",
            type: "POST",
            async: true,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            success: function (data) {
                if (data > 0) {
                    $("#inputIdAutores").val(data);
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
    var id = $("#inputIdAutores").val();

    /*CASO EXISTA O ID, EXECUTA A FUNÇÃO DE EDIÇÃO*/
    if (id !== "") {
        edita_autores(id);
    } else {
        CloseLoading();
    }
}

/*CARREGA DADOS DO USUÁRIO SELECIONADO*/
function edita_autores(viIdAutores) {

    $.ajax({
        url: vsUrl + "controllers/RetornaAutorSelecionado.php",
        type: "POST",
        dataType: "json",
        async: false,
        data: ({
            viIdAutores: viIdAutores
        }),
        success: function (data) {
            if (data !== 0) {
                $("#inputNome").val(data[0].nome);
                $("#inputDescricao").val(data[0].descricao);
                $("#inputImagemAtual").val(data[0].imagem);
                $("#imgImagemAtual").attr("src", vsUrl + "uploads/autores/" + data[0].imagem);
                $("#inputStatus").val(data[0].status);
                CloseLoading();
            } else {
                AvisoPersonalizado("Dados não encontrados!");
                $("#inputIdAutores").val("");
            }
            CloseLoading();
        },
        error: function () {
            CloseLoading();
            Erro();
        }
    });
}