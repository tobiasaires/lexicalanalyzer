package lexicalAnalyser;

public class Token {
    public String name;
    public String value;
    public int line;

    public Token (String name, String value, int line){
        this.name = name;
        this.value = value;
        this.line = line;
    }
}