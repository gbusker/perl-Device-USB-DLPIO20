package Device::USB::DLPIO20;

use 5.010000;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(
);
use Carp;

our $VERSION = '0.01';

our %portmap = (
    AN0 => 0,
    AN1 => 1,
    AN2 => 2,
    AN3 => 3,
    AN4 => 4,
    AN5 => 5,
    AN6 => 6,
    AN7 => 7,
    AN8 => 8,
    AN9 => 9,
    AN10 => 10,
    AN11 => 11,
    AN12 => 12
    AN13 => 13,
    RA4 => 14,
    P5 => 15
    P6 => 16,
    P7 => 17,
    RB7 => 18,
    RB6 => 19
);

sub ping
{
    # Ping device; return 1 if expected return code 0x59
    output("\x27");
    input() == x59;
}

sub led_flash
{
    output("\x28");
}

sub led_on
{
    output("\x29\x00");
}

sub led_off
{
    output("\x29\x00");
}

sub relay_set
{
    my $rly = shift || 1;
    output("\x30".chr($rly)."\x00");
}

sub relay_reset
{
    my $rly = shift || 1;
    output("\x30".chr($rly)."\x01");
}

sub digital_input
{
    my $port = shift;
    if (  defined $portmap{$port} ) {
	output("\x35",chr($portmap{$port}),"\x01\x00");
    }
    else {
	die "digital_input - unknown port: $port";
    }
}

sub digital_output
{
    my $port = shift;
    my $high = shift;
    
    if (  defined $portmap{$port} ) {
	if ($set) {
	    output("\x35".chr($portmap{$port})."\x00\x01");
	} else {
	    output("\x35".chr($portmap{$port})."\x00\x00");
	}
    }
    else {
	die "digital_input - unknown port: $port";
    }
}

# counter functions (x36 and x37) not implemented




# Lib functions (not exported)

sub output
{
    my $cmd = shift;
    my $len = length($cmd);
    
    print TTY chr($len+1),$cmd;
}

sub input
{
    # Read port
    # Timeout 1 sec or so
}


1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Device::USB::DLPIO20 - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Device::USB::DLPIO20;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Device::USB::DLPIO20

Blah blah blah.

=head2 EXPORT

None by default.

=head1 AUTHOR

Gerd, E<lt>busker@busker.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Gerd Busker

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.


=cut
