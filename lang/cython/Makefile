PORTNAME=	cython
PORTVERSION=	0.29.21
PORTREVISION=	1
CATEGORIES=	lang python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Cython-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compiler for Writing C Extensions for the Python Language

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		compiler:c11 python:2.7+
USE_PYTHON=	allflavors autoplist concurrent distutils

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/Cython \
		-name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
