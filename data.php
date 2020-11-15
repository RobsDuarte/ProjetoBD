<?php
	function getObitosDataFem()
    {
        $r = DBExecute( "SELECT COUNT(participantID) AS qntobitosfem 
                        FROM (SELECT * FROM mortos2) M INNER JOIN
                        (SELECT participantID AS idfem FROM fem) F ON M.participantID=F.idfem
                        UNION
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
                        UNION
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
                        UNION
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
                        UNION
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
                        UNION
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
                        UNION
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
                        UNION
                        SELECT count(participantID) FROM vivosadultos");

        while($res = mysqli_fetch_assoc($r))
        {
            $dataObitoAdu[] = $res;
        }

        $dataPointsObitoAdu = array(array("label"=>"Altas", "y"=>$dataObitoAdu[1]["qntobitosadu"]  * 100 / ($dataObitoAdu[1]["qntobitosadu"] + $dataObitoAdu[0]["qntobitosadu"]) ),
        array("label"=>"Obitos", "y"=>$dataObitoAdu[0]["qntobitosadu"] * 100 / ($dataObitoAdu[1]["qntobitosadu"] + $dataObitoAdu[0]["qntobitosadu"]) ));

        return $dataPointsObitoAdu;
    }
    
?>