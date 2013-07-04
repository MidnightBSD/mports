# $MidnightBSD: mports/x11/libXcomposite/Makefile,v 1.3 2012/03/03 01:52:52 laffer1 Exp $

PORTNAME=	libXcomposite
PORTVERSION=	0.4.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Composite extension library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	compositeproto:both x11 xfixes xext fixesproto xproto:both
MAN3=		Xcomposite.3 \
		XCompositeQueryExtension.3 \
		XCompositeQueryVersion.3 \
		XCompositeVersion.3 \
		XCompositeRedirectWindow.3 \
		XCompositeRedirectSubwindows.3 \
		XCompositeUnredirectWindow.3 \
		XCompositeUnredirectSubwindows.3 \
		XCompositeCreateRegionFromBorderClip.3 \
		XCompositeNameWindowPixmap.3 \
		XCompositeGetOverlayWindow.3 \
		XCompositeReleaseOverlayWindow.3

.include <bsd.port.mk>
