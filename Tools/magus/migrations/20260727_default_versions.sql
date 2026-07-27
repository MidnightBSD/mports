BEGIN;

CREATE TABLE IF NOT EXISTS default_versions (
    run integer NOT NULL REFERENCES runs(id) ON DELETE CASCADE,
    name varchar(32) NOT NULL,
    version varchar(32) NOT NULL,
    PRIMARY KEY (run, name)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON default_versions TO magus;

COMMIT;
