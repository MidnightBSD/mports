# $FreeBSD: ports/x11/xorg-docs/Makefile,v 1.2 2007/09/13 19:45:05 flz Exp $
# $MidnightBSD: mports/x11/xorg-docs/Makefile,v 1.2 2011/05/07 16:17:51 laffer1 Exp $

PORTNAME=	xorg-docs
PORTVERSION=	1.6
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org documentation files
LICENSE=	mit

MAN7=	X.7 Standards.7 XProjectTeam.7 Consortium.7 Xsecurity.7 XOrgFoundation.7

CONFIGURE_ARGS+=	--without-xmlto --without-fop --disable-specs

XORG_CAT=	doc

.include <bsd.port.mk>
