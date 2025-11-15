:
:  Test Script for MCO1 (Convex Hull) for the SLOW algorithm implementation (main1.c)
:
:  Usage:  TESTSLOW GROUPNUMBER
:           
:          where GROUPNUMBER is the student's group number.
:
:  For example:
:
:          TESTSLOW 01
:
:          will do a black box test for Group #1
:
PROMPT $g

:
: For the MCO1 demo, assume that:
: 1. student has compiled main1.c (slow algo) and main2.c (SLOW algo) and produced the corresponding exe files.
: 2. the exe files were named as main1.exe and main2.exe respectively
:
: delete possible garbage data (to avoid possible problems on a repeat run)
DEL *SLOW?-OUTPUT?.TXT
DEL *BBTEST-SLOW?.TXT

:
: run main1.exe (SLOW algo exe file)
:
main1 < SLOW1.TXT
main1 < SLOW2.TXT
main1 < SLOW3.TXT
main1 < SLOW4.TXT
main1 < SLOW5.TXT

:
: rename the files by attaching the GROUPNUMBER represented by command line parameter %1
:
if exist SLOW1-OUTPUT.TXT REN SLOW1-OUTPUT.TXT %1-SLOW1-OUTPUT.TXT
if exist SLOW2-OUTPUT.TXT REN SLOW2-OUTPUT.TXT %1-SLOW2-OUTPUT.TXT
if exist SLOW3-OUTPUT.TXT REN SLOW3-OUTPUT.TXT %1-SLOW3-OUTPUT.TXT
if exist SLOW4-OUTPUT.TXT REN SLOW4-OUTPUT.TXT %1-SLOW4-OUTPUT.TXT
if exist SLOW5-OUTPUT.TXT REN SLOW5-OUTPUT.TXT %1-SLOW5-OUTPUT.TXT

:
: compare the expected output text file with the student's output text file via bbtest.exe
: the comparison results are stored in %1-BBTEST* files via output redirection
:
gcc -Wall bbtest.c -o bbtest.exe
bbtest EXPECTED1-TRIANGLE.TXT  %1-SLOW1-OUTPUT.TXT > %1-BBTEST-SLOW1.TXT
bbtest EXPECTED2-SQUARE.TXT    %1-SLOW2-OUTPUT.TXT > %1-BBTEST-SLOW2.TXT
bbtest EXPECTED3-CIRCLE.TXT    %1-SLOW3-OUTPUT.TXT > %1-BBTEST-SLOW3.TXT
bbtest EXPECTED4-COLLINEAR.TXT %1-SLOW4-OUTPUT.TXT > %1-BBTEST-SLOW4.TXT
bbtest EXPECTED5-2R15.TXT      %1-SLOW5-OUTPUT.TXT > %1-BBTEST-SLOW5.TXT

:
: repeat the above, but this time without output redirection to display/see results on screen
:
bbtest EXPECTED1-TRIANGLE.TXT  %1-SLOW1-OUTPUT.TXT 
bbtest EXPECTED2-SQUARE.TXT    %1-SLOW2-OUTPUT.TXT 
bbtest EXPECTED3-CIRCLE.TXT    %1-SLOW3-OUTPUT.TXT 
bbtest EXPECTED4-COLLINEAR.TXT %1-SLOW4-OUTPUT.TXT 
bbtest EXPECTED5-2R15.TXT      %1-SLOW5-OUTPUT.TXT 

:
: do a diff to display only the Differences value
:
gcc -Wall diff.c -o diff.exe
diff EXPECTED1-TRIANGLE.TXT  %1-SLOW1-OUTPUT.TXT 
diff EXPECTED2-SQUARE.TXT    %1-SLOW2-OUTPUT.TXT 
diff EXPECTED3-CIRCLE.TXT    %1-SLOW3-OUTPUT.TXT 
diff EXPECTED4-COLLINEAR.TXT %1-SLOW4-OUTPUT.TXT 
diff EXPECTED5-2R15.TXT      %1-SLOW5-OUTPUT.TXT 


PROMPT

