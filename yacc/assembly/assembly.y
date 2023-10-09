%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>
#define VAR_MAX_NUM 64 // 设定变量的最大数目为64
#define EXPR_MAX_LENTH 64 // 设定字符串的最大长度为64
#define ASM_MAX_LENTH 512 // 设定汇编代码的最大长度为512

struct var{ //用于存储变量的对应地址
    char *name;
    char *addr;
} varArr[VAR_MAX_NUM];
struct var *get_var(char *name);

struct code_block{ //用于存储代码段
    char *code;
    char *addr;
    int is_number;
};

int result_num=0;
char str[50];

int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
%}

//属性值可能具有的类型
%union{
    struct code_block *assembly;
    struct var *ident;
}

//%token 为每一个都自动分配不等的整数值
%token ADD 
%token MINUS 
%token MUL 
%token DIV 
%token EQU 
%token LEFT_PAR 
%token RIGHT_PAR
%token <assembly> NUMBER
%token <ident> ID

//声明优先级和结合性
%right EQU
%left ADD MINUS
%left MUL DIV
%right UMINUS
%left LEFT_PAR RIGHT_PAR

//设置生成式的属性
%type <assembly> assignstmt
%type <assembly> expr

%%

lines : lines expr ';' { printf("%s", $2->code); }
      | lines assignstmt ';' { printf("%s", $2->code); }
      | lines ';'
      |
      ;

//赋值给标识符表达式或者运算式
assignstmt : ID EQU assignstmt { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                                    $$->addr = (char *)malloc(EXPR_MAX_LENTH); strcpy($$->addr, $3->addr);
                                    $$->code = (char *)malloc(ASM_MAX_LENTH); strcpy($$->code, $3->code);
                                    //LDR R1,addr
                                    strcat($$->code, "LDR  R1, "); strcat($$->code, $1->addr); strcat($$->code, "\n"); 
                                    //STR R0,[R1]
                                    strcat($$->code, "STR  R0, [R1]\n");
                                    $$->is_number = 0; }

            | ID EQU expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                              $$->addr = (char *)malloc(EXPR_MAX_LENTH); strcpy($$->addr, $3->addr);
                              $$->code = (char *)malloc(ASM_MAX_LENTH); strcpy($$->code, $3->code);
                              if($3->is_number) //如果expr是一个数字
                              {
                                //mov R0,#value
                                strcat($$->code, "MOV  R0, #"); strcat($$->code, $3->addr); strcat($$->code, "\n");
                              }
                              else
                              {
                                //LDR R0,addr
                                strcat($$->code, "LDR  R0, "); strcat($$->code, $3->addr); 
                                //LDR R0,[R0]
                                strcat($$->code, "\nLDR R0, [R0]\n");
                                }
                              //LDR R1,var_addr  
                              strcat($$->code, "LDR  R1, "); strcat($$->code, $1->addr); strcat($$->code, "\n");
                              //STR R0,[R1]
                              strcat($$->code, "STR  R0, [R1]\n");
                              $$->is_number = 0; }
           ;

expr : expr ADD expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(EXPR_MAX_LENTH); sprintf($$->addr, "addr_result_%d", result_num++);
                       $$->code = (char *)malloc(ASM_MAX_LENTH); sprintf($$->code, "%s%s", $1->code, $3->code);
                       if($1->is_number)
                       {
                        //mov R0,#value
                        strcat($$->code, "MOV  R0, #"); strcat($$->code, $1->addr); strcat($$->code, "\n");
                       }
                       else
                       {
                        //LDR R0,addr
                        strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); 
                        //LDR R0,[R0]
                        strcat($$->code, "\nLDR  R0, [R0]\n");
                        }
                       if($3->is_number)
                       {
                        strcat($$->code, "MOV  R1, #"); strcat($$->code, $3->addr); strcat($$->code, "\n");
                        }
                       else
                       {
                        strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); 
                        strcat($$->code, "\nLDR  R1, [R1]\n");
                        }
                       //ADD R0,R0,R1 
                       strcat($$->code, "ADD  R0, R0, R1\n");
                       //LDR R1,addr
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       //STR R0,[R1]
                       strcat($$->code, "STR  R0, [R1]\n");
                       $$->is_number = 0; }

     | expr MINUS expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(EXPR_MAX_LENTH); sprintf($$->addr, "addr_result_%d", result_num++);
                       $$->code = (char *)malloc(ASM_MAX_LENTH); sprintf($$->code, "%s%s", $1->code, $3->code);
                       if($1->is_number)
                       {
                        //mov R0,#value
                        strcat($$->code, "MOV  R0, #"); strcat($$->code, $1->addr); strcat($$->code, "\n");
                        }
                       else
                       {
                        //LDR R0,addr
                        strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); 
                        //LDR R0,[R0]
                        strcat($$->code, "\nLDR  R0, [R0]\n");
                        }
                       if($3->is_number)
                       {
                        strcat($$->code, "MOV  R1, #"); strcat($$->code, $3->addr); strcat($$->code, "\n");
                        }
                       else
                       {
                        strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); 
                        strcat($$->code, "\nLDR  R1, [R1]\n");
                        }
                       //SUB R0,R0,R1 
                       strcat($$->code, "SUB  R0, R0, R1\n");
                       //LDR R1,addr
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       //STR R0,[R1]
                       strcat($$->code, "STR  R0, [R1]\n");
                       $$->is_number = 0; }

     | expr MUL expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(EXPR_MAX_LENTH); sprintf($$->addr, "addr_result_%d", result_num++);
                       $$->code = (char *)malloc(ASM_MAX_LENTH); sprintf($$->code, "%s%s", $1->code, $3->code);
                       if($1->is_number)
                       {
                        strcat($$->code, "MOV  R0, #"); strcat($$->code, $1->addr); strcat($$->code, "\n");
                        }
                       else
                       {
                        strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); 
                        strcat($$->code, "\nLDR  R0, [R0]\n");
                        }
                       if($3->is_number)
                       {
                        strcat($$->code, "MOV  R1, #"); strcat($$->code, $3->addr); strcat($$->code, "\n");
                        }
                       else
                       {
                        strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); 
                        strcat($$->code, "\nLDR  R1, [R1]\n");
                        }
                       strcat($$->code, "MUL  R0, R0, R1\n");
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       strcat($$->code, "STR  R0, [R1]\n");
                       $$->is_number = 0; }

     | expr DIV expr { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                       $$->addr = (char *)malloc(EXPR_MAX_LENTH); sprintf($$->addr, "addr_result_%d", result_num++);
                       $$->code = (char *)malloc(ASM_MAX_LENTH); sprintf($$->code, "%s%s", $1->code, $3->code);
                       if($1->is_number)
                       {
                        strcat($$->code, "MOV  R0, #"); strcat($$->code, $1->addr); strcat($$->code, "\n");
                        }
                       else
                       {
                        strcat($$->code, "LDR  R0, "); strcat($$->code, $1->addr); 
                        strcat($$->code, "\nLDR  R0, [R0]\n");
                        }
                       if($3->is_number)
                       {
                        strcat($$->code, "MOV  R1, #"); strcat($$->code, $3->addr); strcat($$->code, "\n");
                        }
                       else
                       {
                        strcat($$->code, "LDR  R1, "); strcat($$->code, $3->addr); 
                        strcat($$->code, "\nLDR  R1, [R1]\n");
                        }
                       strcat($$->code, "SDIV  R0, R0, R1\n");
                       strcat($$->code, "LDR  R1, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                       strcat($$->code, "STR  R0, [R1]\n");
                       $$->is_number = 0; }

     | LEFT_PAR expr RIGHT_PAR { $$ = $2; }

     | MINUS expr %prec UMINUS { $$ = (struct code_block *)malloc(sizeof(struct code_block));
                               $$->addr = (char *)malloc(EXPR_MAX_LENTH); sprintf($$->addr, "addr_result_%d", result_num++);
                               $$->code = (char *)malloc(ASM_MAX_LENTH); sprintf($$->code, "%s", $2->code);
                               if($2->is_number)
                               {
                                strcat($$->code, "MOV  R0, #"); strcat($$->code, $2->addr); strcat($$->code, "\n");
                                }
                               else
                               {
                                strcat($$->code, "LDR  R0, "); strcat($$->code, $2->addr); 
                                strcat($$->code, "\nLDR  R0, [R0]\n");
                                }
                               strcat($$->code, "RSB  R0, R0, #0\n"); 
                               strcat($$->code, "LDR  R1, "); strcat($$->code, $$->addr); strcat($$->code, "\n");
                               strcat($$->code, "STR  R0, [R1]\n");
                               $$->is_number = 0; }
     
     | NUMBER { $$ = $1;}

     | ID { $$ = (struct code_block *)malloc(sizeof(struct code_block));
            $$->addr = (char *)malloc(EXPR_MAX_LENTH); strcpy($$->addr, $1->addr);
            $$->code = (char *)malloc(ASM_MAX_LENTH); strcpy($$->addr, $1->addr); 
            $$->is_number = 0; }
     ;

%%

int yylex()
{
    int t;
    while(1)
    {
        t = getchar();
        if(t == ' ' || t == '\t' || t == '\n'){}
        else if (isdigit(t))
        {
            yylval.assembly = (struct code_block *)malloc(sizeof(struct code_block));
            yylval.assembly->addr = (char *)malloc(EXPR_MAX_LENTH); 
            yylval.assembly->code = "";
            yylval.assembly->is_number = 1;

            char* pos = yylval.assembly->addr;
            while(isdigit(t)){
                *(pos++)=t;
                t=getchar();
            }
            ungetc(t,stdin);//将读出的多余字符再次放回到缓冲区
            *pos='\0';
            return NUMBER;
		}
        else if (isalpha(t) || t == '_'){//标识符以字母下划线开头
			char* pos = str;
            while(isdigit(t) || isalpha(t) || t == '_'){
                *(pos++)=t;
                t=getchar();
            }
            ungetc(t,stdin);//将读出的多余字符再次放回到缓冲区
            *pos='\0';
            yylval.ident=get_var(str); //将对应的变量加入yylval.varval
            return ID;
		}else if(t=='+'){
            return ADD;
        }else if(t=='-'){
            return MINUS;
        }else if(t=='*'){
            return MUL;
        }else if(t=='/'){
            return DIV;
        }else if(t=='('){
            return LEFT_PAR;
        }else if(t==')'){
            return RIGHT_PAR;
        }else if (t == '='){
			return EQU;
		}else{
            return t;
        }
    }
}

struct var* get_var(char *name){
	for(struct var* pos = varArr;pos != varArr + VAR_MAX_NUM; ++pos){ //遍历整个varArr
		if(!pos->addr){ //当该位置没有初始化时，申请一个var
            pos->addr = (char *)malloc(EXPR_MAX_LENTH);
            sprintf(pos->addr, "addr_%s", name);
            pos->name = strdup(name);
		}
		if(!strcmp(pos->name,name)){ //当找到name时，返回
			return pos;
		}
	}
	yyerror("Too many vars!");//此时已遍历varArr，且没有对应的name和空位
	exit(1);
}

int main(){
	yyin = stdin;
	do {
		yyparse();
	} while (!feof(yyin));
	return 0;
}
void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}