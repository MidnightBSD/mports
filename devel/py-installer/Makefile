PORTNAME=	installer
PORTVERSION=	0.7.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for installing Python wheels
WWW=		https://installer.pypa.io/en/stable/ \
		https://github.com/pypa/installer

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

MAKE_ENV=	PYTHONPATH=${WRKSRC}/src
NO_ARCH=	yes

PEP517_BUILD_CMD=	${PYTHON_CMD} -m flit_core.wheel
PEP517_BUILD_DEPEND=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2.0<4:devel/py-flit-core@${PY_FLAVOR}
PEP517_INSTALL_DEPEND=	# empty

.include <bsd.port.mk>
