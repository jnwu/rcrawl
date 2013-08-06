#
#	Scheduler.pm
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w

package RCrawl::Scheduler;

use lib $ENV{HOME} .'/workspace/automation';

use strict;
use warnings;
use English;

use feature 'say';

use RCrawl::Logger;

sub schedule {
	shift;

	my($scripts_ref) = @ARG;
	return if(scalar(@$scripts_ref) le 1);

	foreach (@$scripts_ref) {
		my $data_ref = RCrawl::Logger->get("Script.xml", ["script", $_]);
		say $data_ref->{'count'};
	}
}

1;

