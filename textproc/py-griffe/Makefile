PORTNAME=	griffe
DISTVERSION=	1.15.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Signatures for entire Python programs
WWW=		https://github.com/mkdocstrings/griffe

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}colorama>=0.4:devel/py-colorama@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517
# These tests require py-griffe-inherited-docstrings which isn't ported, yet.
PYTEST_IGNORED_TESTS=	test_alias_proxies test_exposed_objects test_load_git \
			test_no_module_docstrings_in_internal_api \
			test_single_locations test_unique_names

NO_ARCH=	yes
# tests have circular dep
NO_TEST=	yes

.include <bsd.port.mk>
