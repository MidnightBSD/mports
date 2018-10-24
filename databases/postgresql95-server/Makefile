# Created by: Marc G. Fournier <scrappy@FreeBSD.org>
# $FreeBSD: head/databases/postgresql95-server/Makefile 408835 2016-02-13 22:42:04Z girgen $
# $MidnightBSD$

DISTVERSION?=	9.5.13

MAINTAINER?=	ports@MidnightBSD.org

INSTALL_DIRS?=	src/common src/timezone src/backend \
		src/backend/utils/mb/conversion_procs \
		src/backend/snowball src/backend/replication/libpqwalreceiver \
		src/bin/initdb src/bin/pg_ctl \
		src/bin/pg_controldata src/bin/pg_resetxlog src/pl \
		src/bin/pg_basebackup src/bin/pg_archivecleanup \
		src/bin/pg_rewind \
		src/bin/pg_test_fsync src/bin/pg_test_timing \
		src/bin/pg_xlogdump src/bin/pg_upgrade

ICU_PATCHFILE=	pg-954-icu-2016-08-10.diff.gz

PG_USER?=	pgsql
PG_GROUP?=	pgsql
PG_UID?=	70

.include "${.CURDIR}/../postgresql10-server/Makefile"
