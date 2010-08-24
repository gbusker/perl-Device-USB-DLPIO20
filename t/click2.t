# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Device-USB-Relay.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 3;
BEGIN { use_ok('Device::USB::DLP-IO20') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

for (my $port=1; $port<=8; $port++) {
  relay_on($port);
}
ok(1,"Relays on");
sleep 1;
for (my $port=1; $port<=8; $port++) {
  relay_off($port);
};
ok(1,"Relays off");
