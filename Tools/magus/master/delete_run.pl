#!/usr/bin/env perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;
use Magus::Depend;

#
# Script to delete runs from the db with cascading deletes.
#

my @run_ids = @ARGV;

if (@run_ids) {
    my $dbh = Magus::Run->db_Main;

    # Start a transaction
    $dbh->begin_work;

    eval {
        foreach my $run_id (@run_ids) {
            my $run = Magus::Run->retrieve($run_id);
            if ($run) {
                my @ports = $run->ports;
                foreach my $port (@ports) {
                    # remove depends where this port is the depender
                    Magus::Depend->search(port       => $port)->delete_all;
                    # remove depends where this port is the dependency of another port
                    Magus::Depend->search(dependency => $port)->delete_all;

                    $port->delete;
                    print "Deleted port " . $port->id . "\n";
                }
                $run->delete;
                print "Deleted run $run_id\n";
            } else {
                warn "Couldn't find run with ID $run_id\n";
            }
        }

        # Commit the transaction
        $dbh->commit;
    };

    if ($@) {
        # If there was an error, roll back the transaction
        $dbh->rollback;
        die "Error deleting runs: $@\n";
    }

    print "Finished deleting runs.\n";
} else {
    print "No run IDs provided.\n";
}