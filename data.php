<?php
    function getObitosData()
    {
       $r = DBExecute( "SELECT count(listOfValuesID) AS mortosEVivos FROM visu 
                    WHERE (questionID = 123 AND listOfValuesID = 275) 
                    OR (questionID = 123 AND listOfValuesID = 276)
                    GROUP BY listOfValuesID");

        while($res = mysqli_fetch_assoc($r))
        {
            $mortoEVivo[] = $res;
        }

        $dataPointsObito = array( 
        array("label"=>"Altas", "y"=>$mortoEVivo[1]["mortosEVivos"]  * 100 / ($mortoEVivo[1]["mortosEVivos"] + $mortoEVivo[0]["mortosEVivos"]) ),
        array("label"=>"Obitos", "y"=>$mortoEVivo[0]["mortosEVivos"] * 100 / ($mortoEVivo[1]["mortosEVivos"] + $mortoEVivo[0]["mortosEVivos"]) )
        );

        return $dataPointsObito;
    }

	function getObitosDataFem()
    {
        $r = DBExecute( "SELECT COUNT(participantID) AS qntobitosfem 
                        FROM (SELECT * FROM mortos2) M INNER JOIN
                        (SELECT participantID AS idfem FROM fem) F ON M.participantID=F.idfem
                        UNION ALL
                        SELECT COUNT(participantID) AS qntaltasfem 
                        FROM (SELECT * FROM vivos2) M INNER JOIN
                        (SELECT participantID AS idfem FROM fem) F ON M.participantID=F.idfem");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoFem[] = $res;
        }
        $dataPointsObitoFem = array(array("label"=>"Altas", "y"=>$dataObitoFem[1]["qntobitosfem"]  * 100 / ($dataObitoFem[1]["qntobitosfem"] + 
            $dataObitoFem[0]["qntobitosfem"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoFem[0]["qntobitosfem"] * 100 / ($dataObitoFem[1]["qntobitosfem"] + $dataObitoFem[0]["qntobitosfem"]) ));

        return $dataPointsObitoFem;
    }

    function getObitosDataMan()
    {
         $r = DBExecute( "SELECT COUNT(participantID) AS qntobitosmasc 
                        FROM (SELECT * FROM mortos2) M INNER JOIN
                        (SELECT participantID AS idfem FROM masc) F ON M.participantID=F.idfem
                        UNION ALL
                        SELECT COUNT(participantID) AS qntobitosmasc 
                        FROM (SELECT * FROM vivos2) M INNER JOIN
                        (SELECT participantID AS idfem FROM masc) F ON M.participantID=F.idfem");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoMan[] = $res;
        }
        $dataPointsObitoMan = array(array("label"=>"Altas", "y"=>$dataObitoMan[1]["qntobitosmasc"]  * 100 / ($dataObitoMan[1]["qntobitosmasc"] + $dataObitoMan[0]["qntobitosmasc"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoMan[0]["qntobitosmasc"] * 100 / ($dataObitoMan[1]["qntobitosmasc"] + $dataObitoMan[0]["qntobitosmasc"]) ));

        return $dataPointsObitoMan;
    }

    function getObitosDataFum(){
        $r = DBExecute("SELECT count(participantID) AS qntobitosfum FROM obitosfumantes
                        UNION ALL
                        SELECT count(participantID) FROM altasfumantes");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoFum[] = $res;
        }

        $dataPointsObitoFum = array(array("label"=>"Altas", "y"=>$dataObitoFum[1]["qntobitosfum"]  * 100 / ($dataObitoFum[1]["qntobitosfum"] + $dataObitoFum[0]["qntobitosfum"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoFum[0]["qntobitosfum"] * 100 / ($dataObitoFum[1]["qntobitosfum"] + $dataObitoFum[0]["qntobitosfum"]) ));

        return $dataPointsObitoFum;
    }

    function getObitosDataAsm(){
        $r = DBExecute("SELECT count(participantID) AS qntobitosasm FROM obitosasmaticos
                        UNION ALL
                        SELECT count(participantID) FROM vivosasmaticos");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoAsm[] = $res;
        }

        $dataPointsObitoAsm = array(array("label"=>"Altas", "y"=>$dataObitoAsm[1]["qntobitosasm"]  * 100 / ($dataObitoAsm[1]["qntobitosasm"] + $dataObitoAsm[0]["qntobitosasm"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoAsm[0]["qntobitosasm"] * 100 / ($dataObitoAsm[1]["qntobitosasm"] + $dataObitoAsm[0]["qntobitosasm"]) ));

        return $dataPointsObitoAsm;
    }

    function getObitosDataHip(){
        $r = DBExecute("SELECT count(participantID) AS qntobitoship FROM obitoshipertensos
                        UNION ALL
                        SELECT count(participantID) FROM vivoshipertensos");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoHip[] = $res;
        }

        $dataPointsObitoHip = array(array("label"=>"Altas", "y"=>$dataObitoHip[1]["qntobitoship"]  * 100 / ($dataObitoHip[1]["qntobitoship"] + $dataObitoHip[0]["qntobitoship"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoHip[0]["qntobitoship"] * 100 / ($dataObitoHip[1]["qntobitoship"] + $dataObitoHip[0]["qntobitoship"]) ));

        return $dataPointsObitoHip;
    }

    function getObitosDataIdo(){
        $r = DBExecute("SELECT count(participantID) AS qntobitosido FROM obitosidosos
                        UNION ALL
                        SELECT count(participantID) FROM vivosidosos");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoIdo[] = $res;
        }

        $dataPointsObitoIdo = array(array("label"=>"Altas", "y"=>$dataObitoIdo[1]["qntobitosido"]  * 100 / ($dataObitoIdo[1]["qntobitosido"] + $dataObitoIdo[0]["qntobitosido"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoIdo[0]["qntobitosido"] * 100 / ($dataObitoIdo[1]["qntobitosido"] + $dataObitoIdo[0]["qntobitosido"]) ));

        return $dataPointsObitoIdo;
    }

    function getObitosDataAdu(){
        $r = DBExecute("SELECT count(participantID) AS qntobitosadu FROM obitosadultos
                        UNION ALL
                        SELECT count(participantID) FROM vivosadultos");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoAdu[] = $res;
        }

        $dataPointsObitoAdu = array(array("label"=>"Altas", "y"=>$dataObitoAdu[1]["qntobitosadu"]  * 100 / ($dataObitoAdu[1]["qntobitosadu"] + $dataObitoAdu[0]["qntobitosadu"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoAdu[0]["qntobitosadu"] * 100 / ($dataObitoAdu[1]["qntobitosadu"] + $dataObitoAdu[0]["qntobitosadu"]) ));

        return $dataPointsObitoAdu;
    }

    function eficaciaAntivirais(){
        $r = DBExecute("SELECT COUNT(pacid) AS altassobretotal FROM altascloro
                        UNION ALL
                        SELECT COUNT(participantID) FROM pacidcloro2
                        UNION ALL
                        SELECT COUNT(pacid) AS altassobretotal FROM altasazi
                        UNION ALL
                        SELECT COUNT(participantID) FROM pacidazitrom");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }

    function eficaciaAntiviraisFem(){
        $r = DBExecute("SELECT COUNT(participantID) AS altassobretotal FROM ((SELECT participantID FROM pacidazitrom) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM fem) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidazitrom) PC
                        NATURAL JOIN 
                        (SELECT participantID FROM fem) PB
                        UNION ALL
                        SELECT COUNT(participantID) AS altastotal FROM ((SELECT participantID FROM pacidcloro2) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM fem) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidcloro2) PC
                        NATURAL JOIN 
                        (SELECT participantID FROM fem) PB");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }  

    function eficaciaAntiviraisMan(){
        $r = DBExecute("SELECT COUNT(participantID) AS altassobretotal FROM ((SELECT participantID FROM pacidazitrom) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM masc) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidazitrom) PC
                        NATURAL JOIN 
                        (SELECT participantID FROM masc) PB
                        UNION ALL
                        SELECT COUNT(participantID) AS altastotal FROM ((SELECT participantID FROM pacidcloro2) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM masc) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidcloro2) PC
                        NATURAL JOIN 
                        (SELECT participantID FROM masc) PB");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }  

    function eficaciaAntiviraisFum(){
        $r = DBExecute("SELECT COUNT(participantID) AS altassobretotal FROM ((SELECT participantID FROM pacidazitrom) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM fumantes2) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidazitrom) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM fumantes2) PB
                        UNION ALL
                        SELECT COUNT(participantID) AS altastotal FROM ((SELECT participantID FROM pacidcloro2) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM fumantes2) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidcloro2) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM fumantes2) PB");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }  
    
    function eficaciaAntiviraisAsm(){
        $r = DBExecute("SELECT COUNT(participantID) AS altassobretotal FROM ((SELECT participantID FROM pacidazitrom) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM asmaticos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidazitrom) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM asmaticos) PB
                        UNION ALL
                        SELECT COUNT(participantID) AS altastotal FROM ((SELECT participantID FROM pacidcloro2) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM asmaticos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidcloro2) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM asmaticos) PB");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }

    function eficaciaAntiviraisHip(){
        $r = DBExecute("SELECT COUNT(participantID) AS altassobretotal FROM ((SELECT participantID FROM pacidazitrom) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM hipertensos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidazitrom) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM hipertensos) PB
                        UNION ALL
                        SELECT COUNT(participantID) AS altastotal FROM ((SELECT participantID FROM pacidcloro2) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM hipertensos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidcloro2) PC
                        NATURAL JOIN 
                        (SELECT participantID FROM hipertensos) PB");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }  

    function eficaciaAntiviraisIdo(){
        $r = DBExecute("SELECT COUNT(participantID) AS altassobretotal FROM ((SELECT participantID FROM pacidazitrom) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM idosos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidazitrom) PC
                        NATURAL JOIN 
                        (SELECT participantID FROM idosos) PB
                        UNION ALL
                        SELECT COUNT(participantID) AS altastotal FROM ((SELECT participantID FROM pacidcloro2) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM idosos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidcloro2) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM idosos) PB");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }

    function eficaciaAntiviraisAdu(){
        $r = DBExecute("SELECT COUNT(participantID) AS altassobretotal FROM ((SELECT participantID FROM pacidazitrom) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM adultos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidazitrom) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM adultos) PB
                        UNION ALL
                        SELECT COUNT(participantID) AS altastotal FROM ((SELECT participantID FROM pacidcloro2) M 
                        NATURAL JOIN (SELECT participantID FROM vivos2) O) NATURAL JOIN
                        (SELECT participantID FROM adultos) REL
                        UNION ALL 
                        SELECT COUNT(participantID) FROM (SELECT participantID FROM pacidcloro2) PC
                         NATURAL JOIN 
                        (SELECT participantID FROM adultos) PB");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataEficacia[] = $res;
        }

        $dataPointsEficacia = array(array("label"=>"Eficacia da Cloroquina", "y"=>$dataEficacia[0]["altassobretotal"]  * 100 / ($dataEficacia[1]["altassobretotal"] + $dataEficacia[0]["altassobretotal"]) ),
        array("label"=>"Eficacia da Azitromicina", "y"=>$dataEficacia[2]["altassobretotal"] * 100 / ($dataEficacia[2]["altassobretotal"] + $dataEficacia[3]["altassobretotal"]) ));

        return $dataPointsEficacia;
    }     

    function tempoUTI(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS uti FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20
 UNION ALL
 SELECT DISTINCT COUNT(participantID) FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40
UNION ALL
 SELECT DISTINCT COUNT(participantID) FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20
 UNION ALL
 SELECT COUNT(participantID) FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60
 UNION ALL
 SELECT DISTINCT COUNT(participantID) FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de Pacientes com 20 dias ou menos", "y"=>$tempoUTI[0]["uti"]),
        array("label"=>"Quantidade de pacientes com 20 a 40 dias", "y"=>$tempoUTI[1]["uti"]),
        array("label"=>"Quantidade de pacientes com 40 a 60 dias", "y"=>$tempoUTI[2]["uti"]),
        array("label"=>"Quantidade de pacientes com 60 a 80 dias", "y"=>$tempoUTI[3]["uti"]));

        return $tempoUTI;
    }
    function tempoUTIFem(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN fem A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN fem A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN fem A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN fem A");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de mulheres com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de mulheres com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de mulheres com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de mulheres com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

    function tempoUTIMan(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN masc A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN masc A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN masc A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN masc A");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de homens com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de homens com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de homens com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de homens com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

    function tempoUTIFum(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN fumantes A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN fumantes A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN fumantes A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN fumantes A");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de fumantes com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de fumantes com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de fumantes com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de fumantes com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

    function tempoUTIHip(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN hipertensos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN hipertensos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN hipertensos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN hipertensos A");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de hipertensos com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de hipertensos com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de hipertensos com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de hipertensos com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

      function tempoUTIAsm(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN asmaticos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN asmaticos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN asmaticos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN asmaticos A");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de asmaticos com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de asmaticos com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de asmaticos com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de asmaticos com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

    function tempoUTIIdo(){
        $r = DBExecute("
SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN idosos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN idosos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN idosos A
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN idosos A");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de idosos com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de idosos com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de idosos com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de idosos com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

    function tempoUTIAzi(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN (SELECT participantID FROM pacidazitrom) pacad
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN (SELECT participantID FROM pacidazitrom) pacad
UNION ALL
SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN (SELECT participantID FROM pacidazitrom) pacad
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN (SELECT participantID FROM pacidazitrom) pacad");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de pacientes tratados com azitromicina com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de pacientes tratados com azitromicina com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de pacientes tratados com azitromicina com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de pacientes tratados com azitromicina com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

    function tempoUTIClo(){
        $r = DBExecute("SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 1 AND 20) BLEU NATURAL JOIN (SELECT participantID FROM pacidcloro2) pacad
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 21 AND 40) BLEU NATURAL JOIN (SELECT participantID FROM pacidcloro2) pacad
 UNION ALL
 SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac BETWEEN 41 AND 60) BLEU NATURAL JOIN (SELECT participantID FROM pacidcloro2) pacad
UNION ALL
SELECT DISTINCT COUNT(participantID) AS qnt FROM (SELECT participantID FROM (SELECT pacid AS participantID, DATEDIFF(datadesf,datauti) AS durac
 FROM ( SELECT participantID as pacid, answer AS datauti
  FROM visu WHERE questionID=228) I
INNER JOIN
(SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
 ON I.pacid= D.pacide) R2 
 WHERE durac>=61) BLEU NATURAL JOIN (SELECT participantID FROM pacidcloro2) pacad");

        while($res = mysqli_fetch_assoc($r))
        {
            $tempoUTI[] = $res;
        }

        $tempoUTI = array(array("label"=>"Quantidade de pacientes tratados com cloroquina com 20 dias ou menos", "y"=>$tempoUTI[0]["qnt"]),
        array("label"=>"Quantidade de pacientes tratados com cloroquina com 20 a 40 dias", "y"=>$tempoUTI[1]["qnt"]),
        array("label"=>"Quantidade de pacientes tratados com cloroquina com 40 a 60 dias", "y"=>$tempoUTI[2]["qnt"]),
        array("label"=>"Quantidade de pacientes tratados com cloroquina com 60 a 80 dias", "y"=>$tempoUTI[3]["qnt"]));

        return $tempoUTI;
    }

?>

