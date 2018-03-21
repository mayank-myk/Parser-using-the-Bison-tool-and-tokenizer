%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
    void yyerror(char *s)
    {
        fprintf(stderr,"Unknown errors detected.\n");
        extern int yylineno;
    }
    
    
extern int yylineno;
extern int lineno;
%}

%token 		NUM INT FLOAT FLOAT_CONST STRING STRING_CONST BOOL DEL ID COMPARATOR CLOSESQ OPENSQ OPENBR 
%token      CLOSEBR OPENPR ID1 PROCESSORS
%token      CLOSEPR EQUAL QUOTES COMMA COLON DOT 
%token 		FOR WHILE IF ELSE  
%token      IS_RUNNING SUBMIT_JOBS GET_CLOCK_SPEED DISCARD_JOB JOB_ID
%token      GET_AVAILABLE_MEMORY GET_MEMORY MEM_SIZE 
%token 	    VAR
%token      PROCESSOR ISA CLOCK_SPEED L1_MEM ARM AMD CDC MIPS MEMORY MEMORY_TYPE MEMORY_SIZE 
%token      PRIMARY SECONDARY CACHE LINK START_POINT END_POINT BANDWIDTH JOB FLOPS_REQUIRED 
%token      DEADLINE MEM_REQUIRED AFFINITY RUN WAIT
%token      CLUSTER TOPOLOGY NAME STAR RING BUS 
%token      SUM  
%token		MULT
%token		UNARY_OP
%start 		program

%% 
program : statement_list {printf("program : statement_list\n");}
		;

statement_list  : statement statement_list {printf("statement_list : statement statement_list\n");}
				|
				;
statement : var_decl DEL{printf("statement : var_decl DEL\n");}
		  | loop {printf("statement : loop\n");}
		  | ifstmnt {printf("statement : ifstmnt \n");}
		  |func_call DEL {printf("statement : func_call DEL\n");}
		  | expr DEL {printf("statement : expr DEL\n");}
		  | obj_constr DEL {printf("statement : obj_constr DEL\n");}
		  ;

var_decl : var_type x {printf("var_decl : var_type x\n");}
		 ;

var_type : INT{printf("var_type : INT\n");}
		 | STRING{printf("var_type : STRING\n");}
		 | BOOL{printf("var_type : BOOL\n");}
		 | FLOAT{printf("var_type : FLOAT\n");}
		 ;

loop : for_loop{printf("loop : for_loop\n");}
	 | while_loop{printf("loop : while_loop\n");}
	 ;

for_loop : FOR OPENPR expr DEL condition DEL expr CLOSEPR OPENBR statement_list CLOSEBR {printf("for_loop\n");}

while_loop : WHILE OPENPR condition CLOSEPR OPENBR statement_list CLOSEBR {printf("while_loop\n");}

ifstmnt : IF condition OPENBR statement_list CLOSEBR ELSE OPENBR statement_list CLOSEBR {printf("ifstmnt\n");}
		| IF condition OPENBR statement_list CLOSEBR {printf("ifstmnt\n");}

func_call : proc_func_call {printf("func_call : proc_func_call\n");}
		  | mem_func_call {printf("func_call : mem_func_call\n");}
		  | job_func_call {printf("func_call : job_func_call\n");}
		  | wait_call{printf("func_call : wait_call\n");}
		  ;

wait_call : WAIT OPENPR NUM CLOSEPR {printf("wait_call : WAIT OPENPR NUM CLOSEPR\n");}
		  ;

proc_func_call : x EQUAL x DOT IS_RUNNING OPENPR CLOSEPR {printf("proc_func_call : x EQUAL x DOT IS_RUNNING OPENPR CLOSEPR\n");} 
			   | x DOT SUBMIT_JOBS OPENPR parameter CLOSEPR {printf("proc_func_call : x DOT SUBMIT_JOBS OPENPR parameter CLOSEPR\n");}
			   | x DOT GET_CLOCK_SPEED OPENPR CLOSEPR {printf("proc_func_call : x DOT GET_CLOCK_SPEED OPENPR CLOSEPR\n");} 
			   | RUN OPENPR parameter CLOSEPR {printf("proc_func_call : RUN OPENPR parameter CLOSEPR\n");}
			   | DISCARD_JOB OPENPR x CLOSEPR {printf("proc_func_call : DISCARD_JOB OPENPR x CLOSEPR\n");}
			   ;

mem_func_call : x DOT  GET_AVAILABLE_MEMORY OPENPR CLOSEPR {printf("mem_func_call : x DOT  GET_AVAILABLE_MEMORY OPENPR CLOSEPR\n");}
			  ;

job_func_call : x DOT GET_MEMORY OPENPR CLOSEPR {printf("job_func_call : x DOT GET_MEMORY OPENPR CLOSEPR\n");}
			  ;

obj_constr : x EQUAL class_obj {printf("obj_constr : x EQUAL class_obj\n");}
		   ;

class_obj : processor_obj {printf("class_obj : processor_obj\n");}
		  | mem_obj {printf("class_obj : mem_obj\n");}
		  | job_obj {printf("class_obj : job_obj\n");}
		  | link_obj {printf("class_obj : link_obj\n");}
		  | cluster_obj {printf("class_obj : cluster_obj\n");}
		  ;

processor_obj : PROCESSOR OPENPR ISA EQUAL  isa_type COMMA CLOCK_SPEED COLON n COMMA L1_MEM EQUAL ID1 CLOSEPR {printf("processor_obj\n");}

isa_type : ARM {printf("isa_type : ARM\n");}
		 | AMD {printf("isa_type : AMD\n");}
		 | CDC {printf("isa_type : CDC\n");}
		 | MIPS OPENPR STRING_CONST CLOSEPR {printf("isa_type : MIPS OPENPR STRING_CONST CLOSEPR\n");}
		 ;


mem_obj : MEMORY OPENPR MEMORY_TYPE EQUAL  mem_type COMMA MEM_SIZE EQUAL NUM CLOSEPR {printf(			"mem_obj : MEMORY OPENPR MEMORY_TYPE EQUAL QUOTES mem_type QUOTES\n");}
	    | MEMORY OPENPR MEMORY_TYPE EQUAL QUOTES mem_type QUOTES COMMA MEM_SIZE EQUAL NUM COMMA NAME EQUAL STRING_CONST CLOSEPR {printf("mem_obj : MEMORY OPENPR MEMORY_TYPE EQUAL QUOTES mem_type QUOTES some_extras\n");}
	    ;

mem_type : PRIMARY {printf("mem_type : PRIMARY\n");}
		 | SECONDARY {printf("mem_type : SECONDARY\n");}
		 | CACHE OPENPR STRING_CONST CLOSEPR {printf("mem_type : CACHE OPENPR STRING_CONST CLOSEPR\n");} 
		 ;

link_obj : LINK OPENPR START_POINT EQUAL STRING_CONST COMMA END_POINT EQUAL STRING_CONST COMMA BANDWIDTH EQUAL n COMMA n CLOSEPR {printf("link_obj\n");}
		 ;

job_obj : JOB OPENPR JOB_ID EQUAL NUM COMMA FLOPS_REQUIRED EQUAL n COMMA DEADLINE EQUAL n COMMA MEM_REQUIRED EQUAL NUM COMMA AFFINITY EQUAL OPENSQ float_arr CLOSESQ CLOSEPR  {printf("job_obj");}
		;

float_arr : n COMMA float_arr {printf("float_arr : n COMMA float_arr\n");}
	      | n COMMA n {printf("float_arr : n COMMA n");}
	      ;

n : FLOAT_CONST {printf("n : FLOAT_CONST\n");}
  | NUM {printf("n : NUM\n");}
  ;


cluster_obj : CLUSTER OPENPR PROCESSORS EQUAL ID COMMA TOPOLOGY EQUAL top_type COMMA n COMMA n COMMA NAME EQUAL STRING_CONST CLOSEPR {printf("cluster_obj\n");}
		    | 

top_type : STAR {printf("top_type : STAR\n");}
		 | RING {printf("top_type -> RING\n");}
		 | BUS {printf("top_type : BUS\n");}
		 ; 

parameter : x {printf("parameter : x\n");}
          | OPENSQ var_list CLOSESQ {printf("parameter : OPENSQ var_list CLOSESQ\n");}
          ;

var_list : x more_var {}
		 ;

more_var :  COMMA x {printf("more_var :  COMMA x\n");}
		  | COMMA x more_var {printf("more_var :  COMMA x more_var\n");}
		  ;

expr : ID EQUAL condition {printf("expr : ID EQUAL condition\n");}
	 | ID EQUAL  arithmatic_op {printf("expr : ID EQUAL  arithmatic_op\n");}
	 | condition {printf("expr : condition\n");}
	 ;

condition : arithmatic_op COMPARATOR arithmatic_op {printf("condition : arithmatic_op COMPARATOR arithmatic_op\n");}
		  | UNARY_OP arithmatic_op {printf("condition : UNARY_OP arithmatic_op\n");} 
		  | arithmatic_op UNARY_OP {printf("condition : arithmatic_op UNARY_OP\n");} 
		  ;

arithmatic_op : mul SUM arithmatic_op {printf("arithmatic_op : mul SUM arithmatic_op\n");}
		      | mul {printf("arithmatic_op : mul\n");}
		      ;

mul : factor MULT mul {printf("mul : factor MULT mul\n");}
	| factor {printf("mul : factor\n");}
	;

factor : ID {printf("factor : ID \n");}
	   | OPENPR arithmatic_op OPENPR {printf("factor : OPENPR arithmatic_op OPENPR \n");}
	   | NUM 
	   | FLOAT_CONST
	   ;

x		: VAR {printf("x : VAR \n");}
		| ID1  {printf("x : ID1 \n");}
		;

%%
int main(){
    //yydebug = 1;
    yyparse();
    return 0 ;
}