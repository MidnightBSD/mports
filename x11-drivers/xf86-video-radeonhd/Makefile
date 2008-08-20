# New ports collection makefile for:	xf86-video-radeonhd
# Date Created:				20 Oct 2007
# Whom:					Rene Ladan <r.c.ladan@gmail.com>
#
# $MidnightBSD: mports/x11-drivers/xf86-video-radeonhd/Makefile,v 1.3 2008/08/20 19:27:43 laffer1 Exp $
# $FreeBSD: ports/x11-drivers/xf86-video-radeonhd/Makefile,v 1.3 2008/01/02 12:20:08 flz Exp $
#

PORTNAME=	xf86-video-radeonhd
PORTVERSION=	1.2.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org ati RadeonHD display driver
LICENSE=	x11

OPTIONS=	UTILS "Install rhd_conntest and rhd_dump utilities" off

XORG_CAT=	driver
USE_XORG=	videoproto xextproto

MAN4=	radeonhd.4x

.include <bsd.port.pre.mk>

.if defined(WITH_UTILS)
LIB_DEPENDS+= pci.2:${PORTSDIR}/devel/libpci
PLIST_SUB=    UTILS=""
CONFIGURE_ENV+=       PCIUTILS_CFLAGS="-I${LOCALBASE}/include -lpci -lz" \
              PCIUTILS_LIBS="-L${LOCALBASE}/lib"
.else
PLIST_SUB=    UTILS="@comment "
.endif

.if defined(WITH_UTILS)
post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/utils/conntest/rhd_conntest ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/utils/conntest/rhd_dump ${PREFIX}/sbin
.endif

.include <bsd.port.post.mk>
