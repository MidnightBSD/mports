PORTNAME=	postgresql
# Keep the ?=, it is used by the other pltcl ports.
PORTREVISION?=	0
CATEGORIES=	databases tcl
PKGNAMESUFFIX?=	10${COMPONENT}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for using Tcl to write SQL functions

LICENSE=	pgsql

MASTERDIR=	${.CURDIR}/../../databases/postgresql10-server

USES+=		tcl pgsql:10
WANT_PGSQL=	server

CONFIGURE_ARGS=	--with-tcl --without-tk \
		--with-tclconfig="${TCL_LIBDIR}" \
		--with-includes="${TCL_INCLUDEDIR}"

CONFIGURE_ENV+=	TCLSH="${TCLSH}"
MAKE_ENV+=	TCL_INCDIR="${TCL_INCLUDEDIR}"

BUILD_DIRS=	src/backend src/pl/tcl
INSTALL_DIRS=	src/pl/tcl
SLAVE_ONLY=	yes
COMPONENT=	-pltcl

.include "${MASTERDIR}/Makefile"
