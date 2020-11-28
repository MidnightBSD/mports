#!/bin/mksh

cd /tmp && fetch "https://iplists.firehol.org/files/firehol_level1.netset"

configfile='/tmp/firehol_level1.netset'
[ $# -gt 0 ] && [ -r "$1" ] && configfile="$1"

sed -e 's|0.0.0.0/8||' -e 's|10.0.0.0/8||' -e 's/[[:space:]]*#.*// ; /^[[:space:]]*$/d' "$configfile" |
    while read var1 var2 var3 var4; do
      # stuff with var1, etc.
	ipfw -q table 1 add $var1
    done
