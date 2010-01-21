# $MidnightBSD$

PORTNAME=	lusernet
PORTVERSION=	0.4.2
CATEGORIES=	news gnustep
MASTER_SITES=	http://web.telia.com/~u42308495/alex/LuserNET/
DISTNAME=	LuserNET-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep news reader
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	Pantomime:${PANTOMIME_PORT}

PANTOMIME_PORT?=	mail/pantomime

.include <bsd.port.mk>
