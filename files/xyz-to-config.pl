#!/usr/bin/perl

use strict;
use warnings;

# line 1: N
$_ = <STDIN>;
my $N = int($_);

# line 2: not needed
$_ = <STDIN>;

my @R;

# atoms
while (<STDIN>) {
    my @toks = split;
    die unless scalar @toks == 4;
    push @R, @toks[1, 2, 3];
}

my $nR = scalar @R;
die unless $nR == 3*$N;

my @box = (22.57, 23.46, 22.12);

# dump CONFIG

printf "generated from an XYZ file\n";
printf "%10i%10i%10i%20.10f\n", 2, 2, 0, 0.0;
printf "%20.10f%20.10f%20.10f\n", $box[0], 0.0, 0.0;
printf "%20.10f%20.10f%20.10f\n", 0.0, $box[1], 0.0;
printf "%20.10f%20.10f%20.10f\n", 0.0, 0.0, $box[2];

for (my $n = 0; $n < $N; ++$n) {
    my $name = ($n % 3 == 0 ? 'OW' : 'HW');
    printf "%-8s%10d\n", $name, $n + 1;
    printf "%20.10g%20.10g%20.10g\n", $R[3*$n], $R[3*$n + 1], $R[3*$n + 2];
    print "        0.0000000000        0.0000000000        0.0000000000\n";
    print "        0.0000000000        0.0000000000        0.0000000000\n";
}
