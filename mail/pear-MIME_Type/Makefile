PORTNAME=	MIME_Type
PORTVERSION=	1.4.1
CATEGORIES=	mail www pear

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEAR class for dealing with MIME types
WWW=		https://pear.php.net/package/MIME_Type

LICENSE=	lgpl3

OPTIONS_DEFINE=	PEAR_SYSTEM_COMMAND
PEAR_SYSTEM_COMMAND_DESC=	PEAR::System_Command support

USES=		pear
NO_ARCH=	yes

PEAR_SYSTEM_COMMAND_RUN_DEPENDS=	${PEARDIR}/System/Command.php:devel/pear-System_Command@${PHP_FLAVOR}

.include <bsd.port.mk>
