PORTNAME=	mistral-vibe
PORTVERSION=	3.0.3
CATEGORIES=	ai python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	mistral_vibe-${PORTVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mistral CLI coding assistant
WWW=		https://github.com/mistralai/mistral-vibe

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}maturin>=1.13.3:devel/py-maturin@${PY_FLAVOR} \
		${LOCALBASE}/llvm21/bin/clang:devel/llvm21 \
		gn:devel/gn \
		ninja:devel/ninja
LIB_DEPENDS=	libonig.so:devel/oniguruma
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}agent-client-protocol>=0.11.0:devel/py-agent-client-protocol@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}annotated-types>=0.7.0:devel/py-annotated-types@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}anyio>=4.5:devel/py-anyio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}beautifulsoup>=4.9:www/py-beautifulsoup@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cachetools>=0:devel/py-cachetools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}certifi>=0:security/py-certifi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cffi>=0:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}charset-normalizer>=0:textproc/py-charset-normalizer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click>=8:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cryptography>=0:security/py-cryptography@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}croniter>=6.2.4:sysutils/py-croniter@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}eval-type-backport>=0.3.1:devel/py-eval-type-backport@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}gitdb>=0:devel/py-gitdb@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}GitPython>=0:devel/py-gitpython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}giturlparse>=0.15.0:devel/py-giturlparse@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=0:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}googleapis-common-protos>=0:devel/py-googleapis-common-protos@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}h11>=0:net/py-h11@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpcore>=1<2:www/py-httpcore@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpcore2>=2.16.0:www/py-httpcore2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx>=0.28.1:www/py-httpx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx2>=2.16.0:www/py-httpx2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httpx-sse>=0.4:www/py-httpx-sse@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}humanize>=0:devel/py-humanize@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}idna>=0:dns/py-idna@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jaraco.classes>=0:devel/py-jaraco.classes@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jaraco.context>=0:devel/py-jaraco.context@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jaraco.functools>=0:devel/py-jaraco.functools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonpatch>=0:devel/py-jsonpatch@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonpath-python>=1.1.5:devel/py-jsonpath-python@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonpointer>=0:devel/py-jsonpointer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema>=0:devel/py-jsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema-specifications>=0:devel/py-jsonschema-specifications@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}keyring>=0:security/py-keyring@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}linkify-it-py>=0:textproc/py-linkify-it-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markdown-it-py>=0:textproc/py-markdown-it-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markdownify>=0:textproc/py-markdownify@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mcp>=1.28.1:misc/py-mcp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mdit-py-plugins>=0:textproc/py-mdit-py-plugins@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mdurl>=0:textproc/py-mdurl@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mistralai>=3.5.0:devel/py-mistralai@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}more-itertools>=0:devel/py-more-itertools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-api>=1.45.1:devel/py-opentelemetry-api@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-exporter-http-transport>=0.66b1:devel/py-opentelemetry-exporter-http-transport@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-exporter-otlp-common>=0.66b1:devel/py-opentelemetry-exporter-otlp-common@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-exporter-otlp-proto-common>=1.45.1:devel/py-opentelemetry-exporter-otlp-proto-common@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-exporter-otlp-proto-http>=1.45.1:devel/py-opentelemetry-exporter-otlp-proto-http@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-proto>=1.45.1:devel/py-opentelemetry-proto@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-sdk>=1.45.1:devel/py-opentelemetry-sdk@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-semantic-conventions>=0.66b1:devel/py-opentelemetry-semantic-conventions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pexpect>=0:misc/py-pexpect@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}platformdirs>=0:devel/py-platformdirs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>=0:devel/py-protobuf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ptyprocess>=0:sysutils/py-ptyprocess@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1>=0:devel/py-pyasn1@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyasn1-modules>=0:devel/py-pyasn1-modules@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pycparser>=0:devel/py-pycparser@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic2>=2.11.2:devel/py-pydantic2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic-core>=2.46.3:devel/py-pydantic-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic-settings>=2.6.0:devel/py-pydantic-settings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=0:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyjwt>=0:www/py-pyjwt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyperclip>=0:devel/py-pyperclip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dateutil>=0:devel/py-python-dateutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dotenv>=0:www/py-python-dotenv@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-multipart>=0:www/py-python-multipart@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}referencing>=0:devel/py-referencing@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rfc8785>=0:devel/py-rfc8785@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=0:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rpds-py>=0:devel/py-rpds-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sentry-sdk>=0:devel/py-sentry-sdk@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setproctitle>=0:devel/py-setproctitle@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}smmap>=0:devel/py-smmap@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}soupsieve>=0:www/py-soupsieve@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sse-starlette>=0:www/py-sse-starlette@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}starlette>=0:www/py-starlette@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}textual>=8.2.8:textproc/py-textual@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}textual-speedups>=0:textproc/py-textual-speedups@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tomli-w>=0:textproc/py-tomli-w@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tree-sitter>=0.26.0:devel/py-tree-sitter@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tree-sitter-bash>=0.25.1:devel/py-tree-sitter-bash@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}truststore>=0:security/py-truststore@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=0:devel/py-typing-extensions@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-inspection>=0:devel/py-typing-inspection@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uc-micro-py>=0:textproc/py-uc-micro-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}urllib3>=0:net/py-urllib3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uuid-utils>=1.0.0:misc/py-uuid-utils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uvicorn>=0:www/py-uvicorn@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}watchfiles>=0:devel/py-watchfiles@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}websockets>=0:devel/py-websockets@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}zstandard>=0:archivers/py-zstandard@${PY_FLAVOR}

USES=		cargo python:3.12+
USE_PYTHON=	autoplist concurrent pep517

CARGO_CARGOTOML=	${WRKSRC}/vibe/cli-rust/Cargo.toml
CARGO_CARGOLOCK=	${WRKSRC}/vibe/cli-rust/Cargo.lock
CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no
CARGO_CONFIGURE=	no
V8_DISTDIR=	${CARGO_VENDOR_DIR}/v8-150.3.0
ICUDATA_DIR=	${CARGO_VENDOR_DIR}/deno_core_icudata-0.77.0/src
TEMPORAL_CAPI_DIR=	${CARGO_VENDOR_DIR}/temporal_capi-0.2.4
TEMPORAL_CAPI_LIB=	${WRKDIR}/libtemporal_capi.a
LLVM_PREFIX=	${LOCALBASE}/llvm21
V8_GN_ARGS=	clang_use_chrome_plugins=false \
		fatal_linker_warnings=false \
		is_clang=true \
		use_glib=false \
		use_sysroot=false
MAKE_ENV+=	${CARGO_ENV} MATURIN_NO_INSTALL_RUST=1 \
		CARGO_BUILD_FLAGS=--no-default-features V8_FROM_SOURCE=1 \
		GN=${LOCALBASE}/bin/gn NINJA=${LOCALBASE}/bin/ninja \
		LIBCLANG_PATH=${LLVM_PREFIX}/lib CLANG_BASE_PATH=${LLVM_PREFIX} \
		GN_ARGS="${V8_GN_ARGS}"

post-patch:
	@${REINPLACE_CMD} -e 's,maturin==1.14.1,maturin>=1.13.3,' \
		${WRKSRC}/pyproject.toml
	@${REINPLACE_CMD} -e 's|%%LLVM_PREFIX%%|${LLVM_PREFIX}|g' \
		${V8_DISTDIR}/build/toolchain/gcc_toolchain.gni
	@${REINPLACE_CMD} -e 's|%%TEMPORAL_CAPI_DIR%%|${TEMPORAL_CAPI_DIR}|g' \
		-e 's|%%TEMPORAL_CAPI_LIB%%|${TEMPORAL_CAPI_LIB}|g' \
		${V8_DISTDIR}/third_party/rust/temporal_capi/BUILD.gn
	@${MKDIR} ${V8_DISTDIR}/third_party/icu/common
	@${CP} ${ICUDATA_DIR}/icudtl.dat ${V8_DISTDIR}/third_party/icu/common/
	@${MKDIR} ${WRKDIR}/.cargo
	@${ECHO_CMD} '[source.crates-io]' > ${WRKDIR}/.cargo/config.toml
	@${ECHO_CMD} 'replace-with = "vendor"' >> ${WRKDIR}/.cargo/config.toml
	@${ECHO_CMD} '[source.vendor]' >> ${WRKDIR}/.cargo/config.toml
	@${ECHO_CMD} 'directory = "${CARGO_VENDOR_DIR}"' >> ${WRKDIR}/.cargo/config.toml

pre-build:
	@${CARGO_CARGO_RUN} rustc --manifest-path ${WRKSRC}/harness/core/Cargo.toml \
		${CARGO_BUILD_ARGS} --package temporal_capi --lib --crate-type staticlib
	@${CP} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/libtemporal_capi.a \
		${TEMPORAL_CAPI_LIB}

.include "Makefile.crates"

.include <bsd.port.mk>
