<?php
    require 'config.php';
    require 'connection.php';
    require 'database.php';
    $r = DBExecute( "SELECT answer, COUNT(answer) AS 'count' FROM `tb_questiongroupformrecord` 
                    WHERE questionID = 168 
                    GROUP BY answer");
    while($res = mysqli_fetch_assoc($r))
    {
        $datas[] = $res;
    }

    $dataPoints = array();
    $count = 0;
    foreach ($datas as $linha) {
        $count = $count + intval($linha['count']);
        array_push($dataPoints, array("y" => $count, "label" => $linha['answer']));
    }

    $r = DBExecute( "SELECT count(listOfValuesID) AS mortosEVivos FROM visu 
                    WHERE (questionID = 123 AND listOfValuesID = 275) 
                    OR (questionID = 123 AND listOfValuesID = 276)
                    GROUP BY listOfValuesID");

    while($res = mysqli_fetch_assoc($r))
    {
        $mortoEVivo[] = $res;
    }

    $dataPointsPie = array( 
    array("label"=>"Vivos", "y"=>$mortoEVivo[1]["mortosEVivos"]  * 100 / ($mortoEVivo[1]["mortosEVivos"] + $mortoEVivo[0]["mortosEVivos"]) ),
    array("label"=>"Mortos", "y"=>$mortoEVivo[0]["mortosEVivos"] * 100 / ($mortoEVivo[1]["mortosEVivos"] + $mortoEVivo[0]["mortosEVivos"]) )
    );

    $r = DBExecute( "SELECT COUNT(participantID) AS 'cloroquina' from (SELECT participantID AS pacid, formrecordID,         questionGroupFormRecordID, questionID, listOfValuesID, answer FROM visu
                    WHERE questionID= 101 AND listOfValuesID = 306
                    GROUP BY pacid) C INNER JOIN mortos2 AS M ON
                    C.pacid= M.participantID

                    UNION 

                    SELECT COUNT(participantID) AS 'cloroquina' from (SELECT participantID AS pacid, formrecordID, questionGroupFormRecordID, questionID, listOfValuesID, answer FROM visu
                    WHERE questionID= 101 AND listOfValuesID = 306
                    GROUP BY pacid) C INNER JOIN vivos2 AS V ON
                    C.pacid= V.participantID");

    while($res = mysqli_fetch_assoc($r))
    {
        $cloroquina[] = $res;
    }

    $dataPointsC = array( 
    array("y" => $cloroquina[1]["cloroquina"], "label" => "Vivos" ),
    array("y" => $cloroquina[0]["cloroquina"], "label" => "Mortos" )
    );

    $r = DBExecute("SELECT pacid, DATEDIFF(datadesf,datauti) AS duracaoemdias
                    FROM ( SELECT participantID as pacid, answer AS datauti
                    FROM visu WHERE questionID=228) I
                    INNER JOIN
                    (SELECT participantID AS pacide, answer AS datadesf FROM visu WHERE questionID=124) D
                    ON I.pacid= D.pacide");
    while($res = mysqli_fetch_assoc($r))
    {
        $semanas[] = $res;
    }
    $countPacientes1Semana = 0;
    $countPacientes2Semana = 0;
    $countPacientes3Semana = 0;
    $countPacientes4Semana = 0;
    foreach ($semanas as $linha) 
    {
        if(intval($linha['duracaoemdias']) < 0)
        {
            continue;
        }
        else if(intval($linha['duracaoemdias']) <= 7)
        {
            $countPacientes1Semana = $countPacientes1Semana + 1;
        }
        else if(intval($linha['duracaoemdias']) > 7 && intval($linha['duracaoemdias']) <= 14)
        {
            $countPacientes2Semana = $countPacientes2Semana + 1;
        }
        else if(intval($linha['duracaoemdias']) > 14 && intval($linha['duracaoemdias']) <= 21)
        {
            $countPacientes3Semana = $countPacientes3Semana + 1;
        }
        else if(intval($linha['duracaoemdias']) > 21)
        {
            $countPacientes4Semana = $countPacientes4Semana + 1;
        }
    }
    $dataPointsTempoUTI = array( 
    array("y" => $countPacientes1Semana, "label" => "1 Semana" ),
    array("y" => $countPacientes2Semana, "label" => "2 Semanas" ),
    array("y" => $countPacientes3Semana, "label" => "3 Semanas" ),
    array("y" => $countPacientes4Semana, "label" => "4 Semanas ou mais" )
    );
 
?>
<!DOCTYPE html>

<html lang="pt-br">

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link href="style.css" rel="stylesheet" type="text/css">    
        <script>
        window.onload = function () {
 
            var chart = new CanvasJS.Chart("chartContainer", {
            title: { text: "Pessoas em acompanhamento X Tempo" },
            axisY: { title: "Numero de pessoas em acompanhamento" },
            data: [{ type: "line", dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>}]
            });
            chart.render();

            var pieChart = new CanvasJS.Chart("pieChartContainer", {
            animationEnabled: true,
            title: { text: "Porcentagem de Mortos e Vivos" },
            subtitles: { text: "Total de Pacientes: 79" },
            data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsPie, JSON_NUMERIC_CHECK); ?> }]
            });
            pieChart.render();

            var columnChart = new CanvasJS.Chart("columnChartContainer", {
            animationEnabled: true,
            theme: "light2",
            title:{ text: "Pacientes Mortos e Vivos que usaram Cloroquina" },
            axisY: { title: "Numero de Pacientes" },
            data: [{ type: "column", yValueFormatString: "#,##0.## Pacientes", dataPoints: <?php echo json_encode($dataPointsC, JSON_NUMERIC_CHECK); ?> }]
            });
            columnChart.render();

            var columnChartTempoUTI = new CanvasJS.Chart("columnChartTempoUTIContainer", {
            animationEnabled: true,
            theme: "light2",
            title:{ text: "Tempo que pacientes passaram na UTI" },
            axisY: { title: "Numero de Pacientes" },
            data: [{ type: "column", yValueFormatString: "#,##0.## Pacientes", dataPoints: <?php echo json_encode($dataPointsTempoUTI, JSON_NUMERIC_CHECK); ?> }]
            });
            columnChartTempoUTI.render();
 
 
        }
        </script>
    </head>
        
    <body>

        <nav class="col-12 header">
            <span class="negrito">Universidade Federal do Rio de janeiro- UFRJ</span><br>
            <span class="apresentacao">Trabalho Banco de Dados 1</span> <br>
            <span class="apresentacao">Interface para mostrar buscas no banco de dados</span><br> 
            <span class="apresentacao">Criadores:Marcelo Campanelli, Ronald Albert,Robson Duarte dos Santos</span>       
        </nav>

        <div class='row '>
            <div class="col-1"></div>

            <div class="col-3 info-box border ">
                <div class="col-2 name-search">Busca 1</div> 

                <div id="chartContainer" style="height: 70%; width: 100%;"></div>
            </div>

            <div class="col-1">
            </div>

            <div class="col-3 info-box border">
                <div class="col-2 name-search">Busca 2</div>
                <div id="pieChartContainer" style="height: 70%; width: 100%;"></div>
            </div>

            <div class="col-1"></div>

            <div class="col-3 info-box border ">
                <div class="col-2 name-search ">Busca 3</div>
                <div id="columnChartContainer" style="height: 70%; width: 100%;"></div>
            </div>

            <div class="col-12"></div>

            <div class="col-1"></div>

            <div class="col-3 info-box border">
                <div class="col-2 name-search">Busca 4</div>
                <div id="columnChartTempoUTIContainer" style="height: 70%; width: 100%;"></div>
            </div>

            <div class="col-1"></div>

            <div class="col-3 info-box border">
                <div class="col-2 name-search">Busca 5</div>
            </div>

            <div class="col-1"></div>

            <div class="col-3 info-box border">
                <div class="col-2 name-search">Busca 6</div>
            </div> 
             
            <div class="col-12 footer-size"></div>

        </div>    
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        
    </body>

</html>