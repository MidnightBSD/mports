PORTNAME=	fastapi
PORTVERSION=	0.142.2
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance Python API Framework
WWW=		https://github.com/tiangolo/fastapi

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>=0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pydantic2>=2.9.0:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}starlette>=0.46.0:www/py-starlette@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uvicorn>=0:www/py-uvicorn@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}annotated-doc>=0.0.2:devel/py-annotated-doc@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.8.0:devel/py-typing-extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-inspection>=0.4.2:devel/py-typing-inspection@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-api>=1.44.0:devel/py-opentelemetry-api@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}inline-snapshot>=0.21.1:devel/py-inline-snapshot@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}dirty-equals>=0.9.0:devel/py-dirty-equals@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typer>=0.26.1:devel/py-typer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ujson>=0:devel/py-ujson@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}a2wsgi>=1.9.0<2.0.1:www/py-a2wsgi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyjwt>=2.9.0:www/py-pyjwt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flask>=3.0.0<4.0.0:www/py-flask@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}strawberry-graphql>=0.200.0<1.0.0:devel/py-strawberry-graphql@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic-settings>=2.0.0:devel/py-pydantic-settings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlmodel>=0.0.31:databases/py-sqlmodel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9.0.0:devel/py-pytest@${PY_FLAVOR}

USES=		cpe python:3.10+
CPE_VENDOR=	${PORTNAME}_project
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

.include <bsd.port.mk>
