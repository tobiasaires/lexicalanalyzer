package lexicalAnalyser;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.Console;
import java.io.File;
import java.nio.file.Paths;
import java.io.FileWriter;

public class PHPLexicalAnalyzer {
    private ArrayList<String[]> tokenTable;
    private LexicalAnalyzer lexical;

    public PHPLexicalAnalyzer(String filePath){
        try {
            this.lexical = new LexicalAnalyzer(new FileReader(filePath));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String[]> printTokenTable() throws IOException{
        Token lexicalToken;
        Integer i = 0;
        try {
            File myObj = new File("analisador_saida.txt");
            if (myObj.createNewFile()) {
              System.out.println("Arquivo Criado: " + myObj.getName());
            } else {
              System.out.println("Arquivo Atualizado");
            }
          } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
          }
        try {
            FileWriter myWriter = new FileWriter("analisador_saida.txt");
            while ((lexicalToken = this.lexical.yylex()) != null) {
           	 myWriter.write("Posição("+i+")| NOME: "+lexicalToken.name+" | Valor: "+lexicalToken.value+" | Linha: "+String.valueOf(lexicalToken.line + 1)+ "\n");
           	 i++;
           }
            myWriter.close();
            System.out.println("Tabela escrita com sucesso");
          } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
          }
        return this.tokenTable;
    }

    public static void main(String[] args) {
	   	String rootPath = Paths.get("").toAbsolutePath().toString();
	    String subPath = "/src/lexicalAnalyser/";
	
	    String file = rootPath + subPath + "language_php.lex";
	    
	
	    File sourceCode = new File(file);
	
	    jflex.Main.generate(sourceCode);
	    System.out.println("Analisador Lexico Gerado");
		System.out.println("Digite o endereço absoluto do arquivo: ");
		Scanner arquivoEntrada = new Scanner(System.in);
		String path = arquivoEntrada.next();
	    PHPLexicalAnalyzer php = new PHPLexicalAnalyzer(path);
	    arquivoEntrada.close();
	    try {
	    	php.printTokenTable();
	    } 
	    catch (IOException e) {
	    	e.printStackTrace();
	    	}
    }
}