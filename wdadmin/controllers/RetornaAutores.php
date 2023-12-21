<?php

require_once "../class/Autores.class.php";

$Autores = new Autores();

if ($Autores->consulta_dados()):
    print $Autores->getRetorno_dados();
else:
    print 0;
endif;