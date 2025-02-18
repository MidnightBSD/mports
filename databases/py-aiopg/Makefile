PORTNAME=	aiopg
PORTVERSION=	1.4.0
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for accessing PostgreSQL database using asyncio
WWW=		https://github.com/aio-libs/aiopg

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psycopg2>=2.7.0:databases/py-psycopg2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}async_timeout>=3.0.0:devel/py-async_timeout@${PY_FLAVOR}

USES=		pgsql:11+ python
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS
PORTDOCS=	PKG-INFO README.rst CHANGES.txt

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
