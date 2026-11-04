#!/bin/sh
set -eu

source_dir=$1
output_dir=$2
jruby_jar="${source_dir}/vendor/jruby/lib/jruby.jar"

mkdir -p "${output_dir}"
find "${source_dir}/bsd-src" -name '*.java' -print | sort > "${output_dir}/sources"
# Tier 1 avoids a compiler crash in older MidnightBSD OpenJDK packages.
"${JAVA_HOME}/bin/javac" -J-XX:TieredStopAtLevel=1 --release 8 \
    -classpath "${jruby_jar}" -d "${output_dir}" @"${output_dir}/sources"
"${JAVA_HOME}/bin/jar" -J-XX:TieredStopAtLevel=1 uf "${jruby_jar}" \
    -C "${output_dir}" com -C "${output_dir}" jnr -C "${output_dir}" org
