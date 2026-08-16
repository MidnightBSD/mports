PORTNAME=	prefix
PORTVERSION=	1.2.10
PORTREVISION=	1
DISTVERSIONPREFIX=	v
CATEGORIES=	databases
PKGNAMEPREFIX=	postgresql${PGSQL_VER:S/.//}-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Prefix Range module for PostgreSQL
WWW=		https://github.com/dimitri/prefix

LICENSE=	pgsql

USES=		gmake pgsql:11+
WANT_PGSQL=	server
USE_GITHUB=	yes
GH_ACCOUNT=	dimitri

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/postgresql/prefix.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} ;	${INSTALL_DATA} README.md TESTS.md ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
