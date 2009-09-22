# $MidnightBSD: mports/x11/pixman/Makefile,v 1.6 2009/09/20 01:58:04 smultron Exp $

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
	(cd ${PREFIX}/lib; ln -s libpixman-1.so.15 libpixman-1.so.9 )

.include <bsd.port.mk>
