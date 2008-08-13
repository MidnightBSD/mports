# New ports collection makefile for:    ldapbrowser
# Date created:         May 30, 2008
# Whom:                 Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/net/ldapbrowser/Makefile,v 1.1 2008/05/30 21:28:42 laffer1 Exp $
#

PORTNAME=	ldapbrowser
PORTVERSION=	2.8.2
PORTREVISION=	1
CATEGORIES=	net java
MASTER_SITES=	http://www-unix.mcs.anl.gov/~gawor/ldapcommon/bin/
DISTNAME=	Browser282b2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java/Swing-based LDAP Browser/Editor
LICENSE=	restricted

RESTRICTED=	"2.7 is known to be restricted, 2.8 is ambiguous"

USE_JAVA=	yes
JAVA_VERSION=	1.4+
NO_BUILD=	yes
NOMAN=		defined
WRKSRC=		${WRKDIR}/${PORTNAME}

do-install:
	${MKDIR} ${PREFIX}/lib/ldapbrowser
	cd ${WRKSRC} ; tar cf - . | ( cd ${PREFIX}/lib/ldapbrowser ; tar xf - )
	${ECHO_CMD} "cd ${TRUE_PREFIX}/lib/ldapbrowser" > ${PREFIX}/bin/ldapbrowser
	${ECHO_CMD} "sh ${TRUE_PREFIX}/lib/ldapbrowser/lbe.sh" >> ${PREFIX}/bin/ldapbrowser
	${CHMOD} +x ${PREFIX}/bin/ldapbrowser

.include <bsd.port.mk>
