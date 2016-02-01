use v6;

module MineSweeper {

	sub sweep(@minefield, Int $rows = @minefield.elems, Int $cols = @minefield[0].chars) is export {
		my @padded = [0 xx $cols+2] xx $rows+2;
		@padded[1..$rows;1..$cols] = flat @minefield.map: *.trans('*.' => '10').comb;

		my @hints; # Should end up same size as @minefield
		for ^$rows X ^$cols -> ($i, $j) {
			if @padded[$i+1][$j+1] == 1 { # ($i|$j) +1 due to padding
				@hints[$i][$j] = '*'; # Mines remains as stars
			} else {
				@hints[$i][$j] = [+] @padded[$i..$i+2;$j..$j+2]; # Sums number of mines around the cell and $i..$i+2 for padding
			}
		}
		@hints>>.join(''); # Revert to array of strings instead of a matrix
	}

}

sub MAIN {
	import MineSweeper;

	my $field = 0;
	loop {
		my ($rows, $cols) = get().split(" ").map: +*;
		die "$rows and $cols must be >= 0" if $rows < 0 || $cols < 0;
		exit if $rows == 0 || $cols == 0;

		my @minefield = lines()[^$rows];
		die "Must have at least $rows lines in the field" unless @minefield.elems == $rows;
		die "$cols '*' or '.' as lines" unless [&&] @minefield.map: * ~~ /^ <[*.]> **{$cols} $/;

		$field++;
		say "Field #$field:";
		say sweep(@minefield,$rows, $cols).join("\n"), "\n";
	}
}
