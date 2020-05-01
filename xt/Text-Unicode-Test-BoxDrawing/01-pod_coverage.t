use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Text::Unicode::Test::BoxDrawing', 'Text::Unicode::Test::BoxDrawing is covered.');
