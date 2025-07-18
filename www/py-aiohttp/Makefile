PORTNAME=	aiohttp
PORTVERSION=	3.9.3
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Async http client/server framework (asyncio)
WWW=		https://docs.aiohttp.org/en/stable/ \
		https://github.com/aio-libs/aiohttp

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=46.4.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiosignal>=1.1.2:devel/py-aiosignal@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=17.3.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}frozenlist>=1.1.1:devel/py-frozenlist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}multidict>=4.5<7.0:www/py-multidict@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}yarl>=1.0<2.0:www/py-yarl@${PY_FLAVOR}

NO_TEST=	yes
USES=		cpe python
USE_PYTHON=	autoplist concurrent cython pep517

CPE_VENDOR=	aiohttp_project

OPTIONS_DEFINE=	SPEEDUPS
SPEEDUPS_DESC=	Performance speedups

SPEEDUPS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiodns>=0:dns/py-aiodns@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}brotli>=0:archivers/py-brotli@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}async_timeout>=4.0<5.0:devel/py-async_timeout@${PY_FLAVOR}
.endif

pre-configure:
.for file in _helpers _http_parser _http_writer _websocket
	@cd ${WRKSRC} && ${RM} aiohttp/${file}.c && cython-${PYTHON_VER} -3 -I aiohttp -o aiohttp/${file}.c aiohttp/${file}.pyx
.endfor

post-install:
	${FIND} ${STAGEDIR}${PYTHONPREFIX_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.post.mk>
