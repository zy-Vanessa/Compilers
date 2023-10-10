%{
/**************************************************
实现功能更强的词法分析和语法分析程序， 使之能支持变量, 修改词法分析程序, 能识别变量 (标识符) 和“="符号，
修改语法分析器，使之能分析、翻译“a=2" 形式的赋值语句，当变量出现在表达式中时, 能正确获取其值进行计算 （未赋值的变 量取0）。
当然，这些都需要实现符号表功能。
**************************************************/
#include <iostream>
#include <string>
#include <any>
#include "SymbolTable.h"
#ifndef YYSTYPE
#define YYSTYPE std::any
#endif

int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char*s);

SymbolTable symTable;

%}

%token ADD
%token SUB
%token MUL
%token DIV
%token UMINUS
%token LEFT
%token RIGHT
%token NUMBER
%token IDENTIFIER
%token ASSIGN
%token SEMI
%token END

%left ADD SUB
%left MUL DIV
%right UMINUS

%%

program :   program END                 {
                                            std::cout << "The symbol table:" << std::endl;
                                            symTable.printAll();
                                        }
        |   program stmt
        |   stmt
        ;

stmt    :   IDENTIFIER ASSIGN expr SEMI {
                                            symTable.insert(std::any_cast<std::string>($1), std::any_cast<double>($3));
                                        }
        ;

expr    :   expr ADD expr               {$$ = std::any_cast<double>($1) + std::any_cast<double>($3);}
        |   expr SUB expr               {$$ = std::any_cast<double>($1) - std::any_cast<double>($3);}
        |   expr MUL expr               {$$ = std::any_cast<double>($1) * std::any_cast<double>($3);}
        |   expr DIV expr               {$$ = std::any_cast<double>($1) / std::any_cast<double>($3);}
        |   LEFT expr RIGHT             {$$ = std::any_cast<double>($2);}
        |   SUB expr %prec UMINUS       {$$ = -1 * std::any_cast<double>($2);}
        |   NUMBER                      {$$ = std::any_cast<double>($1);}
        |   IDENTIFIER                  {
                                            std::string identifier = std::any_cast<std::string>($1);
                                            if(!symTable.search(identifier)){
                                                std::cout << "ERROR! " << identifier << " NOT DEFINED!" << std::endl;
                                            }
                                            else{
                                                $$ = symTable.getValue(identifier);
                                            }
                                        }
        ;

%%

int yylex()
{
    char ch;
    while(1) {
        ch = getchar();
        if(ch == ' ' || ch == '\t' || ch =='\n');
        else if (isdigit(ch)){
            double num = 0;
            while(isdigit(ch)){
                num = num * 10 + ch - '0';
                ch = getchar();
            }
            yylval = num;
            ungetc(ch, stdin);
            return NUMBER;
        }
        else if (isalpha(ch) || ch == '_'){
            std::string str = "";
            while(isalpha(ch) || isdigit(ch) || ch == '_'){
                str.push_back(ch);
                ch = getchar();
            }
            ungetc(ch, stdin);
            if(str=="END") {
                return END;
            }
            else{
                if(!symTable.search(str)){
                    symTable.insert(str, 0);
                }
                yylval = str;
                return IDENTIFIER;
            }
        }
        else if (ch == '+'){
            return ADD;
        }
        else if(ch == '-'){
            return SUB;
        }
        else if (ch == '*'){
            return MUL;
        }
        else if (ch == '/'){
            return DIV;
        }
        else if (ch == '('){
            return LEFT;
        }
        else if (ch == ')'){
            return RIGHT;
        }
        else if (ch == '='){
            return ASSIGN;
        }
        else if (ch == ';'){
            return SEMI;
        }
        else{
            return ch;
        }
    }
}

int main()
{
    yyin = stdin;
    do {
        yyparse();
    } while(!feof(yyin));
    return 0;
}

void yyerror(const char* s)
{
    fprintf(stderr, "Parse error:%s\n", s);
    exit(1);
}