# New ports collection makefile for:	bsdstats
# Date created:		5 August 2006
# Whom:			Marc G. Fournier <scrappy@freebsd.org>
#
# $FreeBSD: ports/sysutils/bsdstats/Makefile,v 1.47 2006/12/09 06:06:13 scrappy Exp $
# $MidnightBSD: mports/sysutils/bsdstats/Makefile,v 1.7 2008/09/03 01:40:12 laffer1 Exp $ 
#

PORTNAME=	bsdstats
PORTVERSION=	5.5
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine
LICENSE=	unknown

.include <bsd.port.pre.mk>

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/monthly
	${INSTALL_SCRIPT} ${FILESDIR}/300.statistics ${PREFIX}/etc/periodic/monthly
	${INSTALL_SCRIPT} ${FILESDIR}/bsdstats.sh ${PREFIX}/etc/rc.d

.include <bsd.port.post.mk>
