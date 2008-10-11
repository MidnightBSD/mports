# New ports collection makefile for:	midnightbsd-stats
# Date created:		7 October 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/sysutils/bsdstats/Makefile,v 1.7 2008/09/03 01:40:12 laffer1 Exp $ 
#

PORTNAME=	midnightbsd-stats
PORTVERSION=	1.0
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine
LICENSE=	unknown

.include <bsd.port.pre.mk>

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/monthly
	${INSTALL_SCRIPT} ${FILESDIR}/310.statistics ${PREFIX}/etc/periodic/monthly
	${INSTALL_SCRIPT} ${FILESDIR}/midnightbsd-stats.sh ${PREFIX}/etc/rc.d

.include <bsd.port.post.mk>
