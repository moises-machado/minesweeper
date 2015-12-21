use v6;
use lib 'lib';
use Test;

use-ok "MineSweeper";
use MineSweeper;

is sweep(['*']), ['*'], "A mine is a mine is mine";
is sweep(['.'],), ['0'], "Empty 1x1 field";
is sweep(['*.', '..']), ['*1','11'], "One mine 2x2 field";
is sweep(['*.', '*.']), ['*2','*2'], "Two mines 2x2 field";
is sweep(['**.', '.*.', '...']), ['**2', '3*2', '111'], "Three mines 3x3 field";
is sweep(['**.', '.*.']), ['**2', '3*2'], "Three mines 2x3 field";
is sweep(['**', '.*', '..']), ['**', '3*', '11'], "Three mines 3x2 field";
is sweep(['*...', '....', '.*..', '....']), ['*100', '2210', '1*10', '1110'], "Two mines 4x4 field, the book exemple";

is sweep(['*'],1,1), ['*'], "A mine is a mine is mine with dimensions";
is sweep(['.'],1,1), ['0'], "Empty 1x1 field with dimensions";
is sweep(['*.', '..'],2,2), ['*1','11'], "One mine 2x2 field with dimensions";
is sweep(['*.', '*.'],2,2), ['*2','*2'], "Two mines 2x2 field with dimensions";
is sweep(['**.', '.*.', '...'],3,3), ['**2', '3*2', '111'], "Three mines 3x3 field with dimensions";
is sweep(['**.', '.*.'],2,3), ['**2', '3*2'], "Three mines 2x3 field with dimensions";
is sweep(['**', '.*', '..'],3,2), ['**', '3*', '11'], "Three mines 3x2 field with dimensions";
is sweep(['*...', '....', '.*..', '....'],4,4), ['*100', '2210', '1*10', '1110'], "Two mines 4x4 field, the book exemple with dimensions";

done-testing;
