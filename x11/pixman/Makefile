# $MidnightBSD: mports/x11/pixman/Makefile,v 1.5 2009/05/08 03:17:27 laffer1 Exp $

PORTNAME=	pixman
PORTVERSION=	0.15.2 
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

XORG_CAT=	lib
USE_AUTOTOOLS=	libtool:22
USE_PERL5_BUILD=yes
USE_GNOME=	ltverhack

post-patch:
	@${REINPLACE_CMD} -e 's|gtk+-2\.0|disable-gtk|g' \
		-e 's|-msse||' ${WRKSRC}/configure

post-install:
	(cd ${PREFIX}/lib; ln -s libpixman-1.so.0 libpixman-1.so.9 )

.include <bsd.port.mk>
