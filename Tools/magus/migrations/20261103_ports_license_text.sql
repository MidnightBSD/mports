BEGIN;

-- Some installations also have a locally created ready_ports2 view.
-- Preserve its definition and owner rather than assuming it matches ready_ports.
DO $migration$
DECLARE
    saved_definition text;
    saved_owner name;
BEGIN
    IF to_regclass('public.ready_ports2') IS NOT NULL THEN
        -- Fail without changes if metadata needs preservation beyond this migration.
        IF EXISTS (
            SELECT 1 FROM pg_class
            WHERE oid = 'public.ready_ports2'::regclass
              AND (relkind <> 'v' OR relacl IS NOT NULL OR reloptions IS NOT NULL
                   OR obj_description(oid, 'pg_class') IS NOT NULL)
        ) OR EXISTS (
            SELECT 1 FROM pg_attribute
            WHERE attrelid = 'public.ready_ports2'::regclass
              AND col_description(attrelid, attnum) IS NOT NULL
        ) THEN
            RAISE EXCEPTION 'ready_ports2 has additional metadata; preserve it before migrating';
        END IF;
        SELECT pg_get_viewdef(oid, true), pg_get_userbyid(relowner)
          INTO saved_definition, saved_owner
          FROM pg_class WHERE oid = 'public.ready_ports2'::regclass;
        DROP VIEW public.ready_ports2;
    END IF;

-- The views depend on ports.license, so recreate them after changing the type.
DROP VIEW ready_ports;
ALTER TABLE ports ALTER COLUMN license TYPE text;

CREATE VIEW ready_ports AS
    SELECT ports.id AS id,
           ports.run AS run,
           ports.name AS name,
           ports.pkgname AS pkgname,
           ports.version AS version,
           ports.description AS description,
           ports.license AS license,
           ports.www AS www,
           ports.status AS status,
           ports.updated AS updated,
          (SELECT count(0) AS COUNT
           FROM depends
           WHERE depends.dependency = ports.id) AS priority,
           ports.flavor AS flavor
    FROM ports
    INNER JOIN port_phase_results fetch_phase
        ON fetch_phase.port = ports.id
       AND fetch_phase.phase = 'fetch'
       AND fetch_phase.status <> 'untested'
    LEFT JOIN locks on locks.port = ports.id and locks.phase = 'build'
    WHERE ports.status = 'untested' and locks.id is null and
          not exists
              (SELECT depends.port AS port
               FROM depends WHERE ports.id = depends.port
                 and depends.type <> 'test' and (not exists
                 (SELECT ports.id as dep_id
                  FROM ports
                  WHERE ports.id = depends.dependency and (ports.status = 'pass' or ports.status = 'warn'))
                  or exists
                     (SELECT 1
                      FROM locks dep_locks
                      WHERE dep_locks.port = depends.dependency and dep_locks.phase = 'build')))
ORDER BY priority desc, ports.name asc;

    IF saved_definition IS NOT NULL THEN
        EXECUTE 'CREATE VIEW public.ready_ports2 AS ' || saved_definition;
        EXECUTE format('ALTER VIEW public.ready_ports2 OWNER TO %I', saved_owner);
    END IF;
END;
$migration$;

COMMIT;
