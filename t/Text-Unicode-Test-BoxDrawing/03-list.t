use strict;
use warnings;

use Text::Unicode::Test::BoxDrawing;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
my $obj = Text::Unicode::Test::BoxDrawing->new;
my @ret = $obj->list;
is_deeply(
	\@ret,
	[
		'braille_hello_world',
		'braille_mapping',
		'complex1',
		'complex2',
		'complex3',
		'complex4',
		'simple_arc_box',
		'simple_bold_box',
		'simple_box',
		'simple_box_with_crossing',
		'simple_dashed_box',
		'simple_doubled_box',
		'simple_doubled_box_horizontal',
		'simple_doubled_box_vertical',
		'simple_filled_box',
		'simple_filled_dark_shade_box',
		'simple_filled_light_shade_box',
		'simple_filled_medium_shade_box',
		'spark_horizontal',
		'spark_vertical',
		'squares_big',
		'squares_small',
	],
	'Sorted list of drawing types.',
);
