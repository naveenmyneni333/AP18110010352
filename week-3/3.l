// 3. Count number of vowels and consonants.
%option noyywrap
%{
  int v=0,c=0;
%}
%%
[aeiouAEIOU]    ++v; 
[a-zA-Z]	++c;
.	
%%
main()
{
  yylex();
  printf(" No. of Vowels = %d \n No.of Consonants = %d",v,c);
}