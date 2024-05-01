PORTNAME=	tomlkit
PORTVERSION=	0.12.4
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		https://github.com/sdispater/tomlkit/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Style-preserving TOML library
WWW=		https://tomlkit.readthedocs.io/en/latest/ \
		https://github.com/sdispater/tomlkit

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.0.0:devel/py-poetry-core@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}yaml>=0:devel/py-yaml@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

post-patch:
	@${MV} ${WRKSRC}/tests ${WRKSRC}/tomlkit

.include <bsd.port.mk>
