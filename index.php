<?php
	require 'config.php';
    require 'connection.php';
    require 'database.php';
    require 'data.php';

    $dataPointsObitoFem = getObitosDataFem();
    $dataPointsObitoMan = getObitosDataMan();
    $dataPointsObitoFum = getObitosDataFum();
    $dataPointsObitoAsm = getObitosDataAsm();
    $dataPointsObitoHip = getObitosDataHip();
?>
<!DOCTYPE html>

<html  lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <link href="style.css" rel="stylesheet" type="text/css">  
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> 
        <script src="function.js"></script> 
        <script>
        	function chartControl(ele){
        		if(ele.id == "radio_1")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			ObitosFem();
        			currentElement = document.getElementById("obitoFemContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_2")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			ObitosMan();
        			currentElement = document.getElementById("obitoManContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_3")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			ObitosFum();
        			currentElement = document.getElementById("obitoFumContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_4")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			ObitosAsm();
        			currentElement = document.getElementById("obitoAsmContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_5")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			ObitosHip();
        			currentElement = document.getElementById("obitoHipContainer");
        			currentElement.style.display = "block";
        		}
        	}
        	function ObitosFem()
			{
				var obitoFemChart = new CanvasJS.Chart("obitoFemContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas Mulheres" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoFem, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoFemChart.render();
			}

			function ObitosMan()
			{
				var obitoManChart = new CanvasJS.Chart("obitoManContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas Homens" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoMan, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoManChart.render();
			}
			function ObitosFum(){
				var obitoFumChart = new CanvasJS.Chart("obitoFumContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas Fumantes" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoFum, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoFumChart.render();
			}
			function ObitosAsm(){
				var obitoAsmChart = new CanvasJS.Chart("obitoAsmContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas Asmaticos" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoAsm, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoAsmChart.render();
			}
			function ObitosHip(){
				var obitoHipChart = new CanvasJS.Chart("obitoHipContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas Hipertensos" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoHip, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoHipChart.render();
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
                        <div id="obitoFemContainer" style="height: 100%; width: 100%; display: none;"></div>
                        <div id="obitoManContainer" style="height: 100%; width: 100%; display: none;"></div>
                        <div id="obitoFumContainer" style="height: 100%; width: 100%; display: none;"></div>
                        <div id="obitoAsmContainer" style="height: 100%; width: 100%; display: none;"></div>
                        <div id="obitoHipContainer" style="height: 100%; width: 100%; display: none;"></div>
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