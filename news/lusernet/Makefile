PORTNAME=	lusernet
PORTVERSION=	0.4.2
PORTREVISION=	5
CATEGORIES=	news gnustep
MASTER_SITES=	FREEBSD_LOCAL/dinoex
DISTNAME=	LuserNET-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep news reader

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build
LIB_DEPENDS=	libPantomime.so:mail/pantomime

ADDITIONAL_CPPFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/LuserNET.app/LuserNET

.include <bsd.port.mk>
