# $MidnightBSD: mports/Mk/extensions/pgsql.mk,v 1.4 2011/05/27 22:23:30 laffer1 Exp $ 
# $FreeBSD: ports/Mk/bsd.database.mk,v 1.14 2006/07/05 02:18:08 linimon Exp $

.if defined(_POSTMKINCLUDED) && !defined(Pgsql_Post_Include)

Pgsql_Post_Include=			pgsql.mk
Pgsql_Include_MAINTAINER=	ports@MidnightBSD.org

# USE_PGSQL		- Add PostgreSQL client dependency.
#				  If no version is given (by the maintainer via the port or
#				  by the user via defined variable), try to find the
#				  currently installed version.  Fall back to default if
#				  necessary (PostgreSQL-8.4 = 84).
# DEFAULT_PGSQL_VER
#				- PostgreSQL default version. Can be overridden within a port.
#				  Default: 84.
# WANT_PGSQL_VER
#				- Maintainer can set an arbitrary version of PostgreSQL by
#				  using it.
# IGNORE_WITH_PGSQL
#				- This variable can be defined if the ports doesn't support
#				  one or more versions of PostgreSQL.
# WITH_PGSQL_VER
#				- User defined variable to set PostgreSQL version.
# PGSQL_VER
#				- Detected PostgreSQL version.


DEFAULT_PGSQL_VER?=	84
PGSQL83_LIBVER=		5
PGSQL84_LIBVER=		5
PGSQL90_LIBVER=		5

# Setting/finding PostgreSQL version we want.
.if exists(${LOCALBASE}/bin/pg_config) && !defined(PACKAGE_BUILDING)
_PGSQL_VER!=	${LOCALBASE}/bin/pg_config --version | ${SED} -n 's/PostgreSQL[^0-9]*\([0-9][0-9]*\)\.\([0-9][0-9]*\)[^0-9].*/\1\2/p'
.endif

.if defined(WANT_PGSQL_VER)
.if defined(WITH_PGSQL_VER) && ${WITH_PGSQL_VER} != ${WANT_PGSQL_VER}
IGNORE=		cannot install: the port wants postgresql${WANT_PGSQL_VER}-client and you try to install postgresql${WITH_PGSQL_VER}-client.
.endif
PGSQL_VER=	${WANT_PGSQL_VER}
.elif defined(WITH_PGSQL_VER)
PGSQL_VER=	${WITH_PGSQL_VER}
.else
.if defined(_PGSQL_VER)
PGSQL_VER=	${_PGSQL_VER}
.else
PGSQL_VER=	${DEFAULT_PGSQL_VER}
.endif
.endif # WANT_PGSQL_VER

.if defined(_PGSQL_VER) && ${PGSQL_VER} != ${_PGSQL_VER}
IGNORE=		cannot install: the port wants postgresql${PGSQL_VER}-client but you have postgresql${_PGSQL_VER}-client installed
.endif

# And now we are checking if we can use it
.if defined(PGSQL${PGSQL_VER}_LIBVER)
# compatability shim
.if defined(BROKEN_WITH_PGSQL)
IGNORE_WITH_PGSQL=${BROKEN_WITH_PGSQL}
.endif
.if defined(IGNORE_WITH_PGSQL)
.	for VER in ${IGNORE_WITH_PGSQL}
.		if (${PGSQL_VER} == "${VER}")
IGNORE=		cannot install: does not work with postgresql${PGSQL_VER}-client PostgresSQL (${IGNORE_WITH_PGSQL} not supported)
.		endif
.	endfor
.endif # IGNORE_WITH_PGSQL
LIB_DEPENDS+=	pq.${PGSQL${PGSQL_VER}_LIBVER}:${PORTSDIR}/databases/postgresql${PGSQL_VER}-client
.else
IGNORE=		cannot install: unknown PostgreSQL version: ${PGSQL_VER}
.endif # Check for correct version
CPPFLAGS+=		-I${LOCALBASE}/include
LDFLAGS+=		-L${LOCALBASE}/lib
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"


.endif #defined(_POSTMKINCLUDED) && !defined(Pgsql_Post_Include)
