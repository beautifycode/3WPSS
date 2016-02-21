#!/usr/bin/perl -w
use strict;
use IO::Socket;
use Data::Dumper;

my $rawDataName = "data.txt";

use lib qw(..);
use JSON qw( );

my ( $host, $port, $kidpid, $handle, $line, $data );

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
# die "can't fork: $!" unless defined( $kidpid = fork() );

while(1) {
	$handle->recv($data, 1024);

	foreach (@$texts)
	{
		# print $data."\n";
	      if($data eq $_->{val}->{case}."\n") {
			system("perl tcp_returnclient.pl $_->{val}->{case}");
	      };
	}

	print "data: $data\n";		

}

sub loadTexfile 
{
	my $json_text = do {
	   open(my $json_fh, "<:encoding(UTF-8)", $rawDataName)
	      or die("Can't open \$rawDataName\": $!\n");
	   local $/;
	   <$json_fh>
	};

	my $json = JSON->new;
	my $data = $json->decode($json_text);



	return $data->{data};
}