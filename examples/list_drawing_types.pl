#!/usr/bin/env perl

use strict;
use warnings;

use Text::Unicode::Test::BoxDrawing;

# Object.
my $obj = Text::Unicode::Test::BoxDrawing->new;

# Get list.
my @drawing_types = $obj->list;

# Print out.
print join "\n", @drawing_types;
print "\n";

# Output:
# complex1
# complex2
# complex3
# complex4
# simple_arc_box
# simple_bold_box
# simple_box
# simple_box_with_crossing
# simple_dashed_box
# simple_doubled_box
# simple_doubled_box_horizontal
# simple_doubled_box_vertical
# simple_filled_box
# simple_filled_dark_shade_box
# simple_filled_light_shade_box
# simple_filled_medium_shade_box
# spark_horizontal
# spark_vertical
# squares_big
# squares_small