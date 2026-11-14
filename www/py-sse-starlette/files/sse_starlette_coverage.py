"""Map byte-identical staged SSE modules to their source for coverage reports."""
from __future__ import annotations

import argparse
import hashlib
import os
from pathlib import Path

from coverage import CoveragePlugin, FileTracer


class SourceMapper(FileTracer):
    def __init__(self, source: Path) -> None:
        self._source = str(source)

    def source_filename(self) -> str:
        return self._source


class SseStarlettePlugin(CoveragePlugin):
    def file_tracer(self, filename: str) -> FileTracer | None:
        source_root = Path(os.environ["SSE_SOURCE"]).resolve()
        stage_root = Path(os.environ["SSE_STAGE"]).resolve()
        staged_file = Path(filename).resolve()
        try:
            relative = staged_file.relative_to(stage_root)
        except ValueError:
            return None
        source_file = source_root / relative
        if not source_file.is_file() or not staged_file.is_file():
            return None
        if hashlib.sha256(source_file.read_bytes()).digest() != hashlib.sha256(staged_file.read_bytes()).digest():
            return None
        return SourceMapper(source_file)

    def file_reporter(self, filename: str) -> str:
        return "python"


def coverage_init(reg, options) -> None:
    reg.add_file_tracer(SseStarlettePlugin())


def prepare_config(source: Path, output: Path) -> None:
    text = source.read_text()
    marker = "[tool.coverage.run]\n"
    if text.count(marker) != 1 or "fail_under = 85" not in text:
        raise SystemExit("unexpected upstream coverage configuration")
    if "**/site-packages/*" not in text or "tests/*" not in text:
        raise SystemExit("upstream coverage omissions changed")
    if "plugins = [\"sse_starlette_coverage\"]" in text:
        raise SystemExit("coverage plugin already configured")
    output.write_text(text.replace(marker, marker + 'plugins = ["sse_starlette_coverage"]\n', 1))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--prepare", nargs=2, type=Path, metavar=("SOURCE", "OUTPUT"))
    args = parser.parse_args()
    if not args.prepare:
        parser.error("--prepare SOURCE OUTPUT is required")
    prepare_config(*args.prepare)
