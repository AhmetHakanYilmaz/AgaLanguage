%option main
lowercase	             [a-z]
uppercase	             [A-Z] 
nonzerodigit                 [1-9]
digit                        (0|{nonzerodigit})
sign                         [+-]                                  
letter                       ({lowercase}|{uppercase})
alphanumeric                 ({letter}|{digit})
space                        [ \t]
%%
\%                               printf("MOD_OP ");
\/                               printf("DIVIDE_OP ");
\*                               printf("MULTIPLICATION_OP ");
\=                               printf("ASSIGMENT_OP ");
\,                               printf("COMMA ");
\;                               printf("SEMICOLON ");
\(                               printf("LP ");
\)                               printf("RP ");
\{                               printf("LB ");
\}                               printf("RB ");
fun_dec                          printf("FUNCTION_DECLARATION ");
fun_call                         printf("FUNCTION_CALL ");
readTemperatureF                 printf("READ_TEMPERATURE_FUNCTION ");
readAltitudeF                    printf("READ_ALTITUDE_FUNCTION ");
readHeadF                        printf("READ_HEAD_FUNCTION ");
connectToBaseF                   printf("CONNECTION_TO_BASE_FUNCTION ");
changeSprayF                     printf("CHANGE_SPRAY_FUNCTION ");
stopUpOrDownF                    printf("STOP_UP_OR_DOWN_FUNCTION ");
moveForwardOrBackF               printf("MOVE_FORWARD_OR_BACK_FUNCTION ");
moveUporDownF                    printf("MOVE_UPON_OR_DOWN_FUNCTION ");
stopForwardOrBackF               printf("STOP_FORWARD_OR_BACK_FUNCTION ");
turnF                            printf("TURN_FUNCTION ");
return                           printf("RETURN ");
while                            printf("WHILE ");
input                            printf("INPUT ");
output                           printf("OUTPUT ");
\<                               printf("LESS_THAN ");
\<\=                             printf("LESS_THAN_OR_EQUAL ");
\>                               printf("GREATER_THAN ");
\>\=                             printf("GREATER_THAN_OR_EQUAL ");
\=\=                             printf("EQUAL_TO_OP ");
\!                               printf("NOT ");
\+                               printf("PLUS_OP ");
\-                               printf("MINUS_OP ");
\!\=                             printf("NOT_EQUAL_TO_OP ");
\&\&               	         printf("AND ");
\|\|                             printf("OR ");
\/\/                             printf("SHORT_COMMENT ");
\/\*                             printf("LONG_COMMENT_START ");
\*\/                             printf("LONG_COMMENT_END ");
true                             printf("TRUE ");
false                            printf("FALSE ");
string                           printf("STRING_KEYWORD ");
int                              printf("INT_KEYWORD ");
boolean                          printf("BOOLEAN_KEYWORD ");
float                            printf("FLOAT_KEYWORD ");
char                             printf("CHAR_KEYWORD ");
if                               printf("IF ");
else                             printf("ELSE ");
{sign}?{digit}+                  printf("INT ");
{sign}?{digit}*(\.)?{digit}+     printf("FLOAT ");
{letter}{alphanumeric}*          printf("VAR_NAME ");
\"(\\.|[^\\"])*\"                printf("STRING "); 
\'[^\\\']\'                      printf("CHAR "); 
{space}             		 printf(" ");
\n          		         printf("\n");
.                                          ;
