# $MidnightBSD$

PORTNAME=	mod_fastcgi
PORTVERSION=	2.4.7
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	http://www.fastcgi.com/dist/ \
		FREEBSD_LOCAL/ohauer
DISTNAME=	mod_fastcgi-SNAP-0910052141
DIST_SUBDIR=	apache2

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Apache 2.2 Fast-cgi module

LICENSE=	other

USE_APACHE=	22+
AP_FAST_BUILD=	yes
AP_GENPLIST=	yes
SRC_FILE=	*.c
PORTDOCS=	LICENSE.TERMS mod_fastcgi.html

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
