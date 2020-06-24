PORTNAME=	simplejson
PORTVERSION=	3.17.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple, fast, extensible JSON encoder/decoder

# dual-licensed under MIT and Academic Free License version 2.1
LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/simplejson/_speedups.so

.include <bsd.port.mk>
