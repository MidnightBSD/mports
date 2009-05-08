# $MidnightBSD: mports/x11/pixman/Makefile,v 1.4 2009/03/14 19:38:25 laffer1 Exp $

PORTNAME=	pixman
PORTVERSION=	0.15.2 
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

XORG_CAT=	lib
USE_AUTOTOOLS=	libtool:15
USE_PERL5_BUILD=yes
USE_GNOME=	ltverhack

post-patch:
	@${REINPLACE_CMD} -e 's|gtk+-2\.0|disable-gtk|g' \
		-e 's|-msse||' ${WRKSRC}/configure

post-install:
	(cd ${PREFIX}/lib; ln -s libpixman-1.so.0 libpixman-1.so.9 )

.include <bsd.port.mk>
