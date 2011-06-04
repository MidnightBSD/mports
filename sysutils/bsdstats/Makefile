# New ports collection makefile for:	bsdstats
# Date created:		5 August 2006
# Whom:			Marc G. Fournier <scrappy@freebsd.org>
#
# $FreeBSD: ports/sysutils/bsdstats/Makefile,v 1.47 2006/12/09 06:06:13 scrappy Exp $
# $MidnightBSD: mports/sysutils/bsdstats/Makefile,v 1.8 2009/09/25 02:22:37 laffer1 Exp $ 
#

PORTNAME=	bsdstats
PORTVERSION=	5.5
PORTREVISION=	1
CATEGORIES=	sysutils
DISTFILES=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monthly script for reporting anonymous statistics about your machine
LICENSE=	unknown

USE_RC_SUBR=	bsdstats

NO_BUILD=	yes

do-install:
	${MKDIR} ${PREFIX}/etc/periodic/monthly
	${INSTALL_SCRIPT} ${FILESDIR}/300.statistics ${PREFIX}/etc/periodic/monthly

.include <bsd.port.mk>
