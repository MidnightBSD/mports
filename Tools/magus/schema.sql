--
-- Table structure for table categories
--

DROP TABLE "categories" CASCADE\g
DROP SEQUENCE "categories_id_seq" CASCADE ;

CREATE SEQUENCE "categories_id_seq" ;

CREATE TABLE  "categories" (
   "id" integer DEFAULT nextval('"categories_id_seq"') NOT NULL,
   "category"   varchar(64) default NULL, 
   primary key ("id"),
 unique ("category") 
)  ;

--
-- Table structure for table depends
--

DROP TABLE "depends" CASCADE\g
CREATE TABLE  "depends" (
   "port"   int NOT NULL, 
   "dependency"   int NOT NULL,
   "type" character varying(10) NOT NULL,
   primary key ("port", "dependency", "type")
)  ;
CREATE INDEX "depends_port_idx" ON "depends" USING btree ("port");
CREATE INDEX "depends_dependency_idx" ON "depends" USING btree ("dependency");

--
-- Table structure for table events
--

DROP TABLE "events" CASCADE\g
DROP SEQUENCE "events_id_seq" CASCADE ;

CREATE SEQUENCE "events_id_seq" ;

CREATE TABLE  "events" (
   "id" integer DEFAULT nextval('"events_id_seq"') NOT NULL,
   "port"   int NOT NULL, 
   "phase"   varchar(16), 
   "type"   varchar(32),
   "name"   varchar(128), 
   "msg"   text, 
   "machine"   int NOT NULL, 
   primary key ("id")
)  ;
CREATE INDEX "events_port_idx" ON "events" USING btree ("port");

--
-- Table structure for table locks
--

DROP TABLE "locks" CASCADE\g
DROP SEQUENCE "locks_id_seq" CASCADE ;

CREATE SEQUENCE "locks_id_seq" ;

CREATE TABLE  "locks" (
   "id" integer DEFAULT nextval('"locks_id_seq"') NOT NULL,
   "port"   int NOT NULL, 
   "machine"   int NOT NULL, 
   primary key ("id"),
 unique ("port") 
)  ;

--
-- Table structure for table logs
--

DROP TABLE "logs" CASCADE\g
DROP SEQUENCE "logs_id_seq" CASCADE ;

CREATE SEQUENCE "logs_id_seq" ;

CREATE TABLE  "logs" (
   "id" integer DEFAULT nextval('"logs_id_seq"') NOT NULL,
   "port"   int NOT NULL, 
   "data"   text, 
   primary key ("id"),
   "unique"   KEY (port) 
)  ;

--
-- Table structure for table machines
--

DROP TABLE "machines" CASCADE\g
DROP SEQUENCE "machines_id_seq" CASCADE ;

CREATE SEQUENCE "machines_id_seq" ;

CREATE TABLE  "machines" (
   "id" integer DEFAULT nextval('"machines_id_seq"') NOT NULL,
   "arch"   varchar(12) NOT NULL, 
   "name"   varchar(128) NOT NULL, 
   "maintainer"   varchar(128) NOT NULL, 
   "osversion"   varchar(16) NOT NULL, 
   "run"   int NOT NULL, 
   primary key ("id"),
   "unique"   KEY (name) 
)  ;

--
-- Table structure for table port_categories
--

DROP TABLE "port_categories" CASCADE\g
CREATE TABLE  "port_categories" (
   "port"       int NOT NULL, 
   "category"   int NOT NULL
)  ;
CREATE INDEX "port_categories_port_idx" ON "port_categories" USING btree ("port");
CREATE INDEX "port_categories_category_idx" ON "port_categories" USING btree ("category");

--
-- Table structure for table port_license_perms
--
   
DROP TABLE "port_license_perms" CASCADE\g
CREATE TABLE  "port_license_perms" (
   "port"       int NOT NULL,
   "perm"   varchar(50) NOT NULL
)  ;
CREATE INDEX "port_lic_perm_port_idx" ON "port_license_perms" USING btree ("port");

--
-- Table structure for table ports
--

DROP TABLE "ports" CASCADE\g
DROP SEQUENCE "ports_id_seq" CASCADE ;

CREATE SEQUENCE "ports_id_seq" ;

CREATE TABLE  "ports" (
   "id" integer DEFAULT nextval('"ports_id_seq"') NOT NULL,
   "run"   int NOT NULL, 
   "name"   varchar(128) NOT NULL, 
   "pkgname"   varchar(128) NOT NULL, 
   "version"   varchar(32) NOT NULL, 
   "description"   text, 
   "license"   varchar(64) default NULL,
   "restricted" boolean NOT NULL default false,
   "www"   text, 
   "status"   varchar(32) NOT NULL default 'untested',
   "updated"   timestamp NOT NULL default CURRENT_TIMESTAMP , 
   "flavor" character varying(128),
   "default_flavor" boolean NOT NULL default false,
   "cpe" varchar(200) default NULL,
   primary key ("id")
)  ;
 CREATE OR REPLACE FUNCTION update_ports() RETURNS trigger AS '
BEGIN
    NEW.updated := CURRENT_TIMESTAMP; 
    RETURN NEW;
END;
' LANGUAGE 'plpgsql';

-- before INSERT is handled by 'default CURRENT_TIMESTAMP'
CREATE TRIGGER add_current_date_to_ports BEFORE UPDATE ON "ports" FOR EACH ROW EXECUTE PROCEDURE
update_ports();
/*!50001 DROP VIEW IF EXISTS ready_ports*/;
CREATE INDEX "ports_run_idx" ON "ports" USING btree ("run");
CREATE INDEX "ports_name_idx" ON "ports" USING btree ("name");

--
-- Temporary table structure for view ready_ports
--

DROP TABLE "ready_ports" CASCADE\g
/*!50001 CREATE TABLE  "ready_ports" (
   "id"   int, 
   "run"   int, 
   "name"   varchar(128), 
   "pkgname"   varchar(128), 
   "version"   varchar(32), 
   "description"   text, 
   "license"   varchar(64), 
   "www"   text, 
   "status"   varchar(32), 
   "updated"   timestamp, 
   "priority"   bigint 
) */;

--
-- Table structure for table runs
--

DROP TABLE "runs" CASCADE\g
DROP SEQUENCE "runs_id_seq" CASCADE ;

CREATE SEQUENCE "runs_id_seq" ;

CREATE TABLE  "runs" (
   "id" integer DEFAULT nextval('"runs_id_seq"') NOT NULL,
   "osversion"   varchar(16) NOT NULL, 
   "arch"   varchar(11) NOT NULL, 
   "status"   varchar(40) NOT NULL default 'inactive', 
   "created"   timestamp NOT NULL default CURRENT_TIMESTAMP, 
   primary key ("id")
);


--
-- Table structure for table distfiles
--

DROP TABLE "distfiles" CASCADE\g
DROP SEQUENCE "distfiles_id_seq" CASCADE ;

CREATE SEQUENCE "distfiles_id_seq" ;

CREATE TABLE "distfiles"
(
    "id"       integer DEFAULT nextval('"distfiles_id_seq"') NOT NULL,
    "port"     int                                           NOT NULL,
    "filename" varchar(2048),
    primary key ("id")
);
CREATE INDEX "distfiles_port_idx" ON "distfiles" USING btree ("port");

--
-- Table structure for table restricted_distfiles
--

DROP TABLE "restricted_distfiles" CASCADE\g
DROP SEQUENCE "restricted_distfiles_id_seq" CASCADE ;

CREATE SEQUENCE "restricted_distfiles_id_seq" ;

CREATE TABLE "restricted_distfiles"
(
    "id"       integer DEFAULT nextval('"restricted_distfiles_id_seq"') NOT NULL,
    "port"     int                                                      NOT NULL,
    "filename" varchar(2048),
    primary key ("id")
);
CREATE INDEX "restricted_distfiles_port_idx" ON "restricted_distfiles" USING btree ("port");

--
-- Table structure for table master_sites
--

DROP TABLE "master_sites" CASCADE\g
DROP SEQUENCE "master_sites_id_seq" CASCADE;

CREATE SEQUENCE "master_sites_id_seq";

CREATE TABLE "master_sites"
(
    "id"   integer DEFAULT nextval('"master_sites_id_seq"') NOT NULL,
    "port" int                                              NOT NULL,
    "url"  text,
    primary key ("id")
);
CREATE INDEX "master_sites_port_idx" ON "master_sites" USING btree ("port");

--
-- Table structure for table moved
--

DROP TABLE "moved" CASCADE\g
DROP SEQUENCE "moved_id_seq" CASCADE;

CREATE SEQUENCE "moved_id_seq";

CREATE TABLE "moved"
(
    "id"       integer DEFAULT nextval('"moved_id_seq"') NOT NULL,
    "run"      int                                       NOT NULL,
    "port"     varchar(128)                              NOT NULL,
    "moved_to" varchar(128)                              NULL,
    "date"     timestamp NULL,
    "why"      text                                      NULL,
    primary key ("id")
);
CREATE INDEX "moved_port_idx" ON "moved" USING btree ("port");
CREATE INDEX "moved_run_idx" ON "moved" USING btree ("run");

create VIEW ready_ports AS
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
    LEFT JOIN locks on locks.port = ports.id
    LEFT JOIN depends on depends.port = ports.id
    WHERE ports.status = 'untested' and locks.id is null and
          (depends.port is null or
             not exists
                  (SELECT depends.port AS port
                   FROM depends WHERE ports.id = depends.port and not exists  
                     (SELECT ports.id as dep_id
                      FROM ports
                      WHERE ports.id = depends.dependency and (ports.status = 'pass' or ports.status = 'warn'))
                      or
    depends.dependency = locks.port))
ORDER BY priority desc, ports.name asc;

DROP TABLE "critical_ports" CASCADE\g
DROP SEQUENCE "critical_ports_id_seq" CASCADE ;

CREATE SEQUENCE "critical_ports_id_seq" ;

CREATE TABLE  "critical_ports" (
                             "id" integer DEFAULT nextval('"critical_ports_id_seq"') NOT NULL,
                             "arch"   varchar(12) NOT NULL,
                             "pkgname"   varchar(128) NOT NULL,
                             primary key ("id")
);

alter table ports add foreign key (run) references runs(id);
alter table port_categories add foreign key (category) references categories(id);
alter table locks add foreign key (port) references ports(id);
alter table distfiles add foreign key (port) references ports(id);
alter table restricted_distfiles add foreign key (port) references ports(id);
alter table master_sites add foreign key (port) references ports(id);
alter table moved add foreign key (run) references runs(id);

create table mirrors
(
    id      integer default nextval('mirrors_id_seq'::regclass) not null primary key,
    country varchar(4)                                          not null,
    url     varchar(255)                                        not null
);

comment on table mirrors is 'Package mirrors';

alter table mirrors
    owner to pgsql;

grant delete, insert, references, select, trigger, truncate, update on mirrors to magus;
