# $MidnightBSD: mports/x11-drivers/xf86-input-joystick/Makefile,v 1.5 2011/05/07 21:00:40 laffer1 Exp $

PORTNAME=	xf86-input-joystick
PORTVERSION=	1.5.0
PORTREVISION=	1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org joystick input driver
LICENSE=	mit

XORG_CAT=	driver

MAN4=		joystick.4x

post-patch:
	@${REINPLACE_CMD} -e 's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
