PORTNAME=	yamllint
PORTVERSION=	1.37.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linter for YAML files
WWW=		https://github.com/adrienverge/yamllint

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pathspec>=0.5.3:devel/py-pathspec@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}


USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
