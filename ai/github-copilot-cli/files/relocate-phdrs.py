#!/usr/bin/env python3
"""Relocate an ELF64 program header table into the first page.

The MidnightBSD (FreeBSD-derived) kernel image activator only reads the
program header table from the first page of the file:

    return (hdr->e_phoff <= PAGE_SIZE &&
        (u_int)hdr->e_phentsize * hdr->e_phnum <= PAGE_SIZE - hdr->e_phoff);

Single-file Node SEA builds (github copilot) keep e_phoff ~45 MB into the
file, so exec() fails with ENOEXEC.  This rewrites the table at offset 64,
dropping the PT_PHDR entry so the table fits in front of .interp.  The
kernel then derives AT_PHDR from the PT_LOAD segment that maps file
offset 0 (imgact_elf.c), which yields the same address.
"""
import struct
import sys

PAGE_SIZE = 4096
PT_PHDR = 6
PT_LOAD = 1
NEW_PHOFF = 64


def main(path):
    with open(path, "r+b") as f:
        hdr = bytearray(f.read(64))
        if hdr[:4] != b"\x7fELF" or hdr[4] != 2 or hdr[5] != 1:
            sys.exit("%s: not a little-endian ELF64 file" % path)
        phoff = struct.unpack_from("<Q", hdr, 0x20)[0]
        phentsize, phnum = struct.unpack_from("<HH", hdr, 0x36)
        if phentsize != 56:
            sys.exit("%s: unexpected e_phentsize %d" % (path, phentsize))
        if phoff <= PAGE_SIZE and phentsize * phnum <= PAGE_SIZE - phoff:
            print("%s: program headers already in the first page" % path)
            return

        f.seek(phoff)
        table = f.read(phentsize * phnum)
        if len(table) != phentsize * phnum:
            sys.exit("%s: truncated program header table" % path)

        entries = [table[i * phentsize:(i + 1) * phentsize]
                   for i in range(phnum)]
        kept = [e for e in entries
                if struct.unpack_from("<I", e, 0)[0] != PT_PHDR]

        # The first PT_LOAD segment maps file offset 0; the new table has to
        # live inside it, and in front of whatever else the first page holds.
        limit = PAGE_SIZE
        mapped = False
        for e in kept:
            p_type, _, p_offset = struct.unpack_from("<IIQ", e, 0)
            p_filesz = struct.unpack_from("<Q", e, 32)[0]
            if p_type == PT_LOAD and p_offset == 0 and p_filesz >= PAGE_SIZE:
                mapped = True
            elif NEW_PHOFF <= p_offset < limit:
                limit = p_offset
        new = b"".join(kept)
        end = NEW_PHOFF + len(new)
        if not mapped or end > limit:
            # The fit is exact today: 64 + 14 * 56 == 0x350 == .interp.  If a
            # future release adds a segment there is no slack left, and the
            # escape hatch is to relocate the .interp string as well and point
            # PT_INTERP at the new copy.
            sys.exit("%s: no room for %d program headers at offset %d"
                     % (path, len(kept), NEW_PHOFF))

        # Offset 64 holds the stale pre-injection table; refuse to write over
        # anything else, so an upstream layout change fails loudly.
        f.seek(NEW_PHOFF)
        if struct.unpack("<I", f.read(4))[0] != PT_PHDR:
            sys.exit("%s: offset %d is not a stale program header table"
                     % (path, NEW_PHOFF))

        f.seek(NEW_PHOFF)
        f.write(new)
        struct.pack_into("<Q", hdr, 0x20, NEW_PHOFF)
        struct.pack_into("<H", hdr, 0x38, len(kept))
        f.seek(0)
        f.write(hdr)
    print("%s: moved %d program headers to offset %d"
          % (path, len(kept), NEW_PHOFF))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("usage: %s file" % sys.argv[0])
    main(sys.argv[1])
