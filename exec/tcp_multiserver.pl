#!/usr/bin/perl
use IO::Socket;
use IO::Select;

my @sockets;
my $machine_addr = '192.168.2.120';
$main_sock = new IO::Socket::INET(LocalAddr=>$machine_addr,
      LocalPort=>7777,
      Proto=>'tcp',
      Listen=>3,
            Reuse=>1,
            );

die "Could not connect: $!" unless $main_sock;
print "Starting Server\n";

$readable_handles = new IO::Select();
$readable_handles->add($main_sock);

while (1)
{
  ($new_readable) = IO::Select->select($readable_handles, undef, undef, 0);

  foreach $sender (@$new_readable)
  {
    if ($sender == $main_sock)
    {
      $newSender = $sender->accept();
      $readable_handles->add($newSender);
    }
    else
    {
      $buf = <$sender>;
      if ($buf)
      {
        my $info = $sender->peerhost();
        print "$info > $buf\n";
        my @sockets = $readable_handles->can_write();
  
        foreach my $client(@sockets){
          print $client "$buf\n";
        }
      }
      else
      {
        $readable_handles->remove($sender);
        close($sender);
      }
    }
  }
}

print "Terminating Server\n";
close $main_sock;
getc();