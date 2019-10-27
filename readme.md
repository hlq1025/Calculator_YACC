Introduction
Compiling principle exercise
this exercise is using flex and yacc to develop a calculator.flex is a lexical analyzer,and yacc is a parser.
this project contains cal.l and cal.y. cal.l describe lexical rules and cal.y describe grammar rules.
Dependencies
bison
flex
How to use
sudo apt-get install flex
sudo apt-get install bison
flex cal.l
bison -d cal.y
gcc -o cal cal.tab.c lex.yy.c -ly -lm -lfl
