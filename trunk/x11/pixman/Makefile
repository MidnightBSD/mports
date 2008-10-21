# New ports collection makefile for:	pixman
# Date Created:				Aug 9 2003
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/pixman/Makefile,v 1.3 2007/09/15 13:58:26 flz Exp $
# $MidnightBSD: mports/x11/pixman/Makefile,v 1.1 2007/10/05 20:03:04 ctriv Exp $
#

PORTNAME=	pixman
PORTVERSION=	0.10.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

USE_AUTOTOOLS=	libtool:15
USE_GNOME=	ltverhack
XORG_CAT=	lib

post-patch:
	@${REINPLACE_CMD} -e 's|gtk+-2\.0|disable-gtk|g' \
 		-e 's|-msse||' ${WRKSRC}/configure

post-install:
	(cd ${FAKE_DESTDIR}${LOCALBASE}/lib; ln -s libpixman-1.so.0 libpixman-1.so.9 )

.include <bsd.port.mk>
