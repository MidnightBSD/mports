#!/usr/bin/env python3
"""Read an optional build API key without adding it to command lines."""

import json
import os
import sys
import tempfile
from pathlib import Path


def main():
    output = Path(sys.argv[1])
    key = os.environ.get("GOOGLE_API_KEY", "")
    if not key.isascii() or any(ord(c) < 32 or ord(c) == 127 for c in key):
        raise SystemExit("GOOGLE_API_KEY must contain printable ASCII characters")
    lines = [
        "// Generated from the build environment; do not distribute this file.",
        "#ifndef GOOGLE_APIS_ENVIRONMENT_API_KEY_H_",
        "#define GOOGLE_APIS_ENVIRONMENT_API_KEY_H_",
    ]
    if key:
        lines += [
            "#if !defined(GOOGLE_API_KEY)",
            "#define GOOGLE_API_KEY " + json.dumps(key),
            "#endif",
        ]
    lines += ["#endif", ""]
    with tempfile.NamedTemporaryFile(mode="w", dir=output.parent,
                                     prefix=".api-key-", delete=False) as header:
        temporary = Path(header.name)
        try:
            header.write("\n".join(lines))
            header.close()
            temporary.replace(output)
        finally:
            temporary.unlink(missing_ok=True)


if __name__ == "__main__":
    main()
