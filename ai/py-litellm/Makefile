PORTNAME=	litellm
DISTVERSION=	1.109.0
CATEGORIES=	ai python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Call all LLM APIs using the OpenAI format
WWW=		https://github.com/BerriAI/litellm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}maturin>=1.15:devel/py-maturin@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}maturin<2:devel/py-maturin@${PY_FLAVOR} \
		${RUST_DEFAULT}>=1.94.1:lang/${RUST_DEFAULT}
LIB_DEPENDS=	libonig.so:devel/oniguruma
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}filelock>=3.16.1:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}filelock<5.0:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx>=0.28.0:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx<1.0.0:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}openai>=2.20.0:ai/py-openai@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}openai<4.0.0:ai/py-openai@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dotenv>=1.0.0:www/py-python-dotenv@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dotenv<2.0:www/py-python-dotenv@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=6.0.3:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml<7.0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=24.0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}importlib-metadata>=8.0.0:devel/py-importlib-metadata@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}importlib-metadata<9.0.0:devel/py-importlib-metadata@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tokenizers>=0.21.0:textproc/py-tokenizers@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tokenizers<1.0:textproc/py-tokenizers@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}huggingface-hub>=0.34.0:ai/py-huggingface-hub@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}huggingface-hub<2.0:ai/py-huggingface-hub@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click>=8.0.0:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click<9.0:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=3.1.6:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2<4.0.0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}aiohttp>=3.14.2:www/py-aiohttp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}aiohttp<4.0:www/py-aiohttp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}anyio>=4.14.0:devel/py-anyio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}anyio<5.0:devel/py-anyio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic-settings>=2.14.1:devel/py-pydantic-settings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic-settings<3.0:devel/py-pydantic-settings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema>=4.0.0:devel/py-jsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema<5.0.0:devel/py-jsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}boto3>=1.43.117:www/py-boto3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}boto3<2.0:www/py-boto3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}certifi>=2026.10.19:security/py-certifi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.13.0:devel/py-typing-extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions<5.0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		cargo python:3.10-3.15 shebangfix
USE_PYTHON=	autoplist concurrent pep517

SHEBANG_FILES=	litellm/proxy/start.sh
bash_CMD=	${SH}

CARGO_CARGOTOML=${WRKSRC}/litellm-rust/Cargo.toml
CARGO_CARGOLOCK=${WRKSRC}/litellm-rust/Cargo.lock
CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no

MAKE_ENV=	${CARGO_ENV}

BINARY_ALIAS=	python3=${PYTHON_CMD}

REINPLACE_ARGS=	-i ''

PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|python3|${PYTHON_CMD}|' \
		${WRKSRC}/litellm/proxy/start.sh

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}async_timeout>=4.0.3:devel/py-async_timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}async_timeout<6.0:devel/py-async_timeout@${PY_FLAVOR}
.endif
.if ${PYTHON_REL} < 31500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}fastuuid>=0.14.0:devel/py-fastuuid@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fastuuid<1.0:devel/py-fastuuid@${PY_FLAVOR}
.endif
.if ${PYTHON_REL} < 31400
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tiktoken>=0.8.0:textproc/py-tiktoken@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tiktoken<1.0:textproc/py-tiktoken@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=2.11.0:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2<3.0.0:devel/py-pydantic2@${PY_FLAVOR}
.elif ${PYTHON_REL} < 31500
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tiktoken>=0.12.0:textproc/py-tiktoken@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tiktoken<1.0:textproc/py-tiktoken@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=2.12.0:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2<3.0.0:devel/py-pydantic2@${PY_FLAVOR}
.else
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tiktoken>=0.14.0:textproc/py-tiktoken@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tiktoken<1.0:textproc/py-tiktoken@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=2.14.0:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2<3.0.0:devel/py-pydantic2@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
