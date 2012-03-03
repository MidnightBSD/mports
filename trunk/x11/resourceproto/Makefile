# New ports collection makefile for:	resourceproto
# Date Created:				08 Aug 2005
# Whom:					Dejan Lesjak <lesi@FreeBSD.org>
#
# $FreeBSD: ports/x11/resourceproto/Makefile,v 1.1 2007/05/19 20:27:14 flz Exp $
# $MidnightBSD: mports/x11/resourceproto/Makefile,v 1.1 2007/10/05 15:11:56 ctriv Exp $
#

PORTNAME=	resourceproto
PORTVERSION=	1.2.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Resource extension headers
LICENSE=	x11

XORG_CAT=	proto

post-patch:
	@${REINPLACE_CMD} '/^install-data-am:/,/^$$/ \
		s/install-dist_docDATA//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
