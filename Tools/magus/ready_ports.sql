CREATE OR REPLACE VIEW ready_ports AS
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
           WHERE depends.dependency = ports.id) AS priority
    FROM ports
    LEFT JOIN locks on locks.port = ports.id and locks.phase = 'build'
    LEFT JOIN depends on depends.port = ports.id
    WHERE ports.status = 'untested' and locks.id is null and
          (depends.port is null or
             not exists
                  (SELECT depends.port AS port
                   FROM depends WHERE ports.id = depends.port and not exists
                     (SELECT ports.id as dep_id
                      FROM ports
                      WHERE ports.id = depends.dependency and (ports.status = 'pass' or ports.status = 'warn'))
                      or exists
                         (SELECT 1
                          FROM locks dep_locks
                          WHERE dep_locks.port = depends.dependency and dep_locks.phase = 'build')))
ORDER BY priority desc, ports.name asc;
