PORTNAME=	asyncpg
PORTVERSION=	0.31.0
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance PostgreSQL Client Library for Python/asyncio
WWW=		https://github.com/MagicStack/asyncpg/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cython>=3.2.1<4.0.0:lang/cython@${PY_FLAVOR}

USES=		cpe pgsql:11+ python:3.9+ python-setuptools:78
CPE_VENDOR=	magic
USE_PYTHON=	autoplist concurrent pep517

# C11 thread entry points are unavailable; use Cython's pthread lock path.
CFLAGS+=	-D__STDC_NO_THREADS__=1

OPTIONS_DEFINE=	DOCS
PORTDOCS=	PKG-INFO README.rst

post-extract:
	@${RM} ${WRKSRC}/asyncpg/pgproto/*.c
	@${RM} ${WRKSRC}/asyncpg/protocol/*.c

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/asyncpg/protocol/protocol*.so
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/asyncpg/pgproto/pgproto*.so

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}async_timeout>=4.0.3:devel/py-async_timeout@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
