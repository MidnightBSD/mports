# New ports collection makefile for:	flashback
# Date created:		November 24, 2008
# Whom:			Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$

PORTNAME=	flashback
PORTVERSION=	1.2.0
CATEGORIES=	sysutils

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Backup content from any volume to a tarball

LICENSE=	bsd2

WRKSRC=		${WRKDIR}/flashback-${PORTVERSION}/src

USES=		gmake
USE_GITHUB=     yes
GH_COMMIT=      9d2fdec
GH_PROJECT=     ${PORTNAME}
GH_ACCOUNT=     laffer1

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/flashback.sh ${PREFIX}/etc/rc.d/flashback

.include <bsd.port.mk>
