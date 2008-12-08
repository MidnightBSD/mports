# New ports collection makefile for:	egroupware
# Date created:        27 March 2001
# Whom:                Jimmy Olgeni <olgeni@uli.it>
#
# $MidnightBSD: mports/deskutils/egroupware/Makefile,v 1.1 2008/12/08 19:34:46 laffer1 Exp $
# $FreeBSD: ports/deskutils/egroupware/Makefile,v 1.31 2008/07/12 05:03:55 kuriyama Exp $

PORTNAME=	eGroupWare
PORTVERSION=	1.4.004
CATEGORIES=	deskutils
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A web based GroupWare system
LICENSE=	gpl2

USE_BZIP2=	yes
NO_BUILD=	yes

DEST=		${PREFIX}/www/data-dist/egroupware
PLIST_SUB=	WWWGRP=${WWWGRP}

OPTIONS=	MYSQL "Use MySQL database" on \
		POSTGRE "Use PostgreSQL Database" off \
		IMAP "Enable Mail support in eGroupware" on \
		GD "Enable graphic support (needs xorg-libraries)" off \
		LDAP "Contacts can be stored using OpenLDAP" off

.include <bsd.mport.options.mk>

USE_PHP=	pcre session xml

.if defined(WITH_MYSQL)
USE_PHP+=	mysql
.endif
.if defined(WITH_POSTGRE)
USE_PHP+=	pgsql
.endif
.if defined(WITH_IMAP)
USE_PHP+=	imap
.endif
.if defined(WITH_GD)
USE_PHP+=	gd
.endif
.if defined(WITH_LDAP)
USE_PHP+=	ldap
.endif

.include <bsd.port.pre.mk>

do-extract:
	${MKDIR} ${WRKDIR}

do-install:
	${MKDIR} ${DEST}
	cd ${DEST}/.. && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/${DISTFILES} ${EXTRACT_AFTER_ARGS}
	@${FIND} ${DEST} -name .svn -type d | ${XARGS} ${RM} -rf
	${CHMOD} g+w ${DEST} ${DEST}/phpgwapi/images
	${CHGRP} ${WWWGRP} ${DEST} ${DEST}/phpgwapi/images
	${MV} ${DEST}/setup/inc/class.setup_process.inc.php ${WRKDIR}
	${SED} s,/var/lib/,/var/db/, ${WRKDIR}/class.setup_process.inc.php > \
		${DEST}/setup/inc/class.setup_process.inc.php

# --- postgresql.conf
# tcpip_socket = true
# ports = 5432
#
# --- pg_hba.conf
# local $dbname trust
# host  $dbname all   127.0.0.1 255.255.255.255 md5
#
# --- php.ini
# memory_limit = 16M (or above)
#
# createuser $dbuser -P -A -d
# createdb -U $dbuser $dbname
#
# Open http://localhost/egroupware/setup/index.php

.include <bsd.port.post.mk>
