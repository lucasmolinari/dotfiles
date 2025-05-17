#!/usr/bin/perl
use strict;
use warnings;

my $sink = '@DEFAULT_AUDIO_SINK@';

my $output = `wpctl get-volume $sink 2>/dev/null`;
chomp $output;

my ($vol) = $output =~ /Volume:\s*([\d.]+)/;
my $muted = ($output =~ /\[MUTED\]/) ? 1 : 0;

$vol = defined $vol ? int($vol * 100) : 0;

if ($muted) {
    print "muted ($vol%)\n";
} else {
    print "$vol%\n";
}
