PORTNAME=	Horde_Crypt
DISTVERSION=	2.7.12
CATEGORIES=	security www pear
PKGNAMEPREFIX=	${PEAR_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde Cryptography API
WWW=		https://pear.horde.org

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	BCMATH
BCMATH_DESC=	Depend on bcmath PHP extension

USES=		horde php cpe
USE_HORDE_RUN=	Horde_Exception \
		Horde_Mime \
		Horde_Stream_Filter \
		Horde_Translation \
		Horde_Util

BCMATH_USE=	PHP=bcmath

.include <bsd.port.mk>
