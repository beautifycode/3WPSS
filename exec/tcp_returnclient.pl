#!/usr/bin/perl -w
use strict;
use warnings;
use IO::Socket;
use Switch;

my $filename = 'data.txt';

use lib qw(..);
use JSON qw( );
use Data::Dumper;

my $arg = $ARGV[0];
my ( $host, $port, $kidpid, $handle, $line, $l );


( $host, $port ) = ('192.168.2.120',7777);
$handle = IO::Socket::INET->new(
    Proto    => "tcp",
    PeerAddr => $host,
    PeerPort => $port
  )
  or die "can't connect to port $port on $host: $!";

print STDERR "[Connected to $host:$port]\n";
print STDERR "Loading Texts\n";
my $texts = loadTexfile();
print STDERR "Texts loaded\n\n";
print(Dumper($texts));
# print $texts->{data}->{info}->{de};

switch($arg){
	for my $item(@$texts) {
		if($arg eq $item->{val}->{case}) {
			SendToSocket($item->{val}->{de});
		}
	}
}

sub SendToSocket {
	$l = $_[0];
	print STDOUT "Sending.";
	$handle->say("$l");
	print STDERR "[Disconnected from $host:$port]\n";
	close $handle;
}

sub loadTexfile 
{
	my $json_text = do {
	   open(my $json_fh, "<:encoding(UTF-8)", $filename)
	      or die("Can't open \$filename\": $!\n");
	   local $/;
	   <$json_fh>
	};

	my $json = JSON->new;
	my $data = $json->decode($json_text);



	return $data->{data};
}