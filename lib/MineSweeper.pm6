use v6;
module MineSweeper {

	sub sweep(@minefield) is export {
		my @padded = @minefield.map( {
			[.trans('*.' => '10').comb] # Translating to Array of 0s and 1s
			.unshift(0).push(0); # Padding edges
		});
		@padded.unshift(0 xx @padded[0].elems).push(0 xx @padded[0].elems); # Padding edges with rows of zeroes

		my @hints; # Should end up same size as @minefield
		for @minefield.keys X ^@minefield[0].chars -> ($i, $j) { # Only works if each row is the same size
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