parse: y.tab.c lex.yy.c
	gcc -o parse y.tab.c
y.tab.c: CS315f21_team46.yacc.y lex.yy.c
	yacc CS315f21_team46.yacc.y
lex.yy.c: CS315f21_team46.lex.l
	lex CS315f21_team46.lex.l
clean:
	rm -f lex.yy.c y.tab.c parse