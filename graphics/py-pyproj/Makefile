PORTNAME=	pyproj
PORTVERSION=	3.7.2
PORTREVISION=	1
CATEGORIES=	graphics geography python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cython wrapper to provide python interfaces to PROJ.4 functions
WWW=		https://pyproj4.github.io/pyproj/stable/ \
		https://github.com/pyproj4/pyproj

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	proj>=9.4.0,1:graphics/proj \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libproj.so:graphics/proj
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}certifi>=0:security/py-certifi@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent cython pep517

MAKE_ENV=	PROJ_DIR=${LOCALBASE}

OPTIONS_DEFINE=	DOCS EXAMPLES

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.md ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/docs/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/test/sample.out ${WRKSRC}/test/test_*.py ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
