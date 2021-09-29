# New ports collection makefile for:	flashback
# Date created:		November 24, 2008
# Whom:			Lucas Holt <luke@MidnightBSD.org>

PORTNAME=	flashback
PORTVERSION=	1.2.3
CATEGORIES=	sysutils

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	Backup content from any volume to a tarball

LICENSE=	bsd2

USES=		gmake
USE_GITHUB=     yes
GH_COMMIT=      3eaed3f
GH_PROJECT=     ${PORTNAME}
GH_ACCOUNT=     laffer1

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/flashback.sh ${PREFIX}/etc/rc.d/flashback

.include <bsd.port.mk>
