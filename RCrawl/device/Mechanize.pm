#
#	Mechanize.pm
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w

package lib::device::Mechanize;

use strict;
use English;
use WWW::Mechanize;

use lib::device::Device;

my $singleton;

sub new {
	my $class = shift;
	$singleton ||= bless(lib::device::Device->new(), $class);
	
#	my $url = 'http://www.google.com';
#	my $mech = WWW::Mechanize->new();
#	$mech->get($url);

	return $singleton;
}

1;