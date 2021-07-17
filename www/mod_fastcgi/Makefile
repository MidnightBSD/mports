PORTNAME=	mod_fastcgi
PORTVERSION=	2.4.7.1
CATEGORIES=	www
DIST_SUBDIR=	apache2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache 2.4 fast-cgi module

LICENSE=	other

USES=		apache:2.4+

USE_GITHUB=	yes
GH_ACCOUNT=	FastCGI-Archives

AP_FAST_BUILD=	yes
AP_GENPLIST=	yes
SRC_FILE=	*.c
PORTDOCS=	mod_fastcgi.html

FAKE_OPTS=	prefixhack

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/docs/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
