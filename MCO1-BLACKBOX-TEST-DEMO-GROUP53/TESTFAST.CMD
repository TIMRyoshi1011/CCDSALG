:
:  Test Script for MCO1 (Convex Hull) for the FAST algorithm implementation (main2.c)
:
:  Usage:  TESTFAST GROUPNUMBER
:           
:          where GROUPNUMBER is the student's group number.
:
:  For example:
:
:          TESTFAST 01
:
:          will do a black box test for Group #1
:
PROMPT $g

:
: For the MCO1 demo, assume that:
: 1. student has compiled main1.c (slow algo) and main2.c (fast algo) and produced the corresponding exe files.
: 2. the exe files were named as main1.exe and main2.exe respectively
:
: delete possible garbage data (to avoid possible problems on a repeat run)
DEL *FAST?-OUTPUT.TXT
DEL *BBTEST-FAST?.TXT

:
: run main2.exe (fast algo exe file)
:
main2 < FAST1.TXT
main2 < FAST2.TXT
main2 < FAST3.TXT
main2 < FAST4.TXT
main2 < FAST5.TXT

:
: rename the files by attaching the GROUPNUMBER represented by command line parameter %1
:
if exist FAST1-OUTPUT.TXT REN FAST1-OUTPUT.TXT %1-FAST1-OUTPUT.TXT
if exist FAST2-OUTPUT.TXT REN FAST2-OUTPUT.TXT %1-FAST2-OUTPUT.TXT
if exist FAST3-OUTPUT.TXT REN FAST3-OUTPUT.TXT %1-FAST3-OUTPUT.TXT
if exist FAST4-OUTPUT.TXT REN FAST4-OUTPUT.TXT %1-FAST4-OUTPUT.TXT
if exist FAST5-OUTPUT.TXT REN FAST5-OUTPUT.TXT %1-FAST5-OUTPUT.TXT

:
: compare the expected output text file with the student's output text file via bbtest.exe
: the comparison results are stored in %1-BBTEST* files via output redirection
:
gcc -Wall bbtest.c -o bbtest.exe
bbtest EXPECTED1-TRIANGLE.TXT  %1-FAST1-OUTPUT.TXT > %1-BBTEST-FAST1.TXT
bbtest EXPECTED2-SQUARE.TXT    %1-FAST2-OUTPUT.TXT > %1-BBTEST-FAST2.TXT
bbtest EXPECTED3-CIRCLE.TXT    %1-FAST3-OUTPUT.TXT > %1-BBTEST-FAST3.TXT
bbtest EXPECTED4-COLLINEAR.TXT %1-FAST4-OUTPUT.TXT > %1-BBTEST-FAST4.TXT
bbtest EXPECTED5-2R15.TXT      %1-FAST5-OUTPUT.TXT > %1-BBTEST-FAST5.TXT

:
: repeat the above, but this time without output redirection to display/see results on screen
:
bbtest EXPECTED1-TRIANGLE.TXT  %1-FAST1-OUTPUT.TXT 
bbtest EXPECTED2-SQUARE.TXT    %1-FAST2-OUTPUT.TXT 
bbtest EXPECTED3-CIRCLE.TXT    %1-FAST3-OUTPUT.TXT 
bbtest EXPECTED4-COLLINEAR.TXT %1-FAST4-OUTPUT.TXT 
bbtest EXPECTED5-2R15.TXT      %1-FAST5-OUTPUT.TXT 

:
: do a diff to display only the Differences value
:
gcc -Wall diff.c -o diff.exe
diff EXPECTED1-TRIANGLE.TXT  %1-FAST1-OUTPUT.TXT 
diff EXPECTED2-SQUARE.TXT    %1-FAST2-OUTPUT.TXT 
diff EXPECTED3-CIRCLE.TXT    %1-FAST3-OUTPUT.TXT 
diff EXPECTED4-COLLINEAR.TXT %1-FAST4-OUTPUT.TXT 
diff EXPECTED5-2R15.TXT      %1-FAST5-OUTPUT.TXT 

PROMPT

