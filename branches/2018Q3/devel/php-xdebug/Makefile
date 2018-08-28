# $MidnightBSD$

PORTNAME=	xdebug
PORTVERSION=	2.2.5
CATEGORIES=	devel
MASTER_SITES=	http://www.xdebug.org/files/
PKGNAMEPREFIX=	php-
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xdebug extension for PHP

LICENSE=	other

CONFIGURE_ARGS=	--enable-xdebug
USE_PHP=	yes
USE_PHPEXT=	yes
USE_PHPIZE=	yes
SUB_FILES=	pkg-message

PKGMESSAGE=	${WRKDIR}/pkg-message
IGNORE_WITH_PHP=	70

.include <bsd.port.mk>
