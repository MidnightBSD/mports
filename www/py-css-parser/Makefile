PORTNAME=	css-parser
PORTVERSION=	1.1.1
DISTVERSIONPREFIX=	v
CATEGORIES=	www python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS related utilities (parsing, serialization, etc) for python
WWW=		https://github.com/ebook-utils/css-parser

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKDIR}/COPYING.combined

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python python-setuptools:78
USE_GITHUB=	yes
GH_ACCOUNT=	ebook-utils
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

post-extract:
	${CAT} ${WRKSRC}/COPYING.LESSER ${WRKSRC}/COPYING > ${LICENSE_FILE}

do-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} ${PYTHON_CMD} run_tests.py

.include <bsd.port.mk>
