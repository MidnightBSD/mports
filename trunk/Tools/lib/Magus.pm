package Magus;

use strict;
use warnings;

BEGIN {
  our $Root  = '/usr/magus';
  our @Archs = qw(i386 amd64);
}


use Magus::Config;
use Magus::Port      	();
use Magus::Lock      	();
use Magus::Result    	();
use Magus::Category  	();
use Magus::PortCategory ();
use Magus::SubResult 	();
use Magus::Machine   	();
use Magus::PortTest  	();
use Magus::Chroot    	();
use Magus::Index     	();
use Magus::Cluster	();
use Magus::Task		();

use Mport::Globals   ();
our $Machine;

BEGIN {
  $Machine = Magus::Machine->retrieve(
    name => $Magus::Config{'Machine'}
  ) || die "Invalid machine: $Magus::Config{Machine}\n";
}


1;
__END__
