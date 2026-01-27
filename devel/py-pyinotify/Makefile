PORTNAME=	pyinotify
PORTVERSION=	0.9.6
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to (lib)inotify
WWW=		https://github.com/seb-m/pyinotify

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libinotify.so:devel/libinotify

USES=		python
USE_PYTHON=	autoplist concurrent distutils

.include <bsd.port.mk>
