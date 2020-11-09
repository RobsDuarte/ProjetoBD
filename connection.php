<?php
    //Funcão para se conectar com o banco de dados
    function DBConnect()
    {   
        $link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE) or die(mysqli_connect_error());
        mysqli_set_charset($link, DB_CHARSET) or die(mysqli_error($link));
        return $link;
    }

    //Funcão para fechar conexão com banco de dados
    function DBClose($link)
    {
        mysqli_close($link) or die(mysqli_error($link));
    }

    
?>