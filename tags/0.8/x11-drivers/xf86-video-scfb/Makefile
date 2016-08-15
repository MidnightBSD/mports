# Created by: Florent Thoumie <flz@freebsd.org>
# $FreeBSD: head/x11-drivers/xf86-video-scfb/Makefile 385665 2015-05-07 20:24:15Z mat $
# $MidnightBSD$

PORTNAME=	xf86-video-scfb
PORTVERSION=	0.0.4
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org syscons display driver

LICENSE=	mit bsd2
LICENSE_COMB=	multi

USE_GITHUB=     yes
GH_ACCOUNT=     rayddteam
GH_TAGNAME=     bdeb3bf

WRKSRC=		${WRKDIR}/xf86-video-scfb-${GH_TAGNAME}

USES=		libtool pkgconfig
GNU_CONFIGURE= 	yes
DIST_SUBDIR=	xorg/driver
USE_XORG=	xorg-server xproto randrproto xi renderproto xextproto \
		inputproto kbproto fontsproto videoproto dri2proto \
		xf86driproto glproto xineramaproto resourceproto \
		scrnsaverproto
CONFIGURE_ENV=	DRIVER_MAN_SUFFIX=4x DRIVER_MAN_DIR='$$(mandir)/man4'
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
