#
#	LWP.pm
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w

package lib::device::LWP;

use strict;
use English;
use LWP;

use lib::device::Device;

my $singleton;

sub new {	
	my $class = shift;
	$singleton ||= bless(lib::device::Device->new(), $class);
	
	return $singleton;
}

1;