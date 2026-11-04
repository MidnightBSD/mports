package Magus::App::Logger;

use Sys::Syslog;
#
# A utility class for logging in applications.
#
sub new {
  my ($class, %args) = @_;
  
  my $self = bless \%args, $class;
  
  $self->_init;
  return $self;
}

sub verbose {
  my $self = shift;
  
  if (@_) {
    $self->{verbose} = shift;
  }
  
  return $self->{verbose};
}

sub _init {
  my ($self) = @_;  
  
  return if $self->{_syslog_init};
  
  openlog("magus", "ndelay,pid", "local0");
  
  $self->{_syslog_init}++;
}


sub report {
  my ($self, $level, $format, @args) = @_;

  syslog($level, $format, @args);

  if ($self->{verbose}) {
    my $time = localtime;
    printf "[$time] ($$): $format\n", @args;
  }
}  
  

BEGIN {
  no strict 'refs';
  
  foreach my $level (qw(emerg alert crit err warning notice info debug)) {
    *{$level} = sub {
      shift->report($level => @_);
    }
  }
}

1;
__END__



}    
}
}
                                                             
                                                             
  
  