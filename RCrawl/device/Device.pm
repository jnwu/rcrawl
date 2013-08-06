#
#	Device.pm
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w

package lib::device::Device;

use strict;
use English;

sub new {
	
	my $class = shift;
	my $self = {};

	bless ($self, $class);
	return $self;
}

1;