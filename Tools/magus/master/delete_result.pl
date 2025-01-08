#!/usr/bin/env perl

use strict;
use warnings;
use lib qw(/usr/mports/Tools/lib);

use Magus;

#
# Script to delete results from the db with cascading deletes.
#

my @result_ids = @ARGV;

if (@result_ids) {
    my $dbh = Magus::Result->db_Main;

    # Start a transaction
    $dbh->begin_work;

    eval {
        foreach my $result_id (@result_ids) {
            my $result = Magus::Result->retrieve($result_id);
            if ($result) {
                $result->delete;
                print "Deleted result $result_id\n";
            } else {
                warn "Couldn't find result with ID $result_id\n";
            }
        }

        # Commit the transaction
        $dbh->commit;
    };

    if ($@) {
        # If there was an error, roll back the transaction
        $dbh->rollback;
        die "Error deleting results: $@\n";
    }

    print "Finished deleting results.\n";
} else {
    print "No result IDs provided.\n";
}