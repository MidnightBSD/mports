# $MidnightBSD: mports/x11-drivers/xf86-input-joystick/Makefile,v 1.3 2009/03/25 15:56:10 laffer1 Exp $

PORTNAME=	xf86-input-joystick
PORTVERSION=	1.4.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org joystick input driver
LICENSE=	x11

XORG_CAT=	driver

MAN4=		joystick.4x

post-patch:
	@${REINPLACE_CMD} -e 's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
