# MineSweeper
An exercise from the Programming Challenges 2002 book in Perl 6

It takes input from the standard input in the format:

```
2 4
..*.
*...
2 1
*
.
0 0
```

the numbers i j indicate a minefield ixj, "*" means mine and "." means safe and if i = j = 0 means end of input.
Then prints:

```
Field #1:
12*1
*211

Field #2:
*
1
```

where the numbers in the field indicate the number of mines in the 8 field vicinity.

It check for malformed input. Trying to code in a Perl6ish way.

## Usage

I separated the functions in the sub sweep and the MAIN body. The MAIN sub process the input, sends to the sweep sub that does the heavy lifting then handles the output. So you can run the MineSweeper.pm6 file as a script as:

```
perl6 MineSweeper.pm6 < testfile.txt
```

or import the module and call the sweep sub with the minefield as an array of strings:

```
import MineSweeper;
sweep(["..","*."]);
```
