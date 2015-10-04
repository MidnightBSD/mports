# $MidnightBSD$

PORTNAME=	preview
PORTVERSION=	0.8.5
PORTREVISION=	3
CATEGORIES=	graphics gnustep
MASTER_SITES=	http://download.gna.org/gsimageapps/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	Preview-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple image viewer

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnustep
USE_GNUSTEP=	back build

WRKSRC=		${WRKDIR}/Preview

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/Preview.app/Preview

.include <bsd.port.mk>
