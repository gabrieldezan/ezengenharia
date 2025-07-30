$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    /*MASK*/
    var behavior = function (val) {
        return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    },
            options = {onKeyPress: function (val, e, field, options) {
                    field.mask(behavior.apply({}, arguments), options);
                }};
    $('#vsTelefone').mask(behavior, options);

    /*FORM*/
    $("#form_contato").on('submit', (function (e) {
        
        $('#botao_enviar_mensagem').html('<i class="fa fa-spinner fa-pulse"></i> Aguarde...');
        $("#botao_enviar_mensagem").prop('disabled', true);

        e.preventDefault();
        $.ajax({
            url: vsUrl + "wdadmin/controllers/SalvaDadosContatosRecebidos.php",
            type: "POST",
            async: true,
            data: new FormData(this),
            contentType: false,
            cache: false,
            processData: false,
            success: function (vsReturn) {
                $("#botao_enviar_mensagem").html('Enviar Mensagem');
                $("#botao_enviar_mensagem").prop("disabled", false);
                if (vsReturn == "1") {
                    window.location.href = vsUrl + 'obrigado';
                } else {
                    Aviso();
                }
            },
            error: function (vsReturn) {
                $("#botao_enviar_mensagem").html('Enviar Mensagem');
                $("#botao_enviar_mensagem").prop("disabled", false);
                alert('Erro: ' + vsReturn);
            }
        });
        return false;
    }));

});

function Aviso() {
    swal("Aviso!", "Ocorreu um erro ao enviar o contato!", "warning");
}