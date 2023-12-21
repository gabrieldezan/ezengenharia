<?php

function corrigir_idioma($texto) {
    $mes_ingles = array('January', 'Februrary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
    $substitui_para_portugues = array('Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jul', 'Jul', 'Jun', 'Set', 'Out', 'Nov', 'Dez');
    return strtolower(str_replace($mes_ingles, $substitui_para_portugues, $texto));
}