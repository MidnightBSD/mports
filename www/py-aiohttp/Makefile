PORTNAME=	aiohttp
PORTVERSION=	3.14.3
CATEGORIES=	www python
MASTER_SITES=	PYPI \
		https://github.com/aio-libs/aiohttp/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Async http client/server framework (asyncio)
WWW=		https://docs.aiohttp.org/en/stable/ \
		https://github.com/aio-libs/aiohttp

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pkgconfig>=0:devel/py-pkgconfig@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libllhttp.so:www/llhttp
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiohappyeyeballs>=2.5.0:net/py-aiohappyeyeballs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}aiosignal>=1.4.0:devel/py-aiosignal@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=17.3.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}frozenlist>=1.1.1:devel/py-frozenlist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}multidict>=4.5<7.0:www/py-multidict@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}propcache>=0.2.0:devel/py-propcache@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}yarl>=1.17.0<2.0:www/py-yarl@${PY_FLAVOR}

USES=		cpe python
USE_PYTHON=	allflavors autoplist concurrent cython pep517

NO_TEST=	yes

CPE_VENDOR=	aiohttp_project

MAKE_ENV=	AIOHTTP_CYTHON_TRACE='' \
		AIOHTTP_NO_EXTENSIONS='' \
		AIOHTTP_USE_SYSTEM_DEPS=1

OPTIONS_DEFINE=	SPEEDUPS
SPEEDUPS_DESC=	Performance speedups

SPEEDUPS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiodns>=3.3.0:dns/py-aiodns@${PY_FLAVOR} \
			${PY_BACKPORTS.ZSTD} \
			${PYTHON_PKGNAMEPREFIX}brotli>=1.2:archivers/py-brotli@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}async_timeout>=4.0<6.0:devel/py-async_timeout@${PY_FLAVOR}
.endif

.if ${PYTHON_REL} < 31300
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.4:devel/py-typing-extensions@${PY_FLAVOR}
.endif

post-patch:
# Clean up bundled libraries
	@${RM} -r ${WRKSRC}/vendor/

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.post.mk>
