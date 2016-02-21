#!/usr/bin/perl -w
use strict;
use warnings;
use IO::Socket;

my ( $host, $port, $kidpid, $handle, $line, $l );
$| = 1;

( $host, $port ) = ('192.168.2.120',7777);
$handle = IO::Socket::INET->new(
    Proto    => "tcp",
    PeerAddr => $host,
    PeerPort => $port
  )
  or die "can't connect to port $port on $host: $!";

print STDERR "[Connected to $host:$port]\n";

while ( defined( $line = <STDIN> ) ) {
    SendToSocket($line);
}

sub SendToSocket {
	$l = @_[0];
	$handle->say("$l");
}
