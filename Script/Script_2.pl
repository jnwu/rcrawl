#
# 	Script_2.pl
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w 

use lib $ENV{HOME} .'/workspace/automation';

use strict;
use English;
use warnings;
use feature 'say';

use RCrawl::Framework;

my $start = time();
my $status = RCrawl::Framework->exec("http://ca.yahoo.com", undef, 5);
my $end = time();

#say "status: " . $status . " elapsed: " . ($end - $start);
