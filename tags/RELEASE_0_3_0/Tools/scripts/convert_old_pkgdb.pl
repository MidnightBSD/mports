#!/usr/bin/perl

use strict;
use warnings;
use File::Copy qw(copy);
use DBI;
use Data::Dumper;

my $pkg_dbdir = '/var/db/pkg';


$|++;

if (-e "/var/db/mport/master.db") {
  print "Backing up master.db to master.db.orig...";
  copy("/var/db/mport/master.db", "/var/db/mport/master.db.orig") || die "cp failed: $!\b";
  print " done.\n";
} else {
  system("/usr/libexec/mport.init");
}

my $dbh = DBI->connect("dbi:SQLite:dbname=/var/db/mport/master.db","","", { RaiseError => 1 });

foreach my $dir (glob("$pkg_dbdir/*")) {
  my %pkg;
  
  print "Converting $dir... ";
  
  @pkg{qw(name version)} = ($dir =~ m:^$pkg_dbdir/(.+)-(.*)$:o);
  
  $pkg{comment} = slup_file("$dir/+COMMENT");
  @pkg{qw(assetlist depends conflicts origin prefix)}  = parse_asset_list("$dir/+CONTENTS");
#  print Dumper(\%pkg);  

  copy_infra_files($dir, \%pkg);
  
  insert_into_database($dbh, \%pkg);
  
  print "done.\n";
#  last;
}


$dbh->disconnect;

sub copy_infra_files {
  my ($dir, $pkg) = @_;
  
  return unless -e "$dir/+DEINSTALL";
  
  mkdir("/var/db/mport/infrastructure");
  mkdir("/var/db/mport/infrastructure/$pkg->{name}-$pkg->{version}");
  
  copy("$dir/+DEINSTALL", "/var/db/mport/infrastructure/$pkg->{name}-$pkg->{version}/pkg-deinstall") || die "Coping +DEINSTALLED failed: $!\n";
}


sub insert_into_database {
  my ($dbh, $pkg) = @_;
 
  $dbh->begin_work;
 
  my $sth = $dbh->prepare("INSERT INTO packages (pkg, version, origin, lang, date, prefix, comment, status) VALUES (?,?,?,?,?,?,?,?)");
  $sth->execute($pkg->{name}, $pkg->{version}, $pkg->{origin}, 'en', time, $pkg->{prefix}, $pkg->{comment}, 'clean');
  $sth->finish;
 
  $sth = $dbh->prepare("INSERT INTO depends (pkg, depend_pkgname, depend_pkgversion, depend_port) VALUES (?,?,?,?)");
  
  foreach my $dep (@{$pkg->{depends}}) {
    $sth->execute($pkg->{name}, $dep->{depend_pkgname}, $dep->{depend_pkgversion}, $dep->{depend_port});
  }
  
  $sth->finish;
  
  $sth = $dbh->prepare("INSERT INTO assets (pkg, type, data, checksum) VALUES (?,?,?,?)");
  
  foreach my $asset (@{$pkg->{assetlist}}) {
    $sth->execute($pkg->{name}, $asset->{type}, $asset->{data}, $asset->{checksum});
  }
  
  $sth->finish;
  
  $dbh->commit;  
}
  

sub slup_file {
  my ($file) = @_;
  
  my $fh;
  local $/;
  
  open($fh, '<', $file) || die "Couldn't open $file: $!\n";
  my $contents = <$fh>;
  close($fh) || die "Couldn't close $file: $!\n";

  $contents =~ s/\s*$//;
  
  return $contents;
}

sub parse_asset_list {
  my ($file) = @_;
  
  my $fh;
  
  open($fh, '<', $file) || die "couldn't open $file: $!\n";
  
  
  my @assetlist;  
  my @depends;
  my @conflicts;
  my $origin;
  my $prefix;
  my $cwd;
  
  while (<$fh>) {
    s/\s*$//;
    
    next if m/^\@(?:name|mtree)/;
    
    my $asset = {};
      
    if (m/^\@(\w+) ?(.*)/) {
      my $type = $1;
      my $data = $2;
      
      if ($type eq 'comment') {
        if (m/MD5:(\S+)/) {
          $assetlist[-1]->{checksum} = $1;
        } elsif (m/DEPORIGIN:(\S+)/) {
          $depends[-1]->{depend_port} = $1;
        } elsif (m/ORIGIN:(\S+)/) {
          $origin = $1;
        }
        
        next;
      }
      
      if ($type eq 'ignore') {
        # skip next two lines (file line and checksum line)
        <$fh>;
        <$fh>;
        next;
      }
      
      if ($type eq 'pkgdep') {
        $data =~ m/(\S+)-(\S+)/;
        push(@depends, {depend_pkgname => $1, depend_pkgversion => $2});
        next;
      }
      
      if ($type eq 'conflicts') {
        push(@conflicts, $data);
        next;
      }
      
      if ($type eq 'cwd') {
        $cwd = $data;
        
        $cwd =~ s:/+$::;
        
        if (!$prefix) {
          $prefix = $cwd;
          next;
        }
      }
      
      if ($type eq 'dirrm' || $type eq 'dirrmtry') {
        $data = "$cwd/$data";
      }
      
      $asset->{type} = $type;
      $asset->{data} = $data;
    } else {
      $asset->{type} = 'file';     
      $asset->{data} = "$cwd/$_";
    }

    $asset->{type} = lookup_asset_type($asset->{type});
    
    push(@assetlist, $asset);
  }
  
  return (\@assetlist, \@depends, \@conflicts, $origin, $prefix);
}

# This is really hacky right now, needs to be somethign better in the future 
BEGIN {	
  my %types = (
    ASSET_INVALID => 0,
    ASSET_FILE => 1,
    ASSET_CWD => 2,
    ASSET_CHMOD => 3,
    ASSET_CHOWN => 4,
    ASSET_CHGRP => 5,
    ASSET_COMMENT => 6,
    ASSET_IGNORE => 7,
    ASSET_NAME => 8,
    ASSET_EXEC => 9,
    ASSET_UNEXEC => 10,
    ASSET_SRC => 11,
    ASSET_DISPLY => 12,
    ASSET_PKGDEP => 13,
    ASSET_CONFLICTS => 14,
    ASSET_MTREE => 15,
    ASSET_DIRRM => 16,
    ASSET_DIRRMTRY => 17,
    ASSET_IGNORE_INST => 18,
    ASSET_OPTION => 19,
    ASSET_ORIGIN => 20,
    ASSET_DEPORIGIN => 21,
    ASSET_NOINST => 22,
    ASSET_DISPLAY => 23
  );

  sub lookup_asset_type {
    my ($type) = @_;

    $type = uc $type;
    
    $type = "ASSET_" . $type unless $type =~ m/^ASSET_/;
    
    exists $types{$type} || die "I don't understand type: $type\n";
    
    return $types{$type};
  }
}