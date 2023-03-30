use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Unicode Box Drawing testing class.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0;
author_requires 'FindBin' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Text-Unicode-Test-BoxDrawing';
readme_from 'BoxDrawing.pm';
recursive_author_tests('xt');
requires 'English' => 0;
requires 'Error::Pure' => 0;
requires 'List::Util' => 1.33;
requires 'Readonly' => 0;
requires 'Unicode::UTF8' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Text-Unicode-Test-BoxDrawing/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/Text-Unicode-Test-BoxDrawing';
resources 'repository' => 'git://github.com/michal-josef-spacek/Text-Unicode-Test-BoxDrawing';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
