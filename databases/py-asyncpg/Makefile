PORTNAME=	asyncpg
PORTVERSION=	0.30.0
PORTREVISION=	1
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance PostgreSQL Client Library for Python/asyncio
WWW=		https://github.com/MagicStack/asyncpg/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe pgsql:11+ python
CPE_VENDOR=	magic
USE_PYTHON=	autoplist concurrent cython distutils

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

.include <bsd.port.mk>
