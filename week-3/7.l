// 7. Add line number before each line in a file.
%option noyywrap
%{ 
  int c=1; 
%}
%%
.*  fprintf(yyout,"%s",yytext);
\n  fprintf(yyout,"\n%d ",++c);
%%
main(int a,char **s) // command run line: a 6in.txt
{
	yyin=fopen(s[1],"r");
	yyout=fopen("7out.txt","w"); 
	fprintf(yyout,"%d ",c);
	yylex();
}