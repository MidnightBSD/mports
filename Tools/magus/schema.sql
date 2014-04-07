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
   "dependency"   int NOT NULL
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
   "phase"   varchar(16) NOT NULL, 
   "type"   varchar(32) NOT NULL, 
   "name"   varchar(128) NOT NULL, 
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
   "port"   varchar(128) NOT NULL, 
   "category"   int NOT NULL
)  ;
CREATE INDEX "port_categories_port_idx" ON "port_categories" USING btree ("port");
CREATE INDEX "port_categories_category_idx" ON "port_categories" USING btree ("category");

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
   "license"   varchar(16) default NULL, 
   "www"   text, 
   "status"   varchar(32) NOT NULL default 'untested', 
   "updated"   timestamp NOT NULL default CURRENT_TIMESTAMP , 
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
   "license"   varchar(16), 
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
)  ;
/*!50001 DROP VIEW IF EXISTS ready_ports*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=root@localhost SQL SECURITY DEFINER */
/*!50001 VIEW ready_ports AS select ports.id AS id,ports.run AS run,ports.name AS name,ports.pkgname AS pkgname,ports.version AS version,ports.description AS description,ports.license AS license,ports.www AS www,ports.status AS status,ports.updated AS updated,(select count(0) AS COUNT(*) from depends where (depends.dependency = ports.id)) AS priority from ports where ((ports.status = _latin1'untested') and (not(ports.id in (select locks.port AS port from locks where (locks.port = ports.id)))) and ((not(ports.id in (select depends.port AS port from depends where (depends.port = ports.id)))) or (not(ports.id in (select depends.port AS port from depends where (((depends.port = ports.id) and (not(depends.dependency in (select depends.port AS port from ports where ((ports.id = depends.dependency) and ((ports.status = _latin1'pass') or (ports.status = _latin1'warn'))))))) or depends.dependency in (select locks.port AS port from locks where (locks.port = depends.dependency)))))))) order by (select count(0) AS COUNT(*) from depends where (depends.dependency = ports.id)) desc */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
