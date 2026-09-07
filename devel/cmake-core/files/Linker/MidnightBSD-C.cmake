# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

# MidnightBSD was forked from FreeBSD and uses the same linkers, so reuse
# the FreeBSD linker support. Platform/FreeBSD-C selects between the
# GNU and LLD variants itself via Platform/Linker/BSD-Linker-Initialize.
include(Platform/Linker/FreeBSD-C)
