# $MidnightBSD$

PORTNAME=	xf86-input-joystick
PORTVERSION=	1.6.2
PORTREVISION=	3
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org joystick input driver
LICENSE=	mit

XORG_CAT=	driver

post-patch:
	@${REINPLACE_CMD} -e 's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
