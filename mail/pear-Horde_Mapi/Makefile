PORTNAME=	Horde_Mapi
PORTVERSION=	1.0.10
CATEGORIES=	mail www pear
PKGNAMEPREFIX=	${PEAR_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Horde MAPI utility library
WWW=		https://pear.horde.org

USES=		horde php cpe
USE_HORDE_RUN=	Horde_Date \
		Horde_Exception

USE_PHP+=	bcmath

RUN_DEPENDS+=	${PEARDIR}/Math/BigInteger.php:math/pear-Math_BigInteger@${PHP_FLAVOR}

.include <bsd.port.mk>
