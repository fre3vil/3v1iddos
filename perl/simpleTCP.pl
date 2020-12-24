#!/usr/bin/env perl
# code by fre3vil


use utf8;
use strict;
use warnings;


use IO::Socket;
use Time::HiRes qw( time );

if (@ARGV < 2) {
	die "Usge $0 TARGET_IP TARGET_PORT\n\n";
}

my $serverdata;
my $data = "AAAA";

# proto type and host define

my $Target = $ARGV[0];
my $Port = $ARGV[1];
my $ProtoTcp = 'tcp';

my $SendTime = 10;	# init 10 times

# simple tcp 

sub simpleTcpSend() {
	my $start = time();
	my $init = 0;
	my $socket = IO::Socket::INET->new (
		Proto => $ProtoTcp,
		PeerAddr => $Target,
		PeerPort => $Port
	) or die "Can't connect to $Target:$Port\n";
	
	print "Receive date from $Target\n";
	$socket->recv($serverdata, 1024);
	print "Send tcp data.\n";
	while ($init < $SendTime) {
		$init += 1;
		print "[+] Attack $init times.\n";
		$socket->send($data);
	}
	$socket->close();

	my $end = time();
	my $usage = $end - $start;

	printf("Spend %0.02f seconds.\n", $usage);
}


simpleTcpSend();

