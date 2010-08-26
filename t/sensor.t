# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Device-USB-Relay.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 3;
BEGIN { use_ok('Device::USB::DLPIO20') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.


init; ok(1);
my $serial = sensor_detect('AN1');
my @s =
map(ord, split(//, $serial));
printf("%x%x%x%x%x%x%x%x\n", @s);
ok(1);

