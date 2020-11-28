#!/bin/mksh

cd /tmp && fetch "https://lists.blocklist.de/lists/all.txt"

configfile='/tmp/all.txt'
[ $# -gt 0 ] && [ -r "$1" ] && configfile="$1"

ipfw -q table 2 flush
sed -e 's|0.0.0.0/8||' -e 's|10.0.0.0/8||' -e 's/[[:space:]]*#.*// ; /^[[:space:]]*$/d' "$configfile" |
    while read var1 var2 var3 var4; do
      # stuff with var1, etc.
	ipfw -q table 2 add $var1
    done
