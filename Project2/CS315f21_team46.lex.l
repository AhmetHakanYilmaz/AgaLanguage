lowercase	             [a-z]
uppercase	             [A-Z] 
nonzerodigit                 [1-9]
digit                        (0|{nonzerodigit})
sign                         [+-]                                  
letter                       ({lowercase}|{uppercase})
alphanumeric                 ({letter}|{digit})
space                        [ \t]

%option yylineno
%%
\%                               return MOD_OP ;
\/                               return DIVIDE_OP ;
\*                               return MULTIPLICATION_OP ;
\=                               return ASSIGMENT_OP ;
\,                               return COMMA ;
\;                               return SEMICOLON ;
\(                               return LP ;
\)                               return RP ;
\{                               return LB ;
\}                               return RB ;
main                             return MAIN;
begin_program                    return BEGIN_PROGRAM;
end_program                      return END_PROGRAM;
fun_dec                          return FUN_DEC;
fun_call                         return FUN_CALL ;
readTemperatureF                 return READ_TEMPERATURE_FUNCTION ;
readAltitudeF                    return READ_ALTITUDE_FUNCTION ;
readHeadF                        return READ_HEAD_FUNCTION ;
connectToBaseF                   return CONNECTION_TO_BASE_FUNCTION ;
changeSprayF                     return CHANGE_SPRAY_FUNCTION ;
stopUpOrDownF                    return STOP_UP_OR_DOWN_FUNCTION ;
moveForwardOrBackF               return MOVE_FORWARD_OR_BACK_FUNCTION ;
moveUpOrDownF                    return MOVE_UP_OR_DOWN_FUNCTION ;
stopForwardOrBackF               return STOP_FORWARD_OR_BACK_FUNCTION ;
arcCosF				 return ARCCOS_FUNCTION;
turnF                            return TURN_FUNCTION ;
return                           return RETURN ;
while                            return WHILE ;
input                            return INPUT ;
output                           return OUTPUT ;
\<                               return LESS_THAN ;
\<\=                             return LESS_THAN_OR_EQUAL ;
\>                               return GREATER_THAN ;
\>\=                             return GREATER_THAN_OR_EQUAL ;
\=\=                             return EQUAL_TO_OP ;
\!                               return NOT ;
\+                               return PLUS_OP ;
\-                               return MINUS_OP ;
\!\=                             return NOT_EQUAL_TO_OP ;
\&\&               	         return AND ;
\|\|                             return OR ;
\/\/([^\n])*\n                   return SHORT_COMMENT ;
\/\*([^\*\/])*\*\/               return LONG_COMMENT ;
vr				 return VR ;
true                             return TRUE ;
false                            return FALSE ;
void                             return VOID_KEYWORD ;
string                           return STRING_KEYWORD ;
int                              return INT_KEYWORD ;
boolean                          return BOOLEAN_KEYWORD ;
float                            return FLOAT_KEYWORD ;
char                             return CHAR_KEYWORD ;
elif                             return ELIF ;
if                               return IF ;
else                             return ELSE ;
{sign}?{digit}+                  return INT ;
{sign}?{digit}*(\.)?{digit}+     return FLOAT ;
{letter}{alphanumeric}*          return VAR_NAME ;      
\"(\\.|[^\\"])*\"                return STRING ; 
\'[^\\\']\'                      return CHAR; 
\#				 return SHARP;
\n                                ;
.                                 ;
%%
int yywrap() { return 1; }