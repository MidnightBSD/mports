#!/usr/bin/env python3

import argparse
import datetime
import json
import pathlib
import re
import subprocess
import sys
import urllib.parse
import urllib.request


PORT_VARIABLES = (
    "PKGORIGIN",
    "PKGBASE",
    "PKGVERSION",
    "PORTVERSION",
    "PORTREVISION",
    "PORTEPOCH",
    "CPE_STR",
)


def existing_cves(vulnerability_directory: pathlib.Path) -> set[str]:
    found = set()
    pattern = re.compile(r"<cvename>\s*(CVE-[0-9]{4}-[0-9]+)\s*</cvename>", re.IGNORECASE)
    for shard in vulnerability_directory.glob("[0-9][0-9][0-9][0-9].xml"):
        found.update(match.upper() for match in pattern.findall(shard.read_text(encoding="utf-8")))
    return found


def port_metadata(portsdir: pathlib.Path, origin: str, make_command: str) -> dict[str, str]:
    portdir = (portsdir / origin).resolve()
    try:
        portdir.relative_to(portsdir.resolve())
    except ValueError as ex:
        raise ValueError(f"port origin escapes the ports tree: {origin}") from ex
    if not (portdir / "Makefile").is_file():
        raise ValueError(f"port origin does not exist: {origin}")

    command = [make_command, "-C", str(portdir)]
    for variable in PORT_VARIABLES:
        command.extend(("-V", variable))
    result = subprocess.run(command, check=True, capture_output=True, text=True)
    values = result.stdout.splitlines()
    if len(values) != len(PORT_VARIABLES):
        raise RuntimeError(f"unexpected {make_command} output for {origin}")
    return dict(zip(PORT_VARIABLES, values))


def fetch_ranges(api_base: str, cpe: str, start_date: str, timeout: float) -> list[dict]:
    query = urllib.parse.urlencode({"cpe": cpe, "startDate": start_date})
    url = f"{api_base.rstrip('/')}/api/cpe/ranges?{query}"
    request = urllib.request.Request(url, headers={"Accept": "application/json"})
    with urllib.request.urlopen(request, timeout=timeout) as response:
        advisories = json.load(response)
    if not isinstance(advisories, list) or not all(
        isinstance(advisory, dict) for advisory in advisories
    ):
        raise ValueError("security advisory API returned an unexpected response")
    return advisories


def current_branch(portsdir: pathlib.Path) -> str:
    result = subprocess.run(
        ["git", "-C", str(portsdir), "rev-parse", "--abbrev-ref", "HEAD"],
        check=True,
        capture_output=True,
        text=True,
    )
    branch = result.stdout.strip()
    if branch == "HEAD":
        result = subprocess.run(
            ["git", "-C", str(portsdir), "rev-parse", "--short", "HEAD"],
            check=True,
            capture_output=True,
            text=True,
        )
        branch = result.stdout.strip()
    return branch


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Find sec.midnightbsd.org CVE candidates for MidnightBSD ports"
    )
    parser.add_argument("origin", nargs="+", help="port origin, for example dns/bind918")
    parser.add_argument("--portsdir", default="/usr/mports")
    parser.add_argument("--api-base", default="https://sec.midnightbsd.org")
    parser.add_argument("--branch", help="branch name recorded in the output")
    parser.add_argument("--start-date", default="2006-02-28")
    parser.add_argument("--make", default="bmake", dest="make_command")
    parser.add_argument("--timeout", type=float, default=30.0)
    parser.add_argument("--output", type=pathlib.Path)
    args = parser.parse_args()

    portsdir = pathlib.Path(args.portsdir).resolve()
    known_cves = existing_cves(portsdir / "security/vuxml/vuln")
    ports = []
    for origin in args.origin:
        metadata = port_metadata(portsdir, origin, args.make_command)
        cpe = metadata["CPE_STR"]
        if not cpe:
            raise ValueError(f"{origin} does not define CPE metadata")
        advisories = fetch_ranges(args.api_base, cpe, args.start_date, args.timeout)
        candidates_by_cve = {}
        for advisory in advisories:
            cve_id = advisory.get("cveId", "").upper()
            if cve_id and cve_id not in known_cves:
                candidates_by_cve[cve_id] = advisory
        ports.append(
            {
                "origin": metadata["PKGORIGIN"],
                "pkgbase": metadata["PKGBASE"],
                "pkgversion": metadata["PKGVERSION"],
                "portversion": metadata["PORTVERSION"],
                "portrevision": int(metadata["PORTREVISION"] or 0),
                "portepoch": int(metadata["PORTEPOCH"] or 0),
                "cpe": cpe,
                "candidates": [candidates_by_cve[cve] for cve in sorted(candidates_by_cve)],
            }
        )

    document = {
        "generatedAt": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "api": args.api_base,
        "branch": args.branch or current_branch(portsdir),
        "startDate": args.start_date,
        "ports": ports,
    }
    output = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.output:
        args.output.write_text(output, encoding="utf-8")
    else:
        sys.stdout.write(output)
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (OSError, RuntimeError, ValueError, subprocess.CalledProcessError) as ex:
        print(f"Error: {ex}", file=sys.stderr)
        sys.exit(1)
