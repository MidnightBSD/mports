# $FreeBSD: head/databases/postgresql90-plpython/Makefile 371173 2014-10-19 08:50:17Z mva $

PORTNAME=	postgresql
CATEGORIES=	databases python
PKGNAMESUFFIX?=	${DISTVERSION:R:S/.//}${COMPONENT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for using Python to write SQL functions

USES+=		pgsql:${WANT_PGSQL_VER} python:2
WANT_PGSQL=	server
USE_PYTHON=	2

MASTERDIR=	${.CURDIR}/../postgresql${WANT_PGSQL_VER:S/.//}-server

WANT_PGSQL_VER?=	9.6

CONFIGURE_ARGS=	--with-python
COMPONENT=	-plpython

.if defined(PYTHON_VER) && ${PYTHON_VER:R} == 3
PLIST_SUB+=	PYTHON2="@comment " PYTHON3=""
.else
PLIST_SUB+=	PYTHON2="" PYTHON3="@comment "
.endif

BUILD_DIRS=	src/backend src/pl/plpython
INSTALL_DIRS=	src/pl/plpython
SLAVE_ONLY=	yes

.include "${MASTERDIR}/Makefile"
