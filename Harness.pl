#
# 	Harness.pl
#
#	Jack Wu <jack.wu@live.ca>						
#

#!/usr/bin/perl -w

use lib $ENV{HOME} .'/workspace/automation';

use strict;
use English;
use warnings;
use TAP::Harness::JUnit;

use feature 'say';
use Cwd 'abs_path';

use RCrawl::Scheduler;

# get current directory
my @scripts;
my $directory = abs_path($0);
$directory = substr($directory, 0, rindex($directory, "/"));

# get scripts in Script/
opendir (DIR, $directory."/Script") or die $!;
while (my $file = readdir(DIR)) {
	next if($file eq "." || $file eq "..");

	push(@scripts, $file);
}

# reorder scripts based on passed percentage and test duration
RCrawl::Scheduler->schedule(\@scripts);
@scripts = map{"Script/" . $_ } @scripts;

# init harness
#
# output xml naming format
# output_yyyy_mm_dd__hh_mm_ss.xml
my $harness = TAP::Harness::JUnit->new({
	verbosity 	=> 	1,
    xmlfile 	=> 	'Result/junit_output.xml',
	merge 		=> 	'true',
});  

#$harness->runtests(@scripts);


