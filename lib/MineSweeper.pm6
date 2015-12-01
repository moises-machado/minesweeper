use v6;
module MineSweeper {

	sub sweep(@minefield) is export {
		my @padded = @minefield.map( -> $line {
			[0].append( $line.trans('*.' => '10').comb ).append(0); # Translating to 0 and 1 and padding edges
		});
		@padded.unshift(0 xx @padded[0].elems).push(0 xx @padded[0].elems); # Padding edges with rows of zeroes

		my @hints = [0 xx @minefield[0].chars] xx @minefield.elems; # Zero filled matrix same size as @minefield
		for @hints.keys X @hints[0].keys -> ($i, $j) { # Only works if each row is the same size
			if @padded[$i+1][$j+1] == 1 { # +1 due to padding
				@hints[$i][$j] = '*'; # Mines remains as stars
			} else {
				@hints[$i][$j] = [+] @padded[$i..$i+2].map({[+] $_[$j..$j+2]}); # Sums number of mines around the cell and $i..$i+2 for padding
			}
		}
		@hints.map: *.join(''); # Revert to array of strings instead of a matrix
	}

}

sub MAIN {
	import MineSweeper;

	my $field = 0;
	loop {
		my ($rows, $cols) = get().split(" ");
		exit if $rows == "0";

		$field++;
		say "Field #$field:";
		say sweep(lines()[^$rows]).join("\n"), "\n";
	}
}