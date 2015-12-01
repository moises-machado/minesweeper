# MineSweeper
An exercise from the Programming Chalenges book in Perl 6

It takes input from the standard input in the format:

2 4
..*.
*...
2 1
*
.
0 0

the numbers i j indicate a minefield ixj, "*" means mine and "." means safe and if i = j = 0 means end of input.
Then prints:

Field #1:
12*1
*211

Field #2:
*
1

where the numbers in the field indicate the number of mines in the 8 field vicinity.

It doesn't check for malformed input. Trying to code in a Perl6ish way.
