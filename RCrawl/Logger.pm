#
#	Logger.pm
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w

package RCrawl::Logger;

use strict;
use warnings;
use English;
use XML::Simple;
use Data::Dumper;

use feature 'say';
use Cwd 'abs_path';

my $_xml;
my $_directory = abs_path($0);
$_directory = substr($_directory, 0, rindex($_directory, "/"));

sub get {
	shift;
	my($file, $keys_ref, $data) = @ARG;

	$_xml = XML::Simple->new() unless(defined($_xml));

	eval {
		$data = $_xml->XMLin($_directory . "/" . "XML/" . $file);

		foreach (@$keys_ref) {
			$data = $data->{$_};
		}
	};
	die $@ if $@;

	return $data;
}

sub put {
	shift;
	my($xml, $keys_ref, $value) = @ARG;

}

1;

