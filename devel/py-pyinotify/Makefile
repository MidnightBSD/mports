PORTNAME=	pyinotify
PORTVERSION=	0.9.6
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to (lib)inotify

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libinotify.so:devel/libinotify

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

.include <bsd.port.mk>
