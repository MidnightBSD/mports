# Ports collection makefile for:	mozilla-fonts
# Date created:				10 Mar 2000
# Whom:					dom@happygiraffe.net
#
# $MidnightBSD$
# $FreeBSD: ports/x11-fonts/mozilla-fonts/Makefile,v 1.12 2007/05/19 20:29:33 flz Exp $
#

PORTNAME=	mozilla-fonts
PORTVERSION=	1.0

CATEGORIES=	x11-fonts www
MASTER_SITES=	http://www.happygiraffe.net/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web fonts for Netscape/Mozilla

BUILD_DEPENDS=	bdftopcf:${X_CLIENTS_PORT}

USE_X_PREFIX=	yes
USE_XLIB=	yes

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/mozilla-fonts
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/mozilla-fonts
.endif

.include <bsd.port.post.mk>
