// 5. Recognize a string with three consecutive 0’s.
%option noyywrap
%%
[0-9]*000[0-9]*	  printf("String Accepted\n");
[0-9]*		  printf("String Rejected\n");
.*		  printf("Invalid String\n");
%%
main()
{ 
	yylex();
}