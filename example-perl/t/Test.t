use strict;
use warnings;

use Test::More;
BEGIN { use_ok('Test') };

my $int = Test::new_int(42);
ok $int, 'made int';
is $int->Test::get_text, '42', 'got int text';

my $str = Test::new_str("OH HAI");
ok $str, 'made str';
is $str->Test::get_text, 'OH HAI', 'got str text';

# $str->Test::print_text;

done_testing;
