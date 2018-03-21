%{
%}

QUOTES		"'" 
QUOTES1 	"\""
DIGIT 		[0-9]
STRING 		[^ ]*
TEXT_NUMBERS [a-zA-Z0-9_]
NUM 		{DIGIT}+
ID 			[a-z]{TEXT_NUMBERS}*
ID1 		[A-Z]{TEXT_NUMBERS}*
VAR1		{ID}"["{NUM}"]"
VAR2		{ID}"["{ID}"]"
FLOATCONST	{NUM}"."{NUM}
SUM 		"+"|"-"
MULT 		"*"|"/"
LOGICAL_OP 	"&"|"\|"
UNARY_OP 	"!"|"++"|"--"
COMPARATOR 	">"|"<"|">="|"<="|"=="|"!="

%%
"("  			{ printf("%s \n", yytext);  	}
")"				{ printf("%s\n", yytext);  	}
"{"				{ printf("%s\n", yytext);   	}
"}"				{ printf("%s\n", yytext); 		}
"["				{ printf("%s\n", yytext);  	}
"]"				{ printf("%s\n", yytext);  	}
"."				{ printf("%s\n", yytext);  	}
","				{ printf("%s\n", yytext);  }
";"				{ printf("%s\n", yytext);  	}
":"				{ printf("%s\n", yytext);  	}
"="				{ printf("%s EQUAL\n", yytext);   	}
{QUOTES}		{ printf("%s\n", yytext);  	}
{QUOTES1}		{ printf("%s\n", yytext);  	}
{NUM}			{ printf("%s\n", yytext);  	}
{FLOATCONST}	{ printf("%s\n", yytext); 		}
{SUM}			{ printf("%s\n", yytext);  	}
{MULT}			{ printf("%s\n", yytext);  	}
{UNARY_OP}		{ printf("%s\n", yytext);  	}
{COMPARATOR}	{ printf("%s\n", yytext);  	}
"if"			{ printf("%s if\n", yytext);  	}
"while"			{ printf("%s while\n", yytext);  	}
"else"			{ printf("%s else\n", yytext);  	}
"for"			{ printf("%s for\n", yytext);  	}
"int"			{ printf("%s\n", yytext);  	}
"float"			{ printf("%s\n", yytext);   	}
"bool"			{ printf("%s\n", yytext);  	}
"string"		{ printf("%s\n", yytext);  	}
"Processor"		{ printf("%s\n", yytext);  	}
"Job"			{ printf("%s Job\n", yytext);  	}
"Cluster"		{ printf("%s\n", yytext);  	}
"Memory"		{ printf("%s\n", yytext); 		}
"Link"			{ printf("%s\n", yytext);  	}
"is_running"	{ printf("%s\n", yytext);  	}
"primary"		{ printf("%s\n", yytext);  	}
"secondary"		{ printf("%s\n", yytext);  	}
"cache"			{ printf("%s\n", yytext);  	}
"submit_jobs"	{ printf("%s\n", yytext);  	}
"flops_required"	{ printf("%s\n", yytext); 	}
"get_clock_speed"	{ printf("%s\n", yytext); 	}
"discard_job"	{ printf("%s\n", yytext);  	}
"job_id"		{ printf("%s\n", yytext);  	}
"get_available_memory" { printf("%s\n", yytext);  	}
"get_memory"	{ printf("%s\n", yytext);  	}
"mem_size"		{ printf("%s\n", yytext);  	}
"isa"			{ printf("%s\n", yytext);  	}
"clock_speed"	{ printf("%s\n", yytext);  	}
"l1_mem"		{ printf("%s\n", yytext);  	}
"ARM"			{ printf("%s\n", yytext);  	}
"AMD"			{ printf("%s\n", yytext);  	}
"CDC"			{ printf("%s\n", yytext);  	}
"MIPS"			{ printf("%s\n", yytext);  	}
"memory_type"	{ printf("%s\n", yytext);  	}
"memory_size"	{ printf("%s\n", yytext); 		}
"start_point"	{ printf("%s\n", yytext);  	}
"end_point"		{ printf("%s\n", yytext);  	}
"bandwidth"		{ printf("%s\n", yytext); 		}
"deadline"		{ printf("%s DEADLINE\n", yytext);  	}
"mem_required"	{ printf("%s\n", yytext);  	}
"affinity"		{ printf("%s\n", yytext);  	}
"topology"		{ printf("%s\n", yytext); 		}
"name"			{ printf("%s\n", yytext);  	}	
"star"			{ printf("%s\n", yytext);  	}
"bus"			{ printf("%s\n", yytext);  	}
{VAR1}			{ printf("%s\n", yytext);  	}
{VAR2}			{ printf("%s\n", yytext);  	}
{ID}			{ printf("%s ID\n", yytext);  	}
{ID1}			{ printf("%s ID1\n", yytext);  	}
\"{STRING}\"	{ printf("%s\n", yytext); 		}
\'{STRING}\'	{ printf("%s\n", yytext);  	}
%%

int main(int argc, char *argv[]) {

yylex();
return 0;
}