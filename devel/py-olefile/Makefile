PORTNAME=	olefile
PORTVERSION=	0.47
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python module to read MS OLE2 files
WWW=		https://www.decalage.info/en/olefile

LICENSE=	bsd2 mit
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

NO_ARCH=	yes
USES=		python zip
USE_PYTHON=	autoplist pep517
TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

do-test:
	@(cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} tests/test_olefile.py)

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
