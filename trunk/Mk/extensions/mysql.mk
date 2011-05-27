# -*- mode: Makefile; tab-width: 4; -*-
# ex: ts=4
#
# $MidnightBSD: mports/Mk/extensions/mysql.mk,v 1.5 2010/12/31 22:38:39 laffer1 Exp $ 
# $FreeBSD: ports/Mk/bsd.database.mk,v 1.14 2006/07/05 02:18:08 linimon Exp $
#

.if defined(_POSTMKINCLUDED) && !defined(Mysql_Post_Include)

Mysql_Post_Include=			mysql.mk
Mysql_Include_MAINTAINER=	ports@MidnightBSD.org


##
# USE_MYSQL		- Add MySQL client dependency.
#				  If no version is given (by the maintainer via the port or
#				  by the user via defined variable), try to find the
#				  currently installed version.  Fall back to default if
#				  necessary (MySQL5.1 = 51).
# DEFAULT_MYSQL_VER
#				- MySQL default version. Can be overriden within a port.
#				  Default: 51.
# WANT_MYSQL_VER
#				- Maintainer can set an arbitrary version of MySQL by using it.
# IGNORE_WITH_MYSQL
#				- This variable can be defined if the ports doesn't support
#				  one or more version of MySQL.
# WITH_MYSQL_VER
#				- User defined variable to set MySQL version.
# MYSQL_VER
#				- Detected MySQL version.
##

DEFAULT_MYSQL_VER?=	51
# MySQL client version currently supported.
MYSQL41_LIBVER=		14
MYSQL50_LIBVER=		15
MYSQL51_LIBVER=		16
MYSQL55_LIBVER=		18

# Setting/finding MySQL version we want.
.if exists(${LOCALBASE}/bin/mysql) && !defined(PACKAGE_BUILDING)
_MYSQL_VER!=	${LOCALBASE}/bin/mysql --version | ${SED} -e 's/.*Distrib \([0-9]\)\.\([0-9]*\).*/\1\2/'
.endif

.if defined(WANT_MYSQL_VER)
.if defined(WITH_MYSQL_VER) && ${WITH_MYSQL_VER} != ${WANT_MYSQL_VER}
IGNORE=		cannot install: the port wants mysql${WANT_MYSQL_VER}-client and you try to install mysql${WITH_MYSQL_VER}-client.
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
IGNORE=	cannot install: MySQL versions mismatch: mysql${_MYSQL_VER}-client is installed and wanted version is mysql${MYSQL_VER}-client
.endif
.endif

.if (${USE_MYSQL} == "embedded")
IGNORE_WITH_MYSQL=	41
.endif

# And now we are checking if we can use it
.if defined(MYSQL${MYSQL_VER}_LIBVER)
# compatability shim
.if defined(BROKEN_WITH_MYSQL)
IGNORE_WITH_MYSQL=${BROKEN_WITH_MYSQL}
.endif
.if defined(IGNORE_WITH_MYSQL)
.	for VER in ${IGNORE_WITH_MYSQL}
.		if (${MYSQL_VER} == "${VER}")
IGNORE=		cannot install: doesn't work with MySQL version : ${MYSQL_VER} (Doesn't support MySQL ${IGNORE_WITH_MYSQL})
.		endif
.	endfor
.endif # IGNORE_WITH_MYSQL
.if (${USE_MYSQL} == "server" || ${USE_MYSQL} == "embedded")
RUN_DEPENDS+=	${LOCALBASE}/libexec/mysqld:${PORTSDIR}/databases/mysql${MYSQL_VER}-server
.if (${USE_MYSQL} == "embedded")
BUILD_DEPENDS+=	${LOCALBASE}/libexec/mysqld:${PORTSDIR}/databases/mysql${MYSQL_VER}-server
.endif
.else
LIB_DEPENDS+=	mysqlclient.${MYSQL${MYSQL_VER}_LIBVER}:${PORTSDIR}/databases/mysql${MYSQL_VER}-client
.endif
.else
IGNORE=		cannot install: unknown MySQL version: ${MYSQL_VER}
.endif # Check for correct libs

.endif # defined(_POSTMKINCLUDED) && !defined(Mysql_Post_Include)
