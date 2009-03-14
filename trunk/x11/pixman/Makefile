# $MidnightBSD: mports/x11/pixman/Makefile,v 1.3 2009/03/12 01:37:35 ctriv Exp $

PORTNAME=	pixman
PORTVERSION=	0.14.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

USE_AUTOTOOLS=	libtool:15
USE_PERL5_BUILD=yes
USE_GNOME=	ltverhack
XORG_CAT=	lib

post-patch:
	@${REINPLACE_CMD} -e 's|gtk+-2\.0|disable-gtk|g' \
 		-e 's|-msse||' ${WRKSRC}/configure

post-install:
	(cd ${PREFIX}/lib; ln -s libpixman-1.so.0 libpixman-1.so.9 )

.include <bsd.port.mk>
