/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NUM = 258,
    INT = 259,
    FLOAT = 260,
    FLOAT_CONST = 261,
    STRING = 262,
    STRING_CONST = 263,
    BOOL = 264,
    DEL = 265,
    ID = 266,
    COMPARATOR = 267,
    CLOSESQ = 268,
    OPENSQ = 269,
    OPENBR = 270,
    CLOSEBR = 271,
    OPENPR = 272,
    ID1 = 273,
    PROCESSORS = 274,
    CLOSEPR = 275,
    EQUAL = 276,
    QUOTES = 277,
    COMMA = 278,
    COLON = 279,
    DOT = 280,
    FOR = 281,
    WHILE = 282,
    IF = 283,
    ELSE = 284,
    IS_RUNNING = 285,
    SUBMIT_JOBS = 286,
    GET_CLOCK_SPEED = 287,
    DISCARD_JOB = 288,
    JOB_ID = 289,
    GET_AVAILABLE_MEMORY = 290,
    GET_MEMORY = 291,
    MEM_SIZE = 292,
    VAR = 293,
    PROCESSOR = 294,
    ISA = 295,
    CLOCK_SPEED = 296,
    L1_MEM = 297,
    ARM = 298,
    AMD = 299,
    CDC = 300,
    MIPS = 301,
    MEMORY = 302,
    MEMORY_TYPE = 303,
    MEMORY_SIZE = 304,
    PRIMARY = 305,
    SECONDARY = 306,
    CACHE = 307,
    LINK = 308,
    START_POINT = 309,
    END_POINT = 310,
    BANDWIDTH = 311,
    JOB = 312,
    FLOPS_REQUIRED = 313,
    DEADLINE = 314,
    MEM_REQUIRED = 315,
    AFFINITY = 316,
    RUN = 317,
    WAIT = 318,
    CLUSTER = 319,
    TOPOLOGY = 320,
    NAME = 321,
    STAR = 322,
    RING = 323,
    BUS = 324,
    SUM = 325,
    MULT = 326,
    UNARY_OP = 327
  };
#endif
/* Tokens.  */
#define NUM 258
#define INT 259
#define FLOAT 260
#define FLOAT_CONST 261
#define STRING 262
#define STRING_CONST 263
#define BOOL 264
#define DEL 265
#define ID 266
#define COMPARATOR 267
#define CLOSESQ 268
#define OPENSQ 269
#define OPENBR 270
#define CLOSEBR 271
#define OPENPR 272
#define ID1 273
#define PROCESSORS 274
#define CLOSEPR 275
#define EQUAL 276
#define QUOTES 277
#define COMMA 278
#define COLON 279
#define DOT 280
#define FOR 281
#define WHILE 282
#define IF 283
#define ELSE 284
#define IS_RUNNING 285
#define SUBMIT_JOBS 286
#define GET_CLOCK_SPEED 287
#define DISCARD_JOB 288
#define JOB_ID 289
#define GET_AVAILABLE_MEMORY 290
#define GET_MEMORY 291
#define MEM_SIZE 292
#define VAR 293
#define PROCESSOR 294
#define ISA 295
#define CLOCK_SPEED 296
#define L1_MEM 297
#define ARM 298
#define AMD 299
#define CDC 300
#define MIPS 301
#define MEMORY 302
#define MEMORY_TYPE 303
#define MEMORY_SIZE 304
#define PRIMARY 305
#define SECONDARY 306
#define CACHE 307
#define LINK 308
#define START_POINT 309
#define END_POINT 310
#define BANDWIDTH 311
#define JOB 312
#define FLOPS_REQUIRED 313
#define DEADLINE 314
#define MEM_REQUIRED 315
#define AFFINITY 316
#define RUN 317
#define WAIT 318
#define CLUSTER 319
#define TOPOLOGY 320
#define NAME 321
#define STAR 322
#define RING 323
#define BUS 324
#define SUM 325
#define MULT 326
#define UNARY_OP 327

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
