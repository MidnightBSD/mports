# $MidnightBSD: mports/www/mod_fastcgi/Makefile,v 1.3 2010/01/24 16:04:48 laffer1 Exp $

PORTNAME=	mod_fastcgi
PORTVERSION=	2.4.7
CATEGORIES=	www
MASTER_SITES=	http://www.fastcgi.com/dist/ \
		FREEBSD_LOCAL/ohauer
DISTNAME=	mod_fastcgi-SNAP-0910052141
DIST_SUBDIR=	apache2

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A fast-cgi module for Apache

LICENSE=	other

USE_APACHE=	22
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
