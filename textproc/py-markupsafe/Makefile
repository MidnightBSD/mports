PORTNAME=	markupsafe
PORTVERSION=	2.1.2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	MarkupSafe-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implements XML/HTML/XHTML Markup safe string for Python
WWW=		https://github.com/pallets/markupsafe

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent distutils

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
