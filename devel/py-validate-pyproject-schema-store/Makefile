PORTNAME=	validate-pyproject-schema-store
PORTVERSION=	2026.9.25
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	validate_pyproject_schema_store-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plugin set for validate-pyproject and schema-store
WWW=		https://github.com/henryiii/validate-pyproject-schema-store

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.26:devel/py-hatchling@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}fastjsonschema>=2.22.1:devel/py-fastjsonschema@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
