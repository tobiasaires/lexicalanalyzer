package lexicalAnalyser;

%%

%{

private Token createToken(String name, String value) {
    return new Token( name, value, yyline);
}

%}

%public
%class LexicalAnalyzer
%type Token
%line

NUMBERS = [0-9] | [0-9]+"."[0-9]*

L = [a-zA-Z_]+
STRING = {L}[A-Za-z0-9_]*

COMENTARIO = "//"[^\n]* | [/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]

VARIAVEL = ([$]({STRING})({STRING}{NUMBERS}_)*)

PALAVRAS_RESERVADAS = "__halt_compiler" | "abstract" |" and" | "array" | "as" | "break" | "callable" | "case" | "catch" | "class" | "clone" | "	const" | "continue" | "declare" | "default" | "die()" | "do" | "echo" | "else" | "elseif" | "empty" | "enddeclare" | "endfor" | "	endforeach" | "endif" | "endswitch" | "endwhile" | "eval" | "exit" | "extends" | "final" | "finally" | "fn " | "for" | "foreach" | "function" | "global" | "goto" | "if" | "implements" | "include" | "include_once" | "instanceof" | "insteadof" | "interface" | "isset()" | "	list()" | "namespace" | "new" | "or" | "print" | "private" | "protected" | "public" | "require" | "require_once" | "return" | "static" | "	switch" | "throw" | "trait" | "try" | "unset()" | "use" | "var" | "while" | "xor" | "yield" | "yield from"
OPERADORES_COMPARACAO = "==" | "===" | "!=" | "<>" | "!==" | "<" | ">" | "<=" | ">=" | "<=>"
OPERADORES_ARITMETICOS = "+" | "-" | "*" | "/" | "%" | "**"
OPERADORES_LOGICOS = "&&" | "||" | "!"
OPERADORES_ATRIBUICAO = "=" | "+=" | "-=" | "*=" | ".=" | "/=" | "%="
OPERADORES_INCREMENTO = "++" | "--"
OPERADOR_TERNARIO = "?"
OPERADOR_CONCATENACAO = "."
OPERADORES_BITWISE = "&" | "|" | "^"| "~"| ">>" | "<<" | ">>>"
ESPACO_BRANCO = \n|\r|\t|\s
DELIMITADORES = ";" | "'" |"{" | "}" | ":" | "," | "\"" | "\\" | "\\" | "[" | "]" | "(" | ")" | "\""
OPERADOR_ESTATICO = "::"
OPERADOR_OBJETO = "->"
OPERADOR_ARRAY = "=>"
OPERADOR_TIPAGEM = "int" | "string" | "integer" | "bool" | "boolean" | "float" | "double" | "real" | "array" | "object" | "unset" | "null"
TAG_ABERTURA = "<?php"
TAG_FECHAMENTO = "?>"


%%
{PALAVRAS_RESERVADAS} {return createToken("PALAVRA_RESERVADA", yytext());}
{OPERADORES_COMPARACAO} {return createToken("OPERADOR_COMPARACAO", yytext());}
{OPERADORES_ARITMETICOS} {return createToken("OPERADOR_ARITMETICO", yytext());}
{OPERADORES_ATRIBUICAO} {return createToken("OPERADOR_ATRIBUICAO", yytext());}
{OPERADORES_INCREMENTO} {return createToken("OPERADOR_INCREMENTO", yytext());}
{OPERADOR_TERNARIO} {return createToken("OPERADOR_TERNARIO", yytext());}
{OPERADOR_CONCATENACAO} {return createToken("OPERADOR_CONCATENACAO", yytext());}
{OPERADORES_LOGICOS} {return createToken("OPERADOR_LOGICO", yytext());}
{OPERADORES_BITWISE} {return createToken("OPERADOR_BITWISE", yytext());}
{OPERADOR_ESTATICO} {return createToken("OPERADOR_ESTATICO", yytext());}
{ESPACO_BRANCO} {}
{DELIMITADORES} { return createToken("DELIMITADOR", "\""+ yytext() + "\"");}
{OPERADOR_OBJETO} {return createToken("OPERADOR_OBJETO", yytext());}
{OPERADOR_ARRAY} {return createToken("OPERADOR_ARRAY", yytext());}
{OPERADOR_TIPAGEM} {return createToken("TIPO_PRIMITIVO", yytext());}
{TAG_ABERTURA} {return createToken("TAG_ABERTURA", yytext());}
{TAG_FECHAMENTO} {return createToken("TAG_FECHAMENTO", yytext());}
{VARIAVEL} {return createToken("VARIAVEL", yytext());}
{NUMBERS} {return createToken("NUMBER", yytext());}
{STRING} {return createToken("STRING", yytext());}
{COMENTARIO} {return createToken("COMENTARIO", yytext());}



. { throw new RuntimeException("Caractere inválido " + yytext() + " na linha " + yyline); }