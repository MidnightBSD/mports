PORTNAME=	tomlkit
PORTVERSION=	0.15.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		https://github.com/sdispater/tomlkit/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Style-preserving TOML library
WWW=		https://tomlkit.readthedocs.io/en/latest/ \
		https://github.com/python-poetry/tomlkit

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=6.0:devel/py-pyyaml@${PY_FLAVOR}

USES=		python:3.9+ shebangfix
USE_PYTHON=	allflavors autoplist concurrent pep517 pytest

NO_ARCH=	yes

SHEBANG_FILES=	tests/toml-test/gen.py
PYTHON_TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC}/tomlkit:${WRKSRC}

post-patch:
	@${MV} ${WRKSRC}/tests ${WRKSRC}/tomlkit

.include <bsd.port.mk>
