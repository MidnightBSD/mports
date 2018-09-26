# $MidnightBSD$

PORTNAME=	xf86-input-egalax
PORTVERSION=	0.3
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	eGalax touch screen input driver for X.Org

LICENSE=	bsd2

USE_GITHUB=	yes
GH_ACCOUNT=	glebius
GH_TAGNAME=	7f1e4ac

USES=		autoreconf pkgconfig libtool 
USE_XORG=       xorg-server xproto randrproto xi renderproto xextproto \
                inputproto kbproto fontsproto videoproto dri2proto dri3proto \
                xf86driproto glproto xineramaproto resourceproto \
                scrnsaverproto presentproto
#XORG_CAT=	driver

.include <bsd.port.mk>
