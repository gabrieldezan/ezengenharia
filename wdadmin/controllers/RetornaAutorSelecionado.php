<?php

require_once "../class/Autores.class.php";

$Autores = new Autores();
$Autores->setId_autores($_POST['viIdAutores']);

if ($Autores->edita_dados()):
    print $Autores->getRetorno_dados();
else:
    print 0;
endif;