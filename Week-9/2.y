%token NUMBER   //stdio.h is automatically included

%left '+' '-'	// gives same precedence for '+'&'-', and left associativity for both
%left '*' '/'   // gives '*'&'/' higher precedence than '+'&'-' as they're written in separate line and below them.
%%
S:E	  { printf("The result is %d\n",$1);}
;
E:E'+'E   { $$ = $1+$3; }
|E'-'E	  { $$ = $1-$3; }
|E'*'E	  { $$ = $1*$3; }
|E'/'E	  { $$ = $1/$3; }
|'-'E %prec '*' { $$ = -$2; }	//%prec '*' will change precedence of this line to that of '*'
|F	  { $$ = $1;}
;
F:'('E')' { $$ = $2;}
|NUMBER	  { $$ = $1;}
;
%%
main()
{
  yyparse();
}
void yyerror(char* s)
{
  printf("Error %s",s);
}