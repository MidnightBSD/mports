import importlib.resources
import pathlib
import tempfile
import unittest
from unittest.mock import patch
import zoneinfo

from hypothesis.strategies._internal.datetime import _valid_key_cacheable


class TimezoneKeysTest(unittest.TestCase):
    def setUp(self):
        self.original_path = zoneinfo.TZPATH
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.addCleanup(zoneinfo.reset_tzpath, self.original_path)
        self.addCleanup(_valid_key_cacheable.cache_clear)
        self.root = pathlib.Path(self.temp.name)
        utc = next(pathlib.Path(p) / "UTC" for p in self.original_path
                   if (pathlib.Path(p) / "UTC").is_file()).read_bytes()
        # Keep a valid TZif payload but replace its POSIX trailer with the
        # malformed Factory trailer found in the MidnightBSD timezone database.
        head, _, trailer = utc.rpartition(b"\n")
        head, sep, _ = head.rpartition(b"\n")
        self.assertTrue(sep and not trailer)
        (self.root / "Valid").write_bytes(utc)
        (self.root / "Invalid").write_bytes(
            head + b"\n<Local time zone must be set--use tzsetup>0\n"
        )
        zoneinfo.reset_tzpath((str(self.root),))
        self.tzpath = zoneinfo.TZPATH

    def test_valid_malformed_and_missing(self):
        self.assertTrue(_valid_key_cacheable(self.tzpath, "Valid"))
        self.assertFalse(_valid_key_cacheable(self.tzpath, "Invalid"))
        self.assertFalse(_valid_key_cacheable(self.tzpath, "NoSuchZone"))

    def test_tzdata_fallback(self):
        fallback = self.root / "fallback"
        fallback.mkdir()
        (fallback / "Fallback").write_bytes((self.root / "Valid").read_bytes())
        with patch.object(importlib.resources, "files", return_value=fallback):
            self.assertTrue(_valid_key_cacheable(self.tzpath, "Fallback"))

    def test_unrelated_errors_propagate(self):
        class BrokenZoneInfo:
            @staticmethod
            def no_cache(key):
                raise PermissionError(key)

        with patch.object(zoneinfo, "ZoneInfo", BrokenZoneInfo):
            with self.assertRaises(PermissionError):
                _valid_key_cacheable(self.tzpath, "UnrelatedError")


if __name__ == "__main__":
    unittest.main()
