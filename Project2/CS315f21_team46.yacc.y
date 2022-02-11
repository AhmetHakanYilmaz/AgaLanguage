%{
#include <stdio.h>
extern int yylineno;
%}
%token MAIN
%token BEGIN_PROGRAM
%token END_PROGRAM
%token MOD_OP  
%token DIVIDE_OP  
%token MULTIPLICATION_OP  
%token ASSIGMENT_OP  
%token COMMA  
%token SEMICOLON
%token SHARP
%token LP  
%token RP  
%token LB  
%token RB  
%token FUN_DEC 
%token FUN_CALL  
%token READ_TEMPERATURE_FUNCTION  
%token READ_ALTITUDE_FUNCTION  
%token READ_HEAD_FUNCTION  
%token CONNECTION_TO_BASE_FUNCTION  
%token CHANGE_SPRAY_FUNCTION  
%token STOP_UP_OR_DOWN_FUNCTION  
%token MOVE_FORWARD_OR_BACK_FUNCTION  
%token MOVE_UP_OR_DOWN_FUNCTION  
%token STOP_FORWARD_OR_BACK_FUNCTION  
%token ARCCOS_FUNCTION
%token TURN_FUNCTION  
%token RETURN                          
%token WHILE  
%token INPUT  
%token OUTPUT  
%token ELIF
%token LESS_THAN  
%token LESS_THAN_OR_EQUAL  
%token GREATER_THAN  
%token GREATER_THAN_OR_EQUAL  
%token EQUAL_TO_OP  
%token NOT  
%token PLUS_OP  
%token MINUS_OP  
%token NOT_EQUAL_TO_OP  
%token AND  
%token OR  
%token SHORT_COMMENT  
%token LONG_COMMENT
%token TRUE  
%token FALSE  
%token VOID_KEYWORD
%token STRING_KEYWORD  
%token INT_KEYWORD  
%token BOOLEAN_KEYWORD  
%token FLOAT_KEYWORD  
%token CHAR_KEYWORD  
%token IF  
%token ELSE  
%token INT  
%token FLOAT  
%token VAR_NAME  
%token STRING   
%token CHAR
%token VR

%start program

%%

// 1. Programs

//main ekle

program: BEGIN_PROGRAM program_with_main END_PROGRAM

program_with_main : main_program 
      		  | statement_list main_program 
       		  | statement_list main_program statement_list
       		  | main_program statement_list

main_program: MAIN LP RP LB statement_list RB

statement_list : statement 
	       | statement statement_list

statement : if_else_statement
	  | assignment_statement
	  | initialize_statement
	  | loop_statement
	  | output_statement
	  | function_statement
	  | comment_statement
	  

comment_statement: SHORT_COMMENT
		 | LONG_COMMENT

// 2. Types

var_type : INT_KEYWORD 
	 | FLOAT_KEYWORD
	 | VOID_KEYWORD 
	 | STRING_KEYWORD 
	 | CHAR_KEYWORD 
	 | BOOLEAN_KEYWORD

literal : INT 
	| FLOAT 
	| STRING 
	| boolean
	| CHAR

boolean : TRUE
	| FALSE

term    : literal
	| VAR_NAME

//3.If else statements

if_else_statement : IF LP logic_expression_list RP LB statement_list RB ELSE LB statement_list RB
		  | IF LP logic_expression_list RP LB statement_list RB
		  | IF LP logic_expression_list RP LB statement_list RB else_if_statement_list ELSE LB statement_list RB
		  | IF LP logic_expression_list RP LB statement_list RB else_if_statement_list

else_if_statement_list : else_if_statement 
		       | else_if_statement else_if_statement_list

else_if_statement : ELIF LP logic_expression_list RP LB statement_list RB

//4.Initialize and Assignment statements

assignment_statement : VAR_NAME ASSIGMENT_OP cast_expression SEMICOLON
	             | VAR_NAME ASSIGMENT_OP input_expression SEMICOLON
		     | VAR_NAME ASSIGMENT_OP function_call SEMICOLON
		     | VAR_NAME ASSIGMENT_OP function_output SEMICOLON
		     | VAR_NAME ASSIGMENT_OP string_concat SEMICOLON 
		//	| VAR_NAME ASSIGMENT_OP function_arithmetic_exp SEMICOLON


initialize_statement    : var_type VAR_NAME SEMICOLON
			| var_type VAR_NAME ASSIGMENT_OP cast_expression SEMICOLON
			| var_type VAR_NAME ASSIGMENT_OP input_expression SEMICOLON
			| var_type VAR_NAME ASSIGMENT_OP function_call SEMICOLON
			| var_type VAR_NAME ASSIGMENT_OP function_output SEMICOLON 
			| var_type VAR_NAME ASSIGMENT_OP string_concat SEMICOLON 
		//	| var_type VAR_NAME ASSIGMENT_OP function_arithmetic_exp SEMICOLON
				
cast_expression : LP var_type RP term

//5.Loops

loop_statement  : while_statement

while_statement : WHILE LP logic_expression_list RP LB statement_list RB

//6.Input/Output

output_statement : OUTPUT LP term RP SEMICOLON
input_expression : INPUT LP RP


//7.logic and arithmetic expressions

logic_expression_list  : logic_expression 
		       | logic_expression boolean_operator logic_expression_list

logic_expression : relational_exp
		 | boolean
		 | VAR_NAME
		 | not_logic_exp


return_expression_list  : return_expression 
		        | return_expression boolean_operator return_expression_list

return_expression : relational_exp
		  | not_logic_exp

string_concat : term SHARP term 
	      | string_concat SHARP term

not_logic_exp : NOT LP logic_expression_list RP

relational_exp  : arithmetic_exp relational_operator arithmetic_exp |
			function_call relational_operator arithmetic_exp |
			arithmetic_exp relational_operator function_call |
			function_call relational_operator function_call

arithmetic_exp : arithmetic_exp arithmetic_operator_1 arithmetic_exp_2
	       | arithmetic_exp_2

arithmetic_exp_2 : arithmetic_exp_2 arithmetic_operator_2 term
		 | term

//arithmetic_term : term //|function_call

//function_arithmetic_exp :  arithmetic_exp arithmetic_operator_1 function_call
			// | function_call arithmetic_operator_1 arithmetic_exp 
			// | arithmetic_exp arithmetic_operator_2 function_call
			// | function_call arithmetic_operator_2 arithmetic_exp 
			

boolean_operator : AND 
		 | OR 

relational_operator : LESS_THAN 
		    | LESS_THAN_OR_EQUAL 
		    | GREATER_THAN 
		    | GREATER_THAN_OR_EQUAL 
		    | EQUAL_TO_OP
		    | NOT_EQUAL_TO_OP

arithmetic_operator_1 : PLUS_OP
		      | MINUS_OP

arithmetic_operator_2 : DIVIDE_OP
		      | MULTIPLICATION_OP 
		      | MOD_OP


//Function

function_statement : function_def | function_call SEMICOLON

// | function_call	

 
function_def : var_type FUN_DEC VAR_NAME LP var_type_list RP LB function_body RB
	     | var_type FUN_DEC VAR_NAME LP RP LB function_body RB

function_body : statement_list RETURN function_output SEMICOLON  
	      | function_body statement_list  RETURN function_output SEMICOLON 

var_type_list  :var_type VAR_NAME COMMA var_type_list 
		| var_type VAR_NAME
		 

function_output :  arithmetic_exp | return_expression_list  | voidReturn
// tam değil		
//arithmetic_exp 
		
//int FUN_DEC math ( int x, int y, boolean akın, float arda)
//{
	
//}
 
function_call : FUN_CALL VAR_NAME LP term_list RP 
	      | FUN_CALL VAR_NAME LP RP 
	      | primitive_functions

term_list : term
	  | term COMMA term_list

voidReturn : VR


primitive_functions     : function_readTemperatureF 
			| function_readAltitudeF 
			| function_readHeadF 
			| function_connectToBaseF 
			| function_changeSprayF 
			| function_stopUpOrDownF 
			| function_moveForwardOrBackF 
			| function_moveUpOrDownF 
			| function_stopForwardOrBackF 
			| function_turnF
			| function_arcCosF                           

function_readTemperatureF : FUN_CALL READ_TEMPERATURE_FUNCTION LP RP
function_readAltitudeF : FUN_CALL READ_ALTITUDE_FUNCTION LP RP
function_readHeadF : FUN_CALL READ_HEAD_FUNCTION LP RP
function_changeSprayF : FUN_CALL CHANGE_SPRAY_FUNCTION LP term RP
function_connectToBaseF : FUN_CALL CONNECTION_TO_BASE_FUNCTION LP term COMMA term RP
function_stopUpOrDownF : FUN_CALL STOP_UP_OR_DOWN_FUNCTION LP term RP
function_moveForwardOrBackF : FUN_CALL MOVE_FORWARD_OR_BACK_FUNCTION LP term RP
function_moveUpOrDownF : FUN_CALL MOVE_UP_OR_DOWN_FUNCTION LP term COMMA term RP
function_stopForwardOrBackF : FUN_CALL STOP_FORWARD_OR_BACK_FUNCTION LP term RP
function_turnF : FUN_CALL TURN_FUNCTION LP term COMMA term RP
function_arcCosF : FUN_CALL ARCCOS_FUNCTION LP term RP


%%
#include "lex.yy.c"

void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno,s);
}

int main(void){
	yyparse();
	if(yynerrs == 0){
		printf("Parsing is successfully finished\n");
	}
 	return 0;
}

