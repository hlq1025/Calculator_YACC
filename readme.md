# 1.Introduction

compiling principle exercise

this exercise is using flex and yacc to develop a calculator.flex is a lexical analyzer,and yacc is a parser.

this project contains cal.l and cal.y. cal.l describe lexical rules and cal.y describe grammar rules.

and now it distinguishs integer from floating point.


# 2.Dependencies

bison

flex

```
sudo apt-get install flex

sudo apt-get install bison
```

# 3.How to Use
##3.1  Compile 

```
flex cal.l

bison -d cal.y

gcc -o cal cal.tab.c lex.yy.c -ly -lm -lfl

```
##3.2 Run
```
./cal
```
# 4.Current Support Operator

\+

\-

\*

/

%

!

^

sin

cos

tan

log

exp