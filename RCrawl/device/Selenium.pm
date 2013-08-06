#
#	Selenium.pm
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w

package lib::device::Selenium;

use strict;
use English;
use Test::WWW::Selenium;

use lib::device::Device;

my $singleton;

sub new {
	
	my $class = shift;
	$singleton ||= bless(lib::device::Device->new(), $class);

#	my $sel = Test::WWW::Selenium->new( host => "localhost", 
#                                    port => 4444, 
#                                    browser => "*firefox", 
#                                    browser_url => "http://www.google.com" );
#
#	$sel->open("http://www.google.com");

	return $singleton;
}

1;