#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

my @batteries;
open(my $acpi, "acpi -b 2>/dev/null |") or die;

while (my $line = <$acpi>) {
    if ($line =~ /Battery \d+: ([\w\s]+), (\d+)%.*?(\d\d:\d\d:\d\d)?/) {
        push @batteries, {
            status  => $1,
            percent => $2,
            time    => $3
        };
    }
}
close($acpi);

exit(0) unless @batteries;
my ($bat) = sort { $b->{percent} <=> $a->{percent} } @batteries;

my $status  = $bat->{status};
my $percent = $bat->{percent};
my $time    = $bat->{time};
my $full_text = "$percent%";

if ($status eq 'Discharging') {
    $full_text .= ' DIS';
} elsif ($status eq 'Charging') {
    $full_text .= ' CHR';
} elsif ($status eq 'Unknown') {
    open(my $ac_adapter, "acpi -a |") or die;
    my $ac_adapt = <$ac_adapter>;
    close($ac_adapter);
    if ($ac_adapt =~ /: ([\w-]+)/) {
        $full_text .= $1 eq 'on-line' ? ' CHR' : ' DIS';
    }
}

$full_text .= " ($1)" if defined $time && $time =~ /(\d\d:\d\d)/;

my $short_text = $full_text;

print "$full_text\n$short_text\n";

if ($status eq 'Discharging' && $percent < 15) {
    print "#FF0000\n";
} else {
    print "#dd9999\n";
}
exit(0);
