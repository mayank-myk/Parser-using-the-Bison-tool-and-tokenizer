%{
#include "y.tab.h"
char * xyz = "lkajdsflkjasdf";
%}

QUOTES		"'" 
QUOTES1 	\"
DIGIT 		[0-9]
STRING 		[a-zA-Z0-9_]+
TEXT_NUMBERS [a-zA-Z0-9_]
NUM 		{DIGIT}+
ID 			[a-z]{TEXT_NUMBERS}*
ID1 		[A-Z]{TEXT_NUMBERS}*
VAR1		{ID1}"["{NUM}"]"
VAR2		{ID1}"["{ID}"]"
FLOATCONST	{NUM}"."{NUM}
SUM 		"+"|"-"
MULT 		"*"|"/"
LOGICAL_OP 	"&"|"\|"
UNARY_OP 	"!"|"++"|"--"
COMPARATOR 	">"|"<"|">="|"<="|"=="|"!="

%%
"("  			{ return OPENPR;}
")"				{ return CLOSEPR;	}
"{"				{ return OPENBR; 	}
"}"				{ return CLOSEBR;	}
"["				{ return OPENSQ; 	}
"]"				{ return CLOSESQ;	}
"."				{ return DOT; 	}
","				{ return COMMA; }
";"				{ return DEL;		}
":"				{ return COLON;	}
"="				{ return EQUAL; 	}
{NUM}			{ return NUM;	}
{FLOATCONST}	{ return FLOAT_CONST;	}
{SUM}			{ return SUM;		}
{MULT}			{ return MULT; 	}
{UNARY_OP}		{ return UNARY_OP;		}
{COMPARATOR}	{ return COMPARATOR;}
"if"			{ return IF;		}
"while"			{ return WHILE;	}
"else"			{ return ELSE;	}
"for"			{ return FOR;		}
"int"			{ return INT;		}
"float"			{ return FLOAT; 	}
"bool"			{ return BOOL; 	}
"string"		{ return STRING; 	}
"Processor"		{ return PROCESSOR;}
"processors"		{ return PROCESSORS;}
"Job"			{ return JOB; 	}
"Cluster"		{ return CLUSTER;	}
"Memory"		{ return MEMORY; 	}
"Link"			{ return LINK;	}
"is_running"	{ return IS_RUNNING;}
"primary"		{ return PRIMARY;	}
"secondary"		{ return SECONDARY; }
"cache"			{ return CACHE;	}
"run"			{ return RUN;	}
"wait"			{ return WAIT;	}
"submit_jobs"	{ return SUBMIT_JOBS;	}
"flops_required"	{ return FLOPS_REQUIRED;	}
"get_clock_speed"	{ return GET_CLOCK_SPEED;	}
"discard_job"	{ return DISCARD_JOB;}
"job_id"		{ return JOB_ID; 	}
"get_available_memory" { return GET_AVAILABLE_MEMORY;	}
"get_memory"	{ return GET_MEMORY;	}
"mem_size"		{ return MEM_SIZE;	}
"isa"			{ return ISA;	}
"clock_speed"	{ return CLOCK_SPEED;	}
"l1_memory"		{ return L1_MEM;	}
"ARM"			{ return ARM;	}
"AMD"			{ return AMD;	}
"CDC"			{ return CDC;	}
"MIPS"			{ return MIPS;	}
"memory_type"	{ return MEMORY_TYPE;	}
"memory_size"	{ return MEMORY_SIZE;	}
"start_point"	{ return START_POINT;	}
"end_point"		{ return END_POINT;	}
"bandwidth"		{ return BANDWIDTH;	}
"deadline"		{ return DEADLINE;	}
"mem_required"	{ return MEM_REQUIRED;}
"affinity"		{ return AFFINITY; 	}
"topology"		{ return TOPOLOGY;	}
"name"			{ return NAME;	}	
"star"			{ return STAR;	}
"bus"			{ return BUS;		}
{VAR1}			{ return VAR;	}
{VAR2}			{ return VAR;	}
{ID}			{ return ID; 		}
{ID1}			{ return ID1; 		}
\"{STRING}\"	{  return STRING_CONST;	}
'{STRING}'		{ return STRING_CONST;	}
{QUOTES}		{ return QUOTES;	}
{QUOTES1}		{ return QUOTES;	}
%%

int yywrap (void) {return 1;}