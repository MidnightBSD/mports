# Ports collection makefile for:	mozilla-fonts
# Date created:				10 Mar 2000
# Whom:					dom@happygiraffe.net
#
# $MidnightBSD: mports/x11-fonts/mozilla-fonts/Makefile,v 1.2 2008/08/20 19:15:50 laffer1 Exp $
# $FreeBSD: ports/x11-fonts/mozilla-fonts/Makefile,v 1.12 2007/05/19 20:29:33 flz Exp $
#

PORTNAME=	mozilla-fonts
PORTVERSION=	1.0
PORTREVISION=	1

CATEGORIES=	x11-fonts www
MASTER_SITES=	http://www.happygiraffe.net/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web fonts for Netscape/Mozilla
LICENSE=	other

BUILD_DEPENDS=	bdftopcf:${PORTSDIR}/x11-fonts/bdftopcf \
		mkfontdir:${PORTSDIR}/x11-fonts/mkfontdir \
		mkfontscale:${PORTSDIR}/x11-fonts/mkfontscale

.include <bsd.port.pre.mk>

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/mozilla-fonts
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/mozilla-fonts
.endif

.include <bsd.port.post.mk>
