# $MidnightBSD: mports/x11-drivers/xf86-video-radeonhd/Makefile,v 1.10 2011/10/09 20:02:11 laffer1 Exp $

PORTNAME=	xf86-video-radeonhd
PORTVERSION=	1.3.0
PORTREVISION=	2
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org ati RadeonHD display driver
LICENSE=	mit

OPTIONS=	UTILS "Install rhd_conntest and rhd_dump utilities" off

XORG_CAT=	driver
USE_XORG=	damageproto glproto videoproto xextproto xf86driproto
CONFIGURE_ARGS=	--enable-exa

MAN4=	radeonhd.4x

.include <bsd.port.pre.mk>

.if defined(WITH_UTILS)
LIB_DEPENDS+=	pci.3:${PORTSDIR}/devel/libpci
PLIST_SUB=	UTILS=""
CONFIGURE_ENV+=	PCIUTILS_CFLAGS="-I${LOCALBASE}/include -lpci -lz" \
		PCIUTILS_LIBS="-L${LOCALBASE}/lib"
.else
PLIST_SUB=	UTILS="@comment "
.endif

.if defined(WITH_UTILS)
post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/utils/conntest/rhd_conntest ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/utils/conntest/rhd_dump ${PREFIX}/sbin
.endif

.include <bsd.port.post.mk>
