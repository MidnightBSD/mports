#!/usr/bin/env python3

import pathlib
import re
import sys


def main() -> int:
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} vuln.xml vuln-directory", file=sys.stderr)
        return 2

    document = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8")
    shard_directory = pathlib.Path(sys.argv[2])
    entities = re.findall(r'<!ENTITY vuln-(\d{4}) SYSTEM "vuln/(\d{4})\.xml">', document)
    references = re.findall(r'&vuln-(\d{4});', document)
    shards = {path.stem for path in shard_directory.glob("[0-9][0-9][0-9][0-9].xml")}

    errors = []
    entity_years = [name for name, filename in entities if name == filename]
    malformed_entities = [(name, filename) for name, filename in entities if name != filename]
    if malformed_entities:
        errors.append(f"mismatched entity names: {malformed_entities}")

    for label, years in (("entity", entity_years), ("reference", references)):
        duplicates = sorted({year for year in years if years.count(year) > 1})
        if duplicates:
            errors.append(f"duplicate {label} years: {', '.join(duplicates)}")

    entity_set = set(entity_years)
    reference_set = set(references)
    for label, years in (("entities", entity_set), ("references", reference_set)):
        missing = sorted(shards - years)
        extra = sorted(years - shards)
        if missing:
            errors.append(f"shards missing from {label}: {', '.join(missing)}")
        if extra:
            errors.append(f"{label} without shard files: {', '.join(extra)}")

    if entity_set != reference_set:
        errors.append("entity declarations and document references differ")

    if errors:
        for error in errors:
            print(f"Error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
