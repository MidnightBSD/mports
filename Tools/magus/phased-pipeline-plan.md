# Magus Phased Pipeline Refactor Plan

## Summary

Refactor Magus so package availability is driven by build/package success only,
while fetch, test, and virus scan results are tracked independently. Keep
`ports.status` as the build status for compatibility with `magus bless`, existing
APIs, and current package publishing behavior.

## Data Model

- Add `port_phase_results` with one row per `(port, phase)` for `fetch`,
  `build`, `test`, and `scan`.
- Track per-phase `status`, `machine`, `started`, `finished`, and `updated`.
- Add phase logs while keeping the existing `logs` table as the build log for
  backward compatibility.
- Make `locks` phase-aware with one lock per `(port, phase)`.
- During index/import, create phase rows for each port. Ignored/internal/skipped
  ports should have build marked accordingly and non-applicable phases marked
  `skip`.

## Pipeline Behavior

- Fetch phase runs `bmake fetch` only, warms the distfile cache, preserves
  distfile subdirectories, and does not gate builds.
- Build phase runs `fetch extract patch configure build fake package`, writes
  `ports.status`, and uploads packages/distfiles on `pass` or `warn`.
- Test phase runs independently after build `pass` or `warn`, runs only
  `bmake test`, and does not change `ports.status`.
- Virus scan phase runs independently after build `pass` or `warn`, scans the
  built package with configurable ClamAV tooling, and does not affect bless.

## Scheduler And Completion

- Add phase-aware ready selection for fetch, build, test, and scan.
- Keep run completion based only on the build queue and build locks.
- Add configurable worker phase selection so deployments can run dedicated
  fetch/test/scan workers or mixed workers.
- Default mixed-worker priority should favor package availability: `build`,
  then `fetch`, then `scan`, then `test`.

## Web And API

- Keep existing `status` fields meaning build status.
- Add separate fetch, test, and virus scan summaries on run and port pages.
- Extend API responses with `fetch_status`, `test_status`, and `scan_status`.
- Keep `magus bless`, latest package APIs, and package index generation
  independent of test and virus scan phase results.

## Validation

- Run Perl syntax checks for modified Magus libraries, CGI scripts, and slave
  scripts.
- Validate schema changes where local tooling is available.
- Build-check changed C++ helpers when touched.
- Test distfile subdirectory preservation with staged filenames containing
  subdirectories.
- Verify build success makes a package blessable even if test or scan fails or
  has not run.
