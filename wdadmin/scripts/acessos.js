$(document).ready(function () {

    vsUrl = $("#vsUrl").val();

    $(this).attr("title", "WD Admin - Acessos");

    $('#div_tabela').hide();
    $('#div_aviso').hide();

    $('#tabela_acessos').DataTable();

    carrega_acessos();

    
});

/*PESQUISA O ENDEREÇO*/
function carrega_acessos() {

    Loading();

    $.ajax({
        url: vsUrl + "controllers/RetornaAcessos.php",
        type: "POST",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data !== 0) {
                $("#tabela_acessos tbody").html("");
                $('#tabela_acessos').DataTable().destroy();
                var table = $('#tabela_acessos').DataTable({
                    "language": {
                        "url": vsUrl + "assets/plugins/datatables/Portuguese-Brasil.json"
                    },
                    "lengthMenu": [[10, 25, 50, 100, 250, -1], [10, 25, 50, 100, 250, "Todos"]],
                    dom: 'Blfrtip',
                    buttons: [
                        {
                            extend: 'copy',
                            text: '<i class="far fa-copy fa-fw"></i> Copiar',
                            exportOptions: {
                                modifier: {
                                    page: 'current'
                                }
                            }
                        },
                        {
                            extend: 'excel',
                            text: '<i class="far fa-file-excel fa-fw"></i> Excel',
                            exportOptions: {
                                modifier: {
                                    page: 'current'
                                }
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            text: '<i class="far fa-file-pdf fa-fw"></i> PDF',
                            exportOptions: {
                                modifier: {
                                    page: 'current'
                                }
                            },
                            orientation: 'landscape',
                            pageSize: 'LEGAL'
                        },
                        {
                            extend: 'print',
                            text: '<i class="far fas fa-print fa-fw"></i> Imprimir',
                            exportOptions: {
                                modifier: {
                                    page: 'current'
                                }
                            },
                            orientation: 'landscape',
                            pageSize: 'LEGAL'
                        },
                        {
                            text: '<i class="fas fa-plus"></i> Novo',
                            action: function () {
                                window.location.href = "acessos/cadastro";
                            }
                        }
                    ],
                    fixedHeader: false,
                    colReorder: false,
                    responsive: true,
                    "processing": true,
                    data: data,
                    "columns": [
                        {"data": "id_acessos"},
                        {"data": "funcao"},
                        {
                            "render": function (data, type, row) {
                                return "<span class=\"label label-" + row.status_class + "\">" + row.status_descricao + "</span>";
                            }
                        },
                        {
                            "render": function (data, type, row) {
                                return "\
                                    <a href=\"acessos/cadastro/" + row.id_acessos + "\" class=\"btn btn-sm btn-outline-secondary\" data-toggle=\"tooltip\" data-placement=\"left\" title=\"Editar " + row.funcao + "\"><i class=\"fas fa-edit\"></i></a>&nbsp;\n\
                                    <button type=\"button\" class=\"btn btn-danger btn-sm\" onclick=\"confirma_exclusao_registro(" + row.id_acessos + ", 'acessos', '', '', '', '', '', '');\" data-toggle=\"tooltip\" title=\"Remover " + row.funcao + "\"><i class=\"far fa-trash-alt fa-fw\" aria-hidden=\"true\"></i></button>\
                                ";
                            }
                        }
                    ],
                    'columnDefs': [
                        {
                            "targets": 0,
                            "className": "text-center"
                        },
                        {
                            "targets": 2,
                            "className": "text-center"
                        },
                        {
                            "targets": 3,
                            "className": "text-center"
                        }
                    ],
                    "drawCallback": function (settings) {
                        $('[data-toggle="tooltip"]').tooltip();
                    }
                });
                $('#div_aviso').hide();
                $('#div_tabela').show();
            } else {
                $('#div_tabela').hide();
                $('#div_aviso').show();
            }
            CloseLoading();
        },
        error: function () {
            $("#tabela_acessos tbody").html("");
            CloseLoading();
            Erro();
        }
    });
}