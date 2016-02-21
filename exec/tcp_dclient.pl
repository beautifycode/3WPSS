#!/usr/bin/perl -w
use strict;
use IO::Socket;
use Data::Dumper;

my $filename = 'lookup.txt';

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

print(Dumper($texts));


while(1) {
	$handle->recv($data, 1024);

	foreach (@$texts)
	{
		print $data."\n";
	      if($data eq $_."\n") {
			system("perl tcp_returnclient.pl $_");
	      };
	}

	# if($data eq "info\n") {
	# 	system("perl tcp_returnclient.pl info");
	# } 

	# if($data eq "say my name\n") {
	# 	system("perl tcp_returnclient.pl name");
	# } 

	# if($data eq "say hello to isa\n") {
	# 	system("perl tcp_returnclient.pl isa");
	# } 

	# if($data eq "where is my iphone?\n") {
	# 	system("perl tcp_returnclient.pl iphone");
	# } 

	# if($data eq "hallo\n") {
	# 	system("perl tcp_returnclient.pl hallo");
	# }

	# if($data eq "danke\n") {
	# 	system("perl tcp_returnclient.pl danke");
	# }

	# else {
		print "data: $data\n";		
	# }
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