:
:  Test Script for BONUS problem MCO2 (Undirected Graph)
:
:  Usage:  TESTBONUS <Group #>
:  Example:  TESTBONUS 01
:
ECHO OFF
PROMPT %1$G
gcc -Wall bbtest.c -o bbtest.exe
gcc -Wall diff.c -o diff.exe

:
: For the MCO2 demo, assume that:
: 1. student has compiled bonus.c without any syntax error
: 2. the exe file was (RE)named as %1-bonus.exe where %1 is the Group #
:
: delete possible garbage data (to avoid possible problems on a repeat run)
IF EXIST *SUBGRAPH.TXT DEL *-SUBGRAPH.TXT
IF EXIST *RESULT*.TXT DEL *RESULT*.TXT

ECHO OFF
:
: run %1-bonus.exe for the 6 test cases, TEST1*.TXT to TEST6*.TXT contains the names of the input files
:
%1-BONUS < TEST1-G-F.TXT
%1-BONUS < TEST2-F-G.TXT
%1-BONUS < TEST3-G-H.TXT
%1-BONUS < TEST4-H-G.TXT
%1-BONUS < TEST5-G-K.TXT
%1-BONUS < TEST6-K-G.TXT

: do a bbtest
BBTEST EXPECTED1-G-F.TXT  G-F-SUBGRAPH.TXT > %1-RESULT-TEST1-G-F.TXT
BBTEST EXPECTED2-F-G.TXT  F-G-SUBGRAPH.TXT > %1-RESULT-TEST2-F-G.TXT
BBTEST EXPECTED3-G-H.TXT  G-H-SUBGRAPH.TXT > %1-RESULT-TEST3-G-H.TXT
BBTEST EXPECTED4-H-G.TXT  H-G-SUBGRAPH.TXT > %1-RESULT-TEST4-H-G.TXT
BBTEST EXPECTED5-G-K.TXT  G-K-SUBGRAPH.TXT > %1-RESULT-TEST5-G-K.TXT
BBTEST EXPECTED6-K-G.TXT  K-G-SUBGRAPH.TXT > %1-RESULT-TEST6-K-G.TXT

: do a diff test 
ECHO ON

ECHO *** BONUS BLACK BOX TEST RESULTS ***
diff EXPECTED1-G-F.TXT  G-F-SUBGRAPH.TXT 

diff EXPECTED2-F-G.TXT  F-G-SUBGRAPH.TXT 

diff EXPECTED3-G-H.TXT  G-H-SUBGRAPH.TXT 

diff EXPECTED4-H-G.TXT  H-G-SUBGRAPH.TXT 

diff EXPECTED5-G-K.TXT  G-K-SUBGRAPH.TXT 

diff EXPECTED6-K-G.TXT  K-G-SUBGRAPH.TXT 

PROMPT


