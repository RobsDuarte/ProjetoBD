<?php
	require 'config.php';
    require 'connection.php';
    require 'database.php';
    require 'data.php'; 
	
    $dataPointsObito = getObitosData();
    $dataPointsObitoFem = getObitosDataFem();
    $dataPointsObitoMan = getObitosDataMan();
    $dataPointsObitoFum = getObitosDataFum();
    $dataPointsObitoAsm = getObitosDataAsm();
    $dataPointsObitoHip = getObitosDataHip();
    $dataPointsObitoIdo = getObitosDataIdo();
    $dataPointsObitoAdu = getObitosDataAdu();
    $dataEficaciaAntivirais = eficaciaAntivirais();
    $dataEficaciaAntiviraisFem = eficaciaAntiviraisFem();
    $dataEficaciaAntiviraisMan = eficaciaAntiviraisMan();
    $dataEficaciaAntiviraisFum = eficaciaAntiviraisFum();
    $dataEficaciaAntiviraisAsm = eficaciaAntiviraisAsm();
    $dataEficaciaAntiviraisHip = eficaciaAntiviraisHip();
    $dataEficaciaAntiviraisIdo = eficaciaAntiviraisIdo();
    $dataEficaciaAntiviraisAdu = eficaciaAntiviraisAdu();
    $tempoUTIFem = tempoUTIFem();
    $tempoUTIMan = tempoUTIMan();
    $tempoUTIFum = tempoUTIFum();
    $tempoUTIAsm = tempoUTIAsm();
    $tempoUTIHip = tempoUTIHip();
    $tempoUTIIdo = tempoUTIIdo();
    $tempoUTIAzi = tempoUTIAzi();
    $tempoUTIClo = tempoUTIClo();
    $tempoUTI = tempoUTI();
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
        		if(ele.id == "subconsultas_1")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			Obitos();
        			currentElement = document.getElementById("obitoContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "subconsultas_2")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntivirais();
        			currentElement = document.getElementById("eficaciaAntiviraisContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "subconsultas_3")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTI();
        			currentElement = document.getElementById("tempoUTIContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_1")
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
        		else if(ele.id == "radio_6")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			ObitosIdo();
        			currentElement = document.getElementById("obitoIdoContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_7")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			ObitosAdu();
        			currentElement = document.getElementById("obitoAduContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_21")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntiviraisFem();
        			currentElement = document.getElementById("eficaciaAntiviraisFemContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_22")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntiviraisMan();
        			currentElement = document.getElementById("eficaciaAntiviraisManContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_23")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntiviraisFum();
        			currentElement = document.getElementById("eficaciaAntiviraisFumContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_24")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntiviraisAsm();
        			currentElement = document.getElementById("eficaciaAntiviraisAsmContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_25")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntiviraisHip();
        			currentElement = document.getElementById("eficaciaAntiviraisHipContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_26")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntiviraisIdo();
        			currentElement = document.getElementById("eficaciaAntiviraisIdoContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_27")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			EficaciaAntiviraisAdu();
        			currentElement = document.getElementById("eficaciaAntiviraisAduContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_31")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIFem();
        			currentElement = document.getElementById("tempoUTIFemContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_32")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIMan();
        			currentElement = document.getElementById("tempoUTIManContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_33")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIFum();
        			currentElement = document.getElementById("tempoUTIFumContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_34")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIAsm();
        			currentElement = document.getElementById("tempoUTIAsmContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_35")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIHip();
        			currentElement = document.getElementById("tempoUTIHipContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_36")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIIdo();
        			currentElement = document.getElementById("tempoUTIIdoContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_37")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIAzi();
        			currentElement = document.getElementById("tempoUTIAziContainer");
        			currentElement.style.display = "block";
        		}
        		else if(ele.id == "radio_38")
        		{
        			if(!(typeof currentElement == 'undefined'))
        			{
        				currentElement.style.display = "none";
        			}
        			TempoUTIClo();
        			currentElement = document.getElementById("tempoUTICloContainer");
        			currentElement.style.display = "block";
        		}
        	}
        	function Obitos()
        	{
        		var obitoChart = new CanvasJS.Chart("obitoContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObito, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoChart.render();
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
			function ObitosIdo(){
				var obitoIdoChart = new CanvasJS.Chart("obitoIdoContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas Idosos" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoIdo, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoIdoChart.render();
			}
			function ObitosAdu(){
				var obitoAduChart = new CanvasJS.Chart("obitoAduContainer", {
    			animationEnabled: true,
    			title: { text: "Porcentagem de Obitos e Altas Idosos" },
    			subtitles: { text: "Obito X Alta" },
    			data: [{ type: "pie", yValueFormatString: "#,##0.00\"%\"", indexLabel: "{label} ({y})", dataPoints: <?php echo json_encode($dataPointsObitoAdu, JSON_NUMERIC_CHECK); ?> }]
    			});
    			obitoAduChart.render();
			}
			function EficaciaAntivirais(){
				var eficaciaAntiviraisChart = new CanvasJS.Chart("eficaciaAntiviraisContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntivirais, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisChart.render();
        	}
        	function EficaciaAntiviraisFem(){
				var eficaciaAntiviraisFemChart = new CanvasJS.Chart("eficaciaAntiviraisFemContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais em mulheres" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntiviraisFem, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisFemChart.render();
        	}
        	function EficaciaAntiviraisMan(){
				var eficaciaAntiviraisManChart = new CanvasJS.Chart("eficaciaAntiviraisManContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais em homens" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntiviraisMan, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisManChart.render();
        	}
        	function EficaciaAntiviraisFum(){
				var eficaciaAntiviraisFumChart = new CanvasJS.Chart("eficaciaAntiviraisFumContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais em fumantes" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntiviraisFum, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisFumChart.render();
        	}
        	function EficaciaAntiviraisAsm(){
				var eficaciaAntiviraisAsmChart = new CanvasJS.Chart("eficaciaAntiviraisAsmContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais em asmaticos" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntiviraisAsm, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisAsmChart.render();
        	}
        	function EficaciaAntiviraisHip(){
				var eficaciaAntiviraisHipChart = new CanvasJS.Chart("eficaciaAntiviraisHipContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais em hipertensos" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntiviraisHip, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisHipChart.render();
        	}
        	function EficaciaAntiviraisIdo(){
				var eficaciaAntiviraisIdoChart = new CanvasJS.Chart("eficaciaAntiviraisIdoContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais em idosos" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntiviraisIdo, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisIdoChart.render();
        	}
        	function EficaciaAntiviraisAdu(){
				var eficaciaAntiviraisAduChart = new CanvasJS.Chart("eficaciaAntiviraisAduContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Eficacia de cada um dos Antivirais em adultos" },
			    axisY: { title: "Taxa da altas" },
			    data: [{ type: "column", yValueFormatString: "#,##0.00\"%\"", dataPoints: <?php echo json_encode($dataEficaciaAntiviraisAdu, JSON_NUMERIC_CHECK); ?> }]
			    });
			    eficaciaAntiviraisAduChart.render();
        	}
        	function TempoUTI(){
				var tempoUTIChart = new CanvasJS.Chart("tempoUTIContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI dos pacientes" },
			    axisY: { title: "Quantidade de pacientes" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTI, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIChart.render();
        	}
        	function TempoUTIFem(){
				var tempoUTIFemChart = new CanvasJS.Chart("tempoUTIFemContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de mulheres" },
			    axisY: { title: "Quantidade de mulheres" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIFem, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIFemChart.render();
        	}
        	function TempoUTIMan(){
				var tempoUTIManChart = new CanvasJS.Chart("tempoUTIManContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de homens" },
			    axisY: { title: "Quantidade de homens" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIMan, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIManChart.render();
        	}
        	function TempoUTIFum(){
				var tempoUTIFumChart = new CanvasJS.Chart("tempoUTIFumContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de fumantes" },
			    axisY: { title: "Quantidade de fumantes" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIFum, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIFumChart.render();
        	}
        	function TempoUTIAsm(){
				var tempoUTIAsmChart = new CanvasJS.Chart("tempoUTIAsmContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de asmaticos" },
			    axisY: { title: "Quantidade de asmaticos" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIAsm, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIAsmChart.render();
        	}
        	function TempoUTIHip(){
				var tempoUTIHipChart = new CanvasJS.Chart("tempoUTIHipContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de hipertensos" },
			    axisY: { title: "Quantidade de hipertensos" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIHip, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIHipChart.render();
        	}
        	function TempoUTIIdo(){
				var tempoUTIIdoChart = new CanvasJS.Chart("tempoUTIIdoContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de idosos" },
			    axisY: { title: "Quantidade de idosos" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIIdo, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIIdoChart.render();
        	}
        	function TempoUTIAzi(){
				var tempoUTIAziChart = new CanvasJS.Chart("tempoUTIAziContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de pacientes que usaram azitromicina" },
			    axisY: { title: "Quantidade de pacientes que usaram azitromicina" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIAzi, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTIAziChart.render();
        	}
        	function TempoUTIClo(){
				var tempoUTICloChart = new CanvasJS.Chart("tempoUTICloContainer", {
			    animationEnabled: true,
			    theme: "light2",
			    title:{ text: "Tempo de UTI de pacientes que usaram cloroquina" },
			    axisY: { title: "Quantidade de pacientes que usaram cloroquina" },
			    data: [{ type: "column", yValueFormatString: "#,##0", dataPoints: <?php echo json_encode($tempoUTIClo, JSON_NUMERIC_CHECK); ?> }]
			    });
			    tempoUTICloChart.render();
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

                <div class="col-2 box-shadow full-height">
                    <?php
                        $consultas = fopen('consultas.txt','r') or die('Não foi possível abrir o arquivo');
                        echo fread($consultas,filesize('consultas.txt'));
                        fclose($consultas);
                    ?>
                </div>
                
                <div class="col-2  margin-divisor"></div>

                <div class=' col-5  box-shadow full-height'>  
                    <div class="col-2 t overflow-scroll" id="teste"></div> 
                    <div class='col-10 shadow-graphic full-height'>
                    	<div id="obitoContainer" class="chartContainer" style="display: none;"></div>
                        <div id="obitoFemContainer" class="chartContainer" style="display: none;"></div>
                        <div id="obitoManContainer" class="chartContainer" style="display: none;"></div>
                        <div id="obitoFumContainer" class="chartContainer" style="display: none;"></div>
                        <div id="obitoAsmContainer" class="chartContainer" style="display: none;"></div>
                        <div id="obitoHipContainer" class="chartContainer" style="display: none;"></div>
                        <div id="obitoIdoContainer" class="chartContainer" style="display: none;"></div>
                        <div id="obitoAduContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisFemContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisManContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisFumContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisAsmContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisHipContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisIdoContainer" class="chartContainer" style="display: none;"></div>
                        <div id="eficaciaAntiviraisAduContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIFemContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIManContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIFumContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIAsmContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIHipContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIIdoContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIAziContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTICloContainer" class="chartContainer" style="display: none;"></div>
                        <div id="tempoUTIContainer" class="chartContainer" style="display: none;"></div>
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