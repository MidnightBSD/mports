# New ports collection makefile for:	bsdstats
# Date created:		5 August 2006
# Whom:			Marc G. Fournier <scrappy@freebsd.org>
#
# $FreeBSD: ports/sysutils/bsdstats/Makefile,v 1.47 2006/12/09 06:06:13 scrappy Exp $
# $MidnightBSD: mports/sysutils/bsdstats/Makefile,v 1.3 2007/10/10 20:56:02 ctriv Exp $ 
#

PORTNAME=	bsdstats
PORTVERSION=	5.4
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine
LICENSE=	unknown

.include <bsd.port.pre.mk>

NO_BUILD=	yes
PLIST_FILES=	etc/periodic/monthly/300.statistics \
		etc/rc.d/bsdstats.sh
PLIST_DIRS=	etc/periodic/monthly \
		etc/periodic

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/monthly
	${CP} ${FILESDIR}/300.statistics ${PREFIX}/etc/periodic/monthly
	${CP} ${FILESDIR}/bsdstats.sh ${PREFIX}/etc/rc.d
	${CHMOD} 0755 ${PREFIX}/etc/rc.d/bsdstats.sh

.include <bsd.port.post.mk>
