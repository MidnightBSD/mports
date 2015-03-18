# -*- tab-width: 4; -*-
# ex: ts=4
#
# $MidnightBSD$ 

.if defined(_POSTMKINCLUDED) && !defined(Mysql_Post_Include)

Mysql_Post_Include=			mysql.mk
Mysql_Include_MAINTAINER=	ports@MidnightBSD.org


##
# USE_MYSQL		- Add MySQL (client/server/embedded) dependency (default:
#				  client).
#				  If no version is given (by the maintainer via the port or
#				  by the user via defined variable), try to find the
#				  currently installed version.  Fall back to default if
#				  necessary (MySQL-5.5 = 55).
# DEFAULT_MYSQL_VER
#				- MySQL default version.  Can be overridden within a port.
#				  Default: 55.
# WANT_MYSQL_VER
#				- Maintainer can set an arbitrary version of MySQL to always
#				  build this port with (overrides WITH_MYSQL_VER).
# IGNORE_WITH_MYSQL
#				- This variable can be defined if the ports does not support
#				  one or more versions of MySQL.
# WITH_MYSQL_VER
#				- User defined variable to set MySQL version.
# MYSQL_VER
#				- Detected MySQL version.
##

.include "${PORTSDIR}/Mk/components/default-versions.mk"

.if defined(DEFAULT_MYSQL_VER)
WARNING+=	"DEFAULT_MYSQL_VER is defined, consider using DEFAULT_VERSIONS=mysql=${DEFAULT_MYSQL_VER} instead"
.endif

#.if defined(USE_MYSQL)
DEFAULT_MYSQL_VER?=	${MYSQL_DEFAULT:S/.//}
# MySQL client version currently supported.
MYSQL51_LIBVER=		16
MYSQL53m_LIBVER=	16
MYSQL55_LIBVER=		18
MYSQL55m_LIBVER=	18
MYSQL55p_LIBVER=	18
MYSQL56_LIBVER=		18
MYSQL56p_LIBVER=	18
MYSQL100m_LIBVER=	18

# Setting/finding MySQL version we want.
.if exists(${LOCALBASE}/bin/mysql) && !defined(PACKAGE_BUILDING)
_MYSQL!=	${LOCALBASE}/bin/mysql --version | ${SED} -e 's/.*Distrib \([0-9]\)\.\([0-9]*\).*/\1\2/'
_PERCONA!=	${LOCALBASE}/bin/mysql --version | ${GREP} Percona | wc -l
_MARIADB!=	${LOCALBASE}/bin/mysql --version | ${GREP} MariaDB | wc -l

.if ${_PERCONA} == 1
_MYSQL_VER=	${_MYSQL}p
.elif ${_MARIADB} == 1
_MYSQL_VER=	${_MYSQL}m
.else
_MYSQL_VER=	${_MYSQL}
.endif
.endif

.if defined(WANT_MYSQL_VER)
.if defined(WITH_MYSQL_VER) && ${WITH_MYSQL_VER} != ${WANT_MYSQL_VER}
IGNORE=		cannot install: the port wants mysql${WANT_MYSQL_VER}-client and you try to install mysql${WITH_MYSQL_VER}-client
.endif
MYSQL_VER=	${WANT_MYSQL_VER}
.elif defined(WITH_MYSQL_VER)
MYSQL_VER=	${WITH_MYSQL_VER}
.else
.if defined(_MYSQL_VER)
MYSQL_VER=	${_MYSQL_VER}
.else
MYSQL_VER=	${DEFAULT_MYSQL_VER}
.endif
.endif # WANT_MYSQL_VER

.if defined(_MYSQL_VER)
.if ${_MYSQL_VER} != ${MYSQL_VER}
IGNORE=		cannot install: MySQL versions mismatch: mysql${_MYSQL_VER}-client is installed and wanted version is mysql${MYSQL_VER}-client
.endif
.endif

.if (${MYSQL_VER} == "53m")
_MYSQL_CLIENT=	databases/mariadb-client
_MYSQL_SERVER=	databases/mariadb-server
.elif (${MYSQL_VER} == "55m")
_MYSQL_CLIENT=	databases/mariadb55-client
_MYSQL_SERVER=	databases/mariadb55-server
.elif (${MYSQL_VER} == "55p")
_MYSQL_CLIENT=	databases/percona55-client
_MYSQL_SERVER=	databases/percona55-server
.elif (${MYSQL_VER} == "56p")
_MYSQL_CLIENT=	databases/percona56-client
_MYSQL_SERVER=	databases/percona56-server
.else
_MYSQL_CLIENT=	databases/mysql${MYSQL_VER}-client
_MYSQL_SERVER=	databases/mysql${MYSQL_VER}-server
.endif

# And now we are checking if we can use it
.if defined(MYSQL${MYSQL_VER}_LIBVER)
.if defined(IGNORE_WITH_MYSQL)
.	for VER in ${IGNORE_WITH_MYSQL}
.		if (${MYSQL_VER} == "${VER}")
IGNORE=		cannot install: does not work with MySQL version ${MYSQL_VER} (MySQL ${IGNORE_WITH_MYSQL} not supported)
.		endif
.	endfor
.endif # IGNORE_WITH_MYSQL
.if (${USE_MYSQL} == "server" || ${USE_MYSQL} == "embedded")
RUN_DEPENDS+=	${LOCALBASE}/libexec/mysqld:${PORTSDIR}/${_MYSQL_SERVER}
.if (${USE_MYSQL} == "embedded")
BUILD_DEPENDS+=	${LOCALBASE}/lib/mysql/libmysqld.a:${PORTSDIR}/${_MYSQL_SERVER}
.endif
.else
LIB_DEPENDS+=	libmysqlclient.so.${MYSQL${MYSQL_VER}_LIBVER}:${PORTSDIR}/${_MYSQL_CLIENT}
.endif
.else
IGNORE=		cannot install: unknown MySQL version: ${MYSQL_VER}
.endif # Check for correct libs

#.endif # USE_MYSQL

.endif # defined(_POSTMKINCLUDED) && !defined(Mysql_Post_Include)
