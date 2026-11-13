PORTNAME=	youseedee
PORTVERSION=	0.7.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		https://raw.githubusercontent.com/simoncozens/youseedee/ef1d2d5c7d188e26a8c91ccb82a0abaaf417407e/:lic
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} LICENSE:lic
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface to the Unicode Character Database
WWW=		https://github.com/simoncozens/youseedee

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8.1.0:devel/py-setuptools-scm@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}filelock>=0:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}platformdirs>=4.3:devel/py-platformdirs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=0:www/py-requests@${PY_FLAVOR} \
		UCD>=0:textproc/UCD

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

# Backport the upstream license clarification for the unchanged 0.7.0 code.
post-extract:
	${CP} ${_DISTDIR}/LICENSE ${WRKSRC}/LICENSE

post-patch:
	@${REINPLACE_CMD} -e 's|%%UCDDIR%%|${LOCALBASE}/share/unicode/ucd|g' ${WRKSRC}/lib/youseedee/__init__.py

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} PYTHONPATH=${WRKSRC}/lib ${PYTHON_CMD} -m pytest tests

.include <bsd.port.mk>
