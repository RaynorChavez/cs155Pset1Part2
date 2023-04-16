To Run in WSL2

1. sudo apt-get update
2. sudo apt install flex
3. make sure you are in the root folder of your lexer file (*.l)
4. flex lexer.l
5. gcc lex.yy.c -o lexer -lfl
6. ./lexer < test2.txt