PORTNAME=	headroom-ai
DISTVERSION=	0.27.0
PORTREVISION=	1
CATEGORIES=	misc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Context optimization layer for LLM applications
WWW=		https://github.com/chopratejas/headroom

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}maturin>=1.5<2.0:devel/py-maturin@${PY_FLAVOR}
LIB_DEPENDS=	libonig.so:devel/oniguruma
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ast-grep-cli>=0.30.0:devel/py-ast-grep-cli@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click>=8.1.0:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}litellm>=1.86.2:misc/py-litellm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}openai>=2.14.0:misc/py-openai@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-api>=1.24.0:devel/py-opentelemetry-api@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=2.0.0:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=13.0.0:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tiktoken>=0.5.0:textproc/py-tiktoken@${PY_FLAVOR}

USES=		cargo python
USE_PYTHON=	autoplist concurrent pep517
USE_RC_SUBR=	headroom
SUB_FILES=	pkg-message

CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no

MAKE_ENV=	${CARGO_ENV}

OPTIONS_DEFINE=	PROXY
OPTIONS_DEFAULT=	PROXY
PROXY_DESC=	Install lightweight dependencies for headroom proxy service

PROXY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fastapi>=0.100.0:www/py-fastapi@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}httpx>=0.24.0:www/py-httpx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}uvicorn>=0.23.0:www/py-uvicorn@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}watchdog>=4.0.0:devel/py-watchdog@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}websockets>=13.0:devel/py-websockets@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}zstandard>=0.20.0:archivers/py-zstandard@${PY_FLAVOR}

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/headroom/_core*.so

.include <bsd.port.mk>
