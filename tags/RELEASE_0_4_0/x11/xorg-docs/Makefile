# $MidnightBSD: mports/x11/xorg-docs/Makefile,v 1.3 2012/03/03 01:52:56 laffer1 Exp $

PORTNAME=	xorg-docs
PORTVERSION=	1.7
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org documentation files
LICENSE=	mit

MAN7=	X.7 Standards.7 XProjectTeam.7 Consortium.7 Xsecurity.7 XOrgFoundation.7

CONFIGURE_ARGS+=	--without-xmlto --without-fop --disable-specs

XORG_CAT=	doc

.include <bsd.port.mk>
