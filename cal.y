%{
#define Pi 3.14159265358979
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
%}
%union 
{
int ival;
double dval;
}
%token NAME SIN COS TAN POW LOG EXP FAC
%token <ival> INTEGER
%token <dval> DECIMAL
%type <ival> iexpression
%type <dval> dexpression
%type <dval> mexpression
%left 	'-' '+'
%left	'*' '/'
%%
lines:line
     |line lines
     ;

line: iexpression  '\n'  { printf("= %d\n", $1); }
    | dexpression  '\n' { printf("= %f\n", $1);}
    | mexpression '\n'  { printf("= %f\n", $1);}
    ;

iexpression: iexpression '+' INTEGER   { $$ = $1 + $3; }
    |   iexpression '-' INTEGER   { $$ = $1 - $3; }
    |   iexpression '*' INTEGER   { $$ = $1 * $3; }
    |   iexpression '/' INTEGER   { $$ = $1 / $3; }
    |   iexpression '%' INTEGER   { $$ = $1 % $3; }
    |   INTEGER          { $$ = $1; }
    |   '(' iexpression ')' {$$=$2;}
    |  iexpression FAC {
    int ans=1;
    for (int i=2;i<=$1;i++)
    {
    ans=ans*i;
    }
    $$=ans;
    }
;
dexpression :    dexpression '+' DECIMAL   { $$ = $1 + $3; }
    |   dexpression '-' DECIMAL   { $$ = $1 - $3; }
    |   dexpression '*' DECIMAL   { $$ = $1 * $3; }
    |   dexpression '/' DECIMAL   { $$ = $1 / $3; }
    |   DECIMAL '+' dexpression  { $$ = $1 + $3; }
    |   DECIMAL '-' dexpression   { $$ = $1 - $3; }
    |   DECIMAL '*'  dexpression { $$ = $1 * $3; }
    |   DECIMAL '/'  dexpression  { $$ = $1 / $3; }
    |   iexpression '+' DECIMAL   { $$ = $1 + $3; }
    |   iexpression '-' DECIMAL   { $$ = $1 - $3; }
    |   iexpression '*' DECIMAL   { $$ = $1 * $3; }
    |   iexpression '/' DECIMAL   { $$ = $1 / $3; }
    |   DECIMAL '+' iexpression   { $$ = $1 + $3; }
    |   DECIMAL '-' iexpression    { $$ = $1 - $3; }
    |   DECIMAL '*' iexpression   { $$ = $1 * $3; }
    |   DECIMAL '/' iexpression  { $$ = $1 / $3; }
    |   DECIMAL          { $$ = $1; }
    |   '(' dexpression ')' {$$=$2;}
    ;
mexpression: SIN dexpression {$$=sin($2*Pi/180);}
|  SIN iexpression  {$$=sin($2*Pi/180);}
|  COS dexpression {$$=cos($2*Pi/180);}
|  COS iexpression  {$$=cos($2*Pi/180);}
|  TAN dexpression {$$=tan($2*Pi/180);}
|  TAN iexpression  {$$=tan($2*Pi/180);}
|  LOG dexpression  {$$=log($2);}
|  LOG iexpression  {$$=log($2);}
|  EXP dexpression  {$$=exp($2);}
|  EXP iexpression  {$$=exp($2);}
|  dexpression POW dexpression {$$=pow($1,$3);}
|  iexpression POW iexpression {$$=pow($1,$3);}
|  dexpression POW iexpression {$$=pow($1,$3);}
|  iexpression POW dexpression {$$=pow($1,$3);}
;
%%
int main()  
{
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    printf("%s/n",s);
    return 0;
}