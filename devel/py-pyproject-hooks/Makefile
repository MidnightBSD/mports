PORTNAME=	pyproject-hooks
PORTVERSION=	1.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pyproject_hooks-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrappers to call pyproject.toml-based build backend hooks
WWW=		https://pyproject-hooks.readthedocs.io/en/latest/ \
		https://github.com/pypa/pyproject-hooks

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

PEP517_BUILD_CMD=	${PYTHON_CMD} -m flit_core.wheel
PEP517_BUILD_DEPEND=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2<4:devel/py-flit-core@${PY_FLAVOR}

.include <bsd.port.mk>
