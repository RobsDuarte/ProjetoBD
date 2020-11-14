import java.io.FileWriter;
import java.io.File; 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

public class WriteToFile {
    public static void main(String[] args) {
        int formrecordIDstart=1;// IDDENTIFICADOR DO MODULO, PARA A PERGUNTA QUE FOR ADICIONADA,
        //CHECAR EM QUAL MODULO ESTÁ ------------------------
        //---------------------------------------------------------
        int questgfID= 1129; //IDENTIFICADOR DA PERGUNTA, CHECAR MAIOR NUMERO NO BANCO E
        //INICIAR VALOR COMO MAIOR DO BANCO +1
        //----------------------------------------------
        int lim=questgfID+79;///TOTAL DE PERGUNTAS DO TIPO(NAO É ALTERADO POIS
        // ESTAMOS COM 79 PACIENTES NO BANCO)
        //---------------------------------------------------
        int[] arr = {298, 300};// VALORES POSSIVEIS PARA RESPOSTA
        Random rand= new Random();
        int randomIndex = rand.nextInt(2);
        int randomVal = arr[randomIndex];
      try {
        FileWriter myWriter = new FileWriter("insert2.sql");
        myWriter.write("INSERT INTO `tb_questiongroupformrecord` (`questionGroupFormRecordID`, `formRecordID`, `crfFormsID`, `questionID`, `listOfValuesID`, `answer`) VALUES\n");
        {
            for(int i=questgfID;i<=lim;i++){
                formrecordIDstart+=3;
                randomIndex = rand.nextInt(2);
                randomVal = arr[randomIndex];
                if(i!=lim){
                myWriter.write("("+i+", "+formrecordIDstart+", 1, 57, "+randomVal+", NULL),\n");}
                else {myWriter.write("("+i+", "+formrecordIDstart+", 1, 57, "+randomVal+", NULL);");}
            }
        myWriter.close();
        }
        System.out.println("Successfully wrote to the file.");
      } catch (IOException e) {
        System.out.println("An error occurred.");
        e.printStackTrace();
      }
    }
  }