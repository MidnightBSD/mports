# $MidnightBSD$

PORTNAME=	xorg
PORTVERSION=	7.7
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org complete distribution metaport

LICENSE=	agg

NO_BUILD=	yes
NO_MTREE=	yes

RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri

# data
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/xbitmaps.pc:x11/xbitmaps \
		${LOCALBASE}/share/icons/handhelds/cursors/left_ptr_watch:x11-themes/xcursor-themes

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

# doc
.if ${PORT_OPTIONS:MDOCS}
RUN_DEPENDS+=	${LOCALBASE}/share/doc/xorg-docs/README.xml:x11/xorg-docs
.endif

# app, lib, font, driver
RUN_DEPENDS+=	${LOCALBASE}/libdata/xorg/apps:x11/xorg-apps \
		${LOCALBASE}/libdata/xorg/libraries:x11/xorg-libraries \
		${LOCALBASE}/libdata/xorg/fonts:x11-fonts/xorg-fonts \
		${LOCALBASE}/libdata/xorg/drivers:x11-drivers/xorg-drivers

.if defined(XORG_COMPLETE)
RUN_DEPENDS+=	Xnest:x11-servers/xorg-nestserver \
		Xdmx:x11-servers/xorg-dmx \
		Xvfb:x11-servers/xorg-vfbserver
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

.include <bsd.port.post.mk>
