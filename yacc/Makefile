.PHONY: basic, operator, symbol
basic:
	yacc basic.y -o basic.tab.c
	gcc basic.tab.c -o basic

operator:
	yacc operator.y -o operator.tab.c
	gcc operator.tab.c -o operator
	
symbol:
	yacc symbol.y -o symbol.tab.c
	g++ symbol.tab.c SymbolTable.cpp -o symbol