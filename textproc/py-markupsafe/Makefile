PORTNAME=	markupsafe
PORTVERSION=	3.0.3
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		https://github.com/pallets/markupsafe/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implements XML/HTML/XHTML Markup safe string for Python
WWW=		https://markupsafe.palletsprojects.com/en/stable/ \
		https://github.com/pallets/markupsafe

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	allflavors autoplist concurrent pep517 pytest

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
