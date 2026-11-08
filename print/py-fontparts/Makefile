PORTNAME=	fontparts
PORTVERSION=	1.1.1
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API for interacting with the parts of fonts during the font development process
WWW=		https://github.com/robotools/fontParts

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=9.2.2:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}vcs-versioning>=0:devel/py-vcs-versioning@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}booleanOperations>=0.10.0:x11-fonts/py-booleanOperations@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}defcon>=0.12.2:x11-fonts/py-defcon@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fontMath>=0.9.4:x11-fonts/py-fontMath@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fontpens>=0.1.0:print/py-fontpens@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=4.60.2:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lxml>=4.0:devel/py-lxml@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC}/Lib

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}unicodedata2>=17.0.0:devel/py-unicodedata2@${PY_FLAVOR}
.endif

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} Lib/fontParts/fontshell/test.py

.include <bsd.port.post.mk>
