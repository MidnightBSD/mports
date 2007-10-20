package Magus;

use strict;
use warnings;

BEGIN {
  our $Root = '/usr/magus';
}


use Magus::Config;
use Magus::Port      ();
use Magus::Lock      ();
use Magus::Result    ();
use Magus::SubResult ();
use Magus::Machine   ();
use Magus::PortTest  ();
use Magus::Chroot    ();
use Magus::Index     ();

use Mport::Globals   ();
our $Machine;

BEGIN {
  $Machine = Magus::Machine->retrieve(
    name => $Magus::Config{'Machine'}
  );
}


1;
__END__
