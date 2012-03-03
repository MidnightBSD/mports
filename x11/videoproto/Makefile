# New ports collection makefile for:	videoproto
# Date Created:				09 Aug 2005
# Whom:					Dejan Lesjak <lesi@FreeBSD.org>
#
# $FreeBSD: ports/x11/videoproto/Makefile,v 1.1 2007/05/19 20:27:25 flz Exp $
# $MidnightBSD: mports/x11/videoproto/Makefile,v 1.1 2007/10/05 17:45:56 ctriv Exp $
#

PORTNAME=	videoproto
PORTVERSION=	2.3.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Video extension headers
LICENSE=	x11

XORG_CAT=	proto

post-patch:
	@${REINPLACE_CMD} '/^install-data-am:/,/^$$/ \
		s/install-dist_docDATA//' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
