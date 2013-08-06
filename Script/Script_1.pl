#
# 	Script_1.pl
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
my $status = RCrawl::Framework->exec("http://www.translink.ca", undef);
my $end = time();

#say "status: " . $status . " elapsed: " . ($end - $start);
