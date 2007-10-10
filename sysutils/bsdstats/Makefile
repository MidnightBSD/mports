# New ports collection makefile for:	bsdstats
# Date created:		5 August 2006
# Whom:			Marc G. Fournier <scrappy@freebsd.org>
#
# $FreeBSD: ports/sysutils/bsdstats/Makefile,v 1.47 2006/12/09 06:06:13 scrappy Exp $
# $MidnightBSD: mports/sysutils/bsdstats/Makefile,v 1.2 2007/04/28 05:53:51 ctriv Exp $ 
#

PORTNAME=	bsdstats
PORTVERSION=	5.3
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine
LICENSE=	unknown

.include <bsd.port.pre.mk>

NO_BUILD=	yes
PLIST_FILES=	etc/periodic/monthly/300.statistics
PLIST_DIRS=	etc/periodic/monthly \
		etc/periodic

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/monthly
	${CP} ${FILESDIR}/300.statistics ${PREFIX}/etc/periodic/monthly

.include <bsd.port.post.mk>
