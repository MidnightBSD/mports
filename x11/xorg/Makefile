# $MidnightBSD: mports/x11/xorg/Makefile,v 1.9 2011/05/07 16:17:51 laffer1 Exp $

PORTNAME=	xorg
PORTVERSION=	7.5.1
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org complete distribution metaport
LICENSE=	agg

NO_BUILD=	yes

RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dri.pc:${PORTSDIR}/graphics/dri

# data
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/xbitmaps.pc:${PORTSDIR}/x11/xbitmaps \
		${LOCALBASE}/lib/X11/icons/handhelds/cursors/X_cursor:${PORTSDIR}/x11-themes/xcursor-themes

# doc
.if !defined(NOPORTDOCS)
RUN_DEPENDS+=	${LOCALBASE}/share/doc/xorg-docs/README.xml:${PORTSDIR}/x11/xorg-docs
.endif

# app, lib, font, driver
RUN_DEPENDS+=	${LOCALBASE}/libdata/xorg/apps:${PORTSDIR}/x11/xorg-apps \
		${LOCALBASE}/libdata/xorg/libraries:${PORTSDIR}/x11/xorg-libraries \
		${LOCALBASE}/libdata/xorg/fonts:${PORTSDIR}/x11-fonts/xorg-fonts \
		${LOCALBASE}/libdata/xorg/drivers:${PORTSDIR}/x11-drivers/xorg-drivers

.if defined(XORG_COMPLETE)
RUN_DEPENDS+=	Xnest:${PORTSDIR}/x11-servers/xorg-nestserver \
		Xdmx:${PORTSDIR}/x11-servers/xorg-dmx \
		Xvfb:${PORTSDIR}/x11-servers/xorg-vfbserver
.endif

do-install:	# empty

pre-everything::
	@${ECHO_MSG} "This is a meta-port, meaning that it just depends on its subparts of the port."
	@${ECHO_MSG} "It won't build and install all the parts until you have typed make install"
	@${ECHO_MSG} "This port does not ensure things are upgraded; use portupgrade if you want to"
	@${ECHO_MSG} "upgrade X.Org.  If you simply type 'make install' it may use over 2GB to build"
	@${ECHO_MSG} "all of the subports.  You can install the ports singly if you are low on space."

.include <bsd.port.pre.mk>

.if make(package)
.if !defined(DEPENDS_TARGET:Mpackage) || empty(DEPENDS_TARGET:Mpackage)
DEPENDS_TARGET="package"
.endif
.endif

RUN_DEPENDS+=	${LOCALBASE}/bin/Xorg:${PORTSDIR}/x11-servers/xorg-server

.include <bsd.port.post.mk>
