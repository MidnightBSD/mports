PORTNAME=	postgresql
CATEGORIES=	databases python
# Keep the ?=, it is used as master by the other plpython ports.
PORTREVISION?=	0
PKGNAMESUFFIX?=	${WANT_PGSQL_VER:S/.//}${COMPONENT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for using Python to write SQL functions

LICENSE=	pgsql

USES+=		pgsql:${WANT_PGSQL_VER} ${WANT_PYTHON_USE}
WANT_PGSQL=	server

MASTERDIR=	${.CURDIR}/../postgresql${WANT_PGSQL_VER:S/.//}-server

PGSQL_VER?=	12
WANT_PGSQL_VER?=	12
WANT_PYTHON_USE?=	python

CONFIGURE_ARGS=	--with-python
COMPONENT=	-plpython

BUILD_DIRS=	src/backend src/pl/plpython
INSTALL_DIRS=	src/pl/plpython
SLAVE_ONLY=	yes

.include "${MASTERDIR}/Makefile"
