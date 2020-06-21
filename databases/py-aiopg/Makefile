# Created by: Babak Farrokhi <farrokhi@FreeBSD.org>

PORTNAME=	aiopg
PORTVERSION=	0.16.0
PORTREVISION=	1
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for accessing PostgreSQL database using asyncio

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}psycopg2>=2.7.0:databases/py-psycopg2@${PY_FLAVOR}

OPTIONS_DEFINE=	DOCS

USES=		pgsql:9.2+ python:3.4+
USE_PYTHON=	autoplist concurrent distutils

PORTDOCS=	PKG-INFO README.rst CHANGES.txt

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
