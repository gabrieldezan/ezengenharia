<?php

require_once "../class/Depoimentos.class.php";

$Depoimentos = new Depoimentos();

if ($Depoimentos->consulta_dados()):
    print $Depoimentos->getRetorno_dados();
else:
    print 0;
endif;