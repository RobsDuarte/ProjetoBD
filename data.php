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


    
?>