#
#	Framework.pm
#
#	Jack Wu <jack.wu@live.ca>
#

#!/usr/bin/perl -w

package RCrawl::Framework;

use strict;
use warnings;
use feature 'say';
use English;
use Test::WWW::Selenium;

use constant TIMEOUT => 2000;
use constant PAGE => 3;

use constant HOST => "localhost";
use constant PORT => 4444;
use constant BROWSER => "*firefox";

my @_queue;
my %_hash;
my $_count;
my $_xml;
my $_base;
my $_sel;

#
#	exec
#
#	start crawls from $url
#	
sub exec {

	shift;
	my ($url, $xml, $count) = @ARG;

	$_xml = $xml;	
	$_count = $count unless(defined($count) && $count le 0);

	if($url =~ m/http:\/\/(.+)/) {
		$_base = $1;
		$_base = chop($_base) if($_base =~ m/\/$/);
	} else {
		die "error: no link provided\n";
	}

	$_sel = Test::WWW::Selenium->new(	host 		=> HOST, 
                                  		port 		=> PORT, 
                                   		browser 	=> BROWSER, 
                                   		browser_url => $url );

	$_sel->start();
	push(@_queue, $url);

	_do_exec();
	$_sel->stop();

	return 0 if($@);
	return 1;
}

#
#	_do_exec
#
#	recursive crawls from $url
#	
sub _do_exec {

	if(defined($_count)) {
		return if($_count eq 0);
		$_count--;
	}

	my $url = shift(@_queue);
	$_hash{$url}++;

	# trim trailing slash
	$url = chop($url) if($url =~ m/\/$/);

	# finds the next url that is starts with 'http' and not 'https' and has not
	# been navigated already
	while($_hash{$url} > 1) {
		$url = shift(@_queue);
		return unless(defined($url));

		$url = chop($url) if($url =~ m/\/$/);
		$_hash{$url}++;
	}

	# exit if link is unreacheable
	eval {
		$_sel->open($url);
		$_sel->wait_for_page_to_load(TIMEOUT);
	};
	return if($@);

	my $html = $_sel->get_html_source();

	# only traverse to child domain pages
	my $pattern = "a href=\"http:\/\/$_base(\/.+?)\"";
	my @links = ($html =~ m/$pattern/g);
	push(@_queue, @links);

	$pattern = "a href=\"(\/[^\"]+?)\"";
	@links = ($html =~ m/$pattern/g);
	push(@_queue, @links);

	sleep(1);
	_do_exec();
}

1;