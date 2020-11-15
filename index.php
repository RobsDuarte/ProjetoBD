<?php
    require 'config.php';
    require 'connection.php';
    require 'database.php';
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
    $dataPointsObitoFem = array(array("label"=>"Vivos", "y"=>$dataObitoFem[1]["qntobitosfem"]  * 100 / ($dataObitoFem[1]["qntobitosfem"] + 
        $dataObitoFem[0]["qntobitosfem"]) ),
    array("label"=>"Mortos", "y"=>$dataObitoFem[0]["qntobitosfem"] * 100 / ($dataObitoFem[1]["qntobitosfem"] + $dataObitoFem[0]["qntobitosfem"]) ));

?>
<!DOCTYPE html>

<html  lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link href="style.css" rel="stylesheet" type="text/css">  
        <script src="function.js"></script> 

        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>  
        <script>
            function ObitosFem() {
                var obitoFemChart = new CanvasJS.Chart("obitoFemContainer", {
                animationEnabled: true,
                title: { text: "Porcentagem de Mortos e Vivos Mulheres" },
                subtitles: { text: "" },
                data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoFem, JSON_NUMERIC_CHECK); ?> }]
                });
                obitoFemChart.render();
            }
        </script>          
    </head>
        
    <body>     
        <div class='row'>
            <div class="col-12 header-height backgroud-header">

                <div class="col-5 texto-header">
                    Interface para auxiliar na busca de informações sobre Covid-19.
                </div>

            </div>                       
            
            <div class="col-12 b">          

                <div class="col-2 box-shadow">
                    <?php
                        $consultas = fopen('consultas.txt','r') or die('Não foi possível abrir o arquivo');
                        echo fread($consultas,filesize('consultas.txt'));
                        fclose($consultas);
                    ?>
                </div>
                
                <div class="col-2  margin-divisor"></div>

                <div class=' col-5  box-shadow'>  
                    <div class="col-2 t" id="teste"></div> 
                    <div class='col-10 shadow-graphic'>

                        <div id="obitoFemContainer" style="height: 100%; width: 100%;"></div>
                    </div>   

                </div>                   
            </div>             

            <div class="col-12 footer-size">  

                <div class='col-5 text-footer'>
                    <span>Projeto da disciplina Banco de Dados 1  da Universidade Federal do Rio de Janeiro - UFRJ</span>
                </div>   

            </div>

        </div>     
        
    </body>

</html>