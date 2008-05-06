package Magus;

use strict;
use warnings;

BEGIN {
  our $Root  = '/usr/magus';
}


use Magus::Config;
use Magus::Port      	();
use Magus::Lock      	();
use Magus::Category  	();
use Magus::PortCategory ();
use Magus::Event 	();
use Magus::Machine   	();
use Magus::PortTest  	();
use Magus::Chroot    	();
use Magus::Index     	();
use Magus::Run          ();
use Magus::Log		();

use Mport::Globals   ();
our $Machine;

BEGIN {
  $Machine = Magus::Machine->retrieve(
    name => $Magus::Config{'Machine'}
  ) || die "Invalid machine: $Magus::Config{Machine}\n";
}


1;
__END__
