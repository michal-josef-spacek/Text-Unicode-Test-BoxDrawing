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

# Output like:
# TODO