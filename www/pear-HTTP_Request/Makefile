PORTNAME=	HTTP_Request
PORTVERSION=	1.4.4
CATEGORIES=	www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR classes providing an easy way to perform HTTP requests

LICENSE=	bsd3

BUILD_DEPENDS=	${PEARDIR}/Net/URL.php:net/pear-Net_URL@${PHP_FLAVOR}		\
		${PEARDIR}/Net/Socket.php:net/pear-Net_Socket@${PHP_FLAVOR}
RUN_DEPENDS=	${PEARDIR}/Net/URL.php:net/pear-Net_URL@${PHP_FLAVOR}		\
		${PEARDIR}/Net/Socket.php:net/pear-Net_Socket@${PHP_FLAVOR}

USES=		pear

.include <bsd.port.mk>
