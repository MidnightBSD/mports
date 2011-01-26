#
# $MidnightBSD: mports/www/mod_fastcgi/Makefile,v 1.2 2010/01/23 21:28:00 laffer1 Exp $
# $FreeBSD: ports/www/mod_fastcgi/Makefile,v 1.24 2007/12/16 12:25:03 pav Exp $
#

PORTNAME=	mod_fastcgi
PORTVERSION=	2.4.6
CATEGORIES=	www
MASTER_SITES=	http://www.fastcgi.com/dist/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A fast-cgi module for Apache
LICENSE=	other

USE_APACHE=	2.2+
AP_FAST_BUILD=	yes
AP_GENPLIST=	yes
SRC_FILE=	*.c
PORTDOCS=	LICENSE.TERMS mod_fastcgi.html
MAKE_JOBS_SAFE=	yes

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/docs/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
