/* Assignment 1*/
/* reg for comment and float need to be modified*/
%option noyywrap
%{
#include <stdio.h>
#include <math.h>
int linenumber = 0;
%}
var_name [a-zA-Z][_a-zA-Z0-9]*
digit [0-9]
hex_digit 0[xX][0-9A-Fa-f]+ 
oct_digit 0{digit}+
comment (\/\*)[ \n]*.*[ \n]*(\*\/)
float_digit ({digit}*"."{digit}+)|({digit}+"."{digit}*)|({digit}+"."{digit}+)|({digit}+E(-)?{digit}+)
%%

{comment} {}

true|false { printf("BOOL %s\n", yytext); }

({digit}+)|({hex_digit}+)|({oct_digit}) { printf("INT: %d\n", atoi(yytext));}

{float_digit}(f|lf)? { printf("FLOAT %g\n", atof(yytext));}

int|float|bool|void|vec2|vec3|vec4|ivec2|ivec3|ivec4|bvec2|bvec3|bvec4|rt_Primitive|rt_Camera|rt_Material|rt_Texture|rt_Light { printf("TYPE %s\n", yytext); }

attribute|uniform|varying|const|public|private|scratch { printf("QUALIFIER %s\n", yytext); }

class|break|case|const|continue|default|do|double|else|enum|extern|for|goto|if|sizeof|static|struct|switch|typedef|union|unsigned|while|illuminance|ambient|dominantAxis|dot|hit|inside|inverse|luminance|max|min|normalize|perpendicularTo|pow|rand|reflect|sqrt|trace { printf("KEYWORD %s\n", yytext);}

rt_{var_name} { printf("STATE %s\n", yytext);}

"."{var_name} { printf("SWIZZLE %s\n", ++yytext);}

"+" { printf("PLUS\n");}
"*" { printf("MUL\n");}
"-" { printf("MINUS\n");}
"/" { printf("DIV\n");}
"=" { printf("ASSIGN\n");}
"==" { printf("EQUAL\n");}
"!=" { printf("NOT_EQUAL\n");}
"<" { printf("LT\n");}
"<=" { printf("LE\n");}
">" { printf("GT\n");}
">=" { printf("GE\n");}
"," { printf("COMMA\n");}
":" { printf("COLON\n");}
";" { printf("SEMICOLON\n");}
"(" { printf("LPARENTHESIS\n");}
")" { printf("RPARENTHESIS\n");}
"[" { printf("LBRACKET\n");}
"]" { printf("RBRACKET\n");}
"{" { printf("LBRACE\n");}
"}" { printf("RBRACE\n");}
"&&" { printf("AND\n");}
"||" { printf("OR\n");}
"++" { printf("INC\n");}
"--" { printf("DEC\n");}
[\n] { linenumber++; }
[ \t]+ {}
(_)*{var_name} { printf("IDENTIFIER %s\n", yytext);}
. {printf("ERROR(%d): Unrecognized symbol \"%s\"\n", linenumber, yytext);}
%%

int main(){
	yylex();
	return 0;
}
