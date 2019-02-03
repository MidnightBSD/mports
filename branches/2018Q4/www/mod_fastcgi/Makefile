# $MidnightBSD$

PORTNAME=	mod_fastcgi
PORTVERSION=	2.4.7
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://www.fastcgi.com/dist/ \
		FREEBSD_LOCAL/ohauer
DISTNAME=	mod_fastcgi-SNAP-0910052141
DIST_SUBDIR=	apache2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache 2.2 fast-cgi module

LICENSE=	other

USE_APACHE=	22+
AP_FAST_BUILD=	yes
AP_GENPLIST=	yes
SRC_FILE=	*.c
PORTDOCS=	mod_fastcgi.html

FAKE_OPTS=	prefixhack

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/docs/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
