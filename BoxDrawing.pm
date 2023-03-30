package Text::Unicode::Test::BoxDrawing;

use strict;
use warnings;

use English;
use Error::Pure qw(err);
use List::Util qw(none);
use Readonly;
use Unicode::UTF8 qw(decode_utf8);

# Constants.
Readonly::Scalar our $EMPTY_STR => qw();

our $VERSION = 0.01;

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	return $self;
}

sub list {
	my $self = shift;

	my @drawing_types = sort keys %{$self->_drawing_types};

	return @drawing_types;
}

sub print {
	my ($self, $drawing_type) = @_;

	if (none { $drawing_type eq $_ } $self->list) {
		err "Drawing type '$drawing_type' doesn't exist.";
	}

	return decode_utf8($self->_drawing_types->{$drawing_type});
}

sub print_all {
	my $self = shift;

	my $ret = $EMPTY_STR;
	foreach my $drawing_type ($self->list) {
		$ret .= $self->print($drawing_type);
	}

	return $ret;
}

sub _drawing_types {
	my $self = shift;

	return {
		# From https://en.wikipedia.org/wiki/Template:Box-drawing_sample
		'complex1' => <<'END',
┌───────────────────┐
│  ╔═══╗ Some Text  │▒
│  ╚═╦═╝ in the box │▒
╞═╤══╩══╤═══════════╡▒
│ ├──┬──┤           │▒
│ └──┴──┘           │▒
└───────────────────┘▒
 ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
END

		# From https://www.w3.org/2001/06/utf-8-test/UTF-8-demo.html
		'complex2' => <<'END',
Box drawing alignment tests:                                          █
                                                                      ▉
  ╔══╦══╗  ┌──┬──┐  ╭──┬──╮  ╭──┬──╮  ┏━━┳━━┓  ┎┒┏┑   ╷  ╻ ┏┯┓ ┌┰┐    ▊ ╱╲╱╲╳╳╳
  ║┌─╨─┐║  │╔═╧═╗│  │╒═╪═╕│  │╓─╁─╖│  ┃┌─╂─┐┃  ┗╃╄┙  ╶┼╴╺╋╸┠┼┨ ┝╋┥    ▋ ╲╱╲╱╳╳╳
  ║│╲ ╱│║  │║   ║│  ││ │ ││  │║ ┃ ║│  ┃│ ╿ │┃  ┍╅╆┓   ╵  ╹ ┗┷┛ └┸┘    ▌ ╱╲╱╲╳╳╳
  ╠╡ ╳ ╞╣  ├╢   ╟┤  ├┼─┼─┼┤  ├╫─╂─╫┤  ┣┿╾┼╼┿┫  ┕┛┖┚     ┌┄┄┐ ╎ ┏┅┅┓ ┋ ▍ ╲╱╲╱╳╳╳
  ║│╱ ╲│║  │║   ║│  ││ │ ││  │║ ┃ ║│  ┃│ ╽ │┃  ░░▒▒▓▓██ ┊  ┆ ╎ ╏  ┇ ┋ ▎
  ║└─╥─┘║  │╚═╤═╝│  │╘═╪═╛│  │╙─╀─╜│  ┃└─╂─┘┃  ░░▒▒▓▓██ ┊  ┆ ╎ ╏  ┇ ┋ ▏
  ╚══╩══╝  └──┴──┘  ╰──┴──╯  ╰──┴──╯  ┗━━┻━━┛           └╌╌┘ ╎ ┗╍╍┛ ┋  ▁▂▃▄▅▆▇█
END
		# From https://github.com/couchand/lines-js
		'complex3' => <<'END',
╭─┰───────────────────────────────────┰─╮
┝━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━┥
│ ┃ ╔════════╗                        ┃ │
│ ┃ ║lines-js║                        ┃ │
│ ┃ ╚════════╝                        ┃ │
│ ┠───────────────────────────────────┨ │
│ ┃                                   ┃ │
│ ┃ console line drawing with unicode ┃ │
│ ┃                                   ┃ │
┝━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━┥
╰─╂───────────────────────────────────┸─╯
  ┃
  ┣━╸introduction
  ┣━╸getting started
  ┗━╸documentation
END

		# From https://rosettacode.org/wiki/Visualize_a_tree
		'complex4' => <<'END',
               ┌── Gamma 
       ┌─ Beta ┼── Delta 
       │       └ Epsilon 
 Alpha ┼─ Zeta ───── Eta 
       │       ┌─── Iota 
       └ Theta ┼── Kappa 
               └─ Lambda 
END

		'simple_arc_box' => <<'END',
╭─╮
│ │
╰─╯
END
		'simple_bold_box' => <<'END',
┏━┓	
┃ ┃
┗━┛
END
		'simple_box' => <<'END',
┌─┐
│ │
└─┘
END
		'simple_box_with_crossing' => <<'END',
┌┬┐
├┼┤
└┴┘
END
		# TODO Fix
		'simple_dashed_box' => <<'END',
┌┄┐
┆ ┆
└┄┘
END
		'simple_doubled_box' => <<'END',
╔═╗
║ ║
╚═╝
END
		'simple_doubled_box_vertical' => <<'END',
╓─╖
║ ║
╙─╜
END
		'simple_doubled_box_horizontal' => <<'END',
╒═╕
│ │
╘═╛
END
		'simple_filled_box' => <<'END',
███
███
███
END
		'simple_filled_light_shade_box' => <<'END',
░░░
░░░
░░░
END
		'simple_filled_medium_shade_box' => <<'END',
▒▒▒
▒▒▒
▒▒▒
END
		'simple_filled_dark_shade_box' => <<'END',
▓▓▓
▓▓▓
▓▓▓
END
		# TODO Same or different sizes?
		'squares_small' => <<'END',
■□
END
		# TODO Same or different sizes?
		'squares_big' => <<'END',
▢▣▤▥▦▧▨▩
END
		'spark_horizontal' => <<'END',
▁▂▃▄▅▆▇█
END
		# TODO left and righ version, better output
		'spark_vertical' => <<'END',
█
▉
▊
▋
▌
▍
▎
▏
END
	}
}

1;
