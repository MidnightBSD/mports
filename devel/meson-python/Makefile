PORTNAME=	meson-python
DISTVERSION=	0.16.0
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	meson_python-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meson Python build backend (PEP-517)
WWW=		https://github.com/mesonbuild/meson-python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	meson:devel/meson@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0.19.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyproject-metadata>=0.7.1:devel/py-pyproject-metadata@${PY_FLAVOR} \
		${PY_TOMLI}
RUN_DEPENDS=	meson:devel/meson@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0.19.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyproject-metadata>=0.7.1:devel/py-pyproject-metadata@${PY_FLAVOR} \
		${PY_TOMLI}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
