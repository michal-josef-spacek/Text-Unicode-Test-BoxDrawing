use strict;
use warnings;

use Text::Unicode::Test::BoxDrawing;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Text::Unicode::Test::BoxDrawing::VERSION, 0.01, 'Version.');
