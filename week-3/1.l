// 1. Identification of Vowels and Consonants.
%option noyywrap
%%
[aeiouAEIOU]    printf("%s is Vowel\n",yytext); 
[a-zA-Z]	printf("%s is Consonant\n",yytext);
.		printf("%s is Invalid Lexeme\n",yytext);
%%
main()
{ 
	yylex();
}