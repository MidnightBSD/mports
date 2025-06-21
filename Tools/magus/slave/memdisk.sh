#!/bin/sh
mdconfig -a -t swap -s 16G
newfs -U /dev/md0
cd /usr/magus/slave-data/chroots/`uname -r` && mkdir 1
mount /dev/md0 /usr/magus/slave-data/chroots/`uname -r`/1
