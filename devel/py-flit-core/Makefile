PORTNAME=	flit-core
PORTVERSION=	3.12.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	flit_core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distribution-building parts of Flit
WWW=		https://flit.pypa.io/en/stable/ \
		https://github.com/pypa/flit/tree/main/flit_core

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

#TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}testpath>=0:devel/py-testpath@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517 
#pytest

NO_ARCH=	yes
# circular reference
NO_TEST=	yes

PEP517_BUILD_CMD=	${PYTHON_CMD} -m flit_core.wheel
PEP517_BUILD_DEPEND=	# empty
PEP517_INSTALL_CMD=	${PYTHON_CMD} ${WRKSRC}/bootstrap_install.py --installdir ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} ${WRKSRC}/dist/${DISTNAME}*.whl
PEP517_INSTALL_DEPEND=	# empty

.include <bsd.port.mk>
