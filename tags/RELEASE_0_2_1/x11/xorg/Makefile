# New ports collection makefile for:    xorg
# Date created:		18 Jun 2004
# Whom:			anholt
#
# $FreeBSD: ports/x11/xorg/Makefile,v 1.19 2007/09/16 12:42:25 flz Exp $
# $MidnightBSD: mports/x11/xorg/Makefile,v 1.6 2008/04/14 18:41:37 laffer1 Exp $
#

PORTNAME=	xorg
PORTVERSION=	7.3
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org complete distribution metaport
LICENSE=	agg

NO_BUILD=	yes

BUILD_DEPENDS+=	${LOCALBASE}/lib/dri/r128_dri.so:${PORTSDIR}/graphics/dri

# data
BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/xbitmaps.pc:${PORTSDIR}/x11/xbitmaps \
		${LOCALBASE}/lib/X11/icons/handhelds/cursors/X_cursor:${PORTSDIR}/x11-themes/xcursor-themes

# doc
BUILD_DEPENDS+=	${LOCALBASE}/share/X11/doc/hardcopy/BDF/bdf.PS.gz:${PORTSDIR}/x11/xorg-docs

# app, lib, font, driver, proto
BUILD_DEPENDS+=	${LOCALBASE}/libdata/xorg/apps:${PORTSDIR}/x11/xorg-apps \
		${LOCALBASE}/libdata/xorg/libraries:${PORTSDIR}/x11/xorg-libraries \
		${LOCALBASE}/libdata/xorg/fonts:${PORTSDIR}/x11-fonts/xorg-fonts \
		${LOCALBASE}/libdata/xorg/drivers:${PORTSDIR}/x11-drivers/xorg-drivers \
		${LOCALBASE}/libdata/xorg/protos:${PORTSDIR}/x11/xorg-protos \
		${LOCALBASE}/bin/Xorg:${PORTSDIR}/x11-servers/xorg-server

.if defined(XORG_COMPLETE)
BUILD_DEPENDS+=	Xnest:${PORTSDIR}/x11-servers/xorg-nestserver \
		Xdmx:${PORTSDIR}/x11-servers/xorg-dmx \
		Xvfb:${PORTSDIR}/x11-servers/xorg-vfbserver
.endif

RUN_DEPENDS+=	${BUILD_DEPENDS}

do-install:	# empty

pre-everything::
	@${ECHO_MSG} "This is a meta-port, meaning that it just depends on its subparts of the port."
	@${ECHO_MSG} "It won't build and install all the parts until you have typed make install"
	@${ECHO_MSG} "This port does not ensure things are upgraded; use portupgrade if you want to"
	@${ECHO_MSG} "upgrade X.Org.  If you simply type 'make install' it may use over 2GB to build"
	@${ECHO_MSG} "all of the subports.  You can install the ports singly if you are low on space."

.include <bsd.port.mk>
