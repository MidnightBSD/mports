# Created by: Guixing Bai <khsing.cn@gmail.com>

PORTNAME=	tornado
PORTVERSION=	6.1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Web Server from FriendFeed

LICENSE=	apache2

USES=		python:3.5+
USE_PYTHON=	autoplist concurrent distutils

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}tornado4 \
			${PYTHON_PKGNAMEPREFIX}tornado5 \
			${PYTHON_PKGNAMEPREFIX}tornado6

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/tornado/speedups*.so

.include <bsd.port.mk>
