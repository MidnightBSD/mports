from io import BytesIO
from importlib.resources import files

import pendulum
from pendulum.tz.timezone import Timezone


def _unnamed_zone(key):
    data = files("tzdata.zoneinfo").joinpath(*key.split("/")).read_bytes()
    zone = Timezone.from_file(BytesIO(data))
    assert zone.key is None
    return zone


def test_unnamed_zone_diff_across_dst():
    zone = _unnamed_zone("America/New_York")
    before = pendulum.datetime(2024, 3, 10, 1, 30, tz=zone)
    after = before.add(hours=1)
    assert (after.hour, after.minute, after.utcoffset().total_seconds()) == (3, 30, -14400)
    assert after.diff(before).in_seconds() == 3600
    assert before.diff(after).in_seconds() == 3600


def test_unnamed_different_zones_same_instant():
    local = pendulum.datetime(2024, 1, 15, 7, 0, tz=_unnamed_zone("America/New_York"))
    utc = pendulum.datetime(2024, 1, 15, 12, 0, tz=_unnamed_zone("UTC"))
    assert local.int_timestamp == utc.int_timestamp
    assert local.diff(utc).in_seconds() == 0
