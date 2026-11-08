PORTNAME=	regex
DISTVERSION=	2026.9.29
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternative regular expression module, to replace re
WWW=		https://github.com/mrabarnett/mrab-regex

LICENSE=	Apache-2.0 CNRI-Python
LICENSE_COMB=	multi
LICENSE_NAME_CNRI-Python=	CNRI Python 1.6 license
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_CNRI-Python=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS_CNRI-Python=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist pep517 unittest

TEST_WRKSRC=	${WRKDIR}
TEST_ARGS=	discover -s ${WRKSRC}/regex/tests

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/regex/_regex*.so

.include <bsd.port.mk>
