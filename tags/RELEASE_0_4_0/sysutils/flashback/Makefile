# New ports collection makefile for:	flashback
# Date created:		November 24, 2008
# Whom:			Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/sysutils/flashback/Makefile,v 1.2 2009/06/04 00:14:16 laffer1 Exp $

PORTNAME=	flashback
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Backup content from any volume to a tarball
LICENSE=	bsd2

MAKE_JOBS_SAFE=	yes

WRKSRC=		${WRKDIR}/flashback

USE_GMAKE=	yes

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/flashback.sh ${PREFIX}/etc/rc.d/flashback

.include <bsd.port.mk>
