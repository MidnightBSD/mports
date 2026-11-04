# Created by: Thomas Gellekum <tg@FreeBSD.org>

PORTNAME=	gshisen
PORTVERSION=	1.3.0
PORTREVISION=	1
CATEGORIES=	games gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	GShisen-${PORTVERSION}

MAINTAINER=	ports@MinightBSD.org
COMMENT=	Shisen-sho puzzle game for GNUstep
WWW=		https://gap.nongnu.org/gshisen/index.html

LICENSE=	gpl2+

USES=		gnustep
USE_GNUSTEP=	back build

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/GShisen.app/GShisen

.include <bsd.port.mk>
