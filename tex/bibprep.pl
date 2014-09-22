#!/usr/bin/perl

use strict;
use warnings;

my $inFilename = $ARGV[0];
my @fileContents = [];
my $i = 1;
my $newItem = 0;
my $name = "";

open(inFile, "<", $inFilename) or die "Cannot open file $inFilename\n";
while(<inFile>) {
	chomp;
	if ( (not $newItem) && m/\\bibitem\[\{(\w+)/) {
		$name = $1;
		$newItem = 1;
	} elsif($newItem && s/^$name/$i\. \\newline $name/) {
		$i++;
		$newItem = 0;
		$name = ""
	}
	push (@fileContents, $_);
}
close(inFile);

open(inFile, ">", $inFilename) or die "Cannot open file $inFilename\n";
foreach (@fileContents) {
	print inFile "$_\n";
}