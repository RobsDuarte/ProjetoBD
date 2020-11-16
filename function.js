function GetFile(id){ 
    var nome_arquivo = id;      
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function(){
        if(this.readyState === 4 && this.status === 200){
            document.getElementById('teste').innerHTML = this.responseText
        }
    };
    xmlhttp.open('POST',nome_arquivo +'.txt',true);
    xmlhttp.send();   

    chartControl(document.getElementById(id));
}