// 6.check well formedness of () to check other brackets '[]','{}' use stack.

%option noyywrap
%{ 
  	int i=-1,f=1; 
%}
%%
"(" 
{
	++i; 
	fprintf(yyout,"%s",yytext);
}
")" 
{ 
	if(i<0) f=0;	//if ')' appears before '(' set f=0
	--i; fprintf(yyout,"%s",yytext);
}
\n  
{  
	if(f && i==-1) 
		fprintf(yyout,"\nwell formed\n\n");
        else 
		fprintf(yyout,"\nNOT well formed\n\n"); 
        f=1; 
	i=-1; 
}
.   fprintf(yyout,"invalid ",yytext);
%%
main(int a,char **s) // command run line: a 6in.txt
{
	yyin=fopen(s[1],"r");
	yyout=fopen("6out.txt","w"); 
	yylex();
}