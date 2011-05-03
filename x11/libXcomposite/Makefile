# $FreeBSD: ports/x11/libXcomposite/Makefile,v 1.15 2007/09/13 19:44:59 flz Exp $
# $MidnightBSD: mports/x11/libXcomposite/Makefile,v 1.1 2007/10/05 17:26:16 ctriv Exp $

PORTNAME=	libXcomposite
PORTVERSION=	0.4.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Composite extension library
LICENSE=	x11

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
