# New ports collection makefile for:    xorg-libraries
# Date created:		29 May 2004
# Whom:			anholt@FreeBSD.org
#
# $MidnightBSD: mports/x11/xorg-libraries/Makefile,v 1.4 2007/03/14 23:31:56 ctriv Exp $
# $FreeBSD: ports/x11/xorg-libraries/Makefile,v 1.15 2006/01/21 18:55:04 lesi Exp $
#

PORTNAME=	xorg-libraries
PORTVERSION=	6.9.0
PORTREVISION=   3
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_XORG}
MASTER_SITE_SUBDIR=	X11R${PORTVERSION}/src
DISTFILES=	X11R${PORTVERSION}-src1.tar.gz \
		X11R${PORTVERSION}-src3.tar.gz

PATCHFILES=     x11r6.9.0-cidfonts.diff
PATCH_SITES=    ${MASTER_SITE_XORG}
PATCH_SITE_SUBDIR=      X11R${PORTVERSION}/patches

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 libraries and headers from X.Org

CFLAGS+= -I/usr/local/include/freetype2

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm \
		freetype.9:${PORTSDIR}/print/freetype2 \
		fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig

CONFLICTS=	Mesa-* XFree86-libraries-* \
		libX11-* libGL-* libGLU-* libICE-* libSM-* libXau-* libXaw-* \
		libXcursor-* libXdmcp-* libXext-* libXfont-* libXi-* \
		libXinerama-* libXmu-* libXp-* libXpm-* libXrandr-* \
		libXrender-* libXres-* libXt-* libXv-* libXxf86-* libxkbfile-* \
		panoramixext-* printext-* randrext-* renderext-* resourceext-* \
		xextensions-* xf86ext-* xlibs-* xpm-* xproto-*

EXTRA_PATCHES=	${CF_PATCHES}

XBUILD_DIRS=	lib nls programs/Xserver/include \
		programs/Xserver/hw/xfree86/parser
XINSTALL_DIRS=	include lib nls programs/Xserver/include \
		programs/Xserver/hw/xfree86/parser

INSTALLS_SHLIB=	yes

post-patch:
	${CP} ${FILESDIR}/nls-Compose-microsoft-cp1251 ${WRKSRC}/nls/Compose/microsoft-cp1251
	${MKDIR} ${WRKSRC}/lib/XThrStub
	${CP} ${FILESDIR}/XThrStub-Imakefile ${WRKSRC}/lib/XThrStub/Imakefile

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${INSTALL_DATA} ${WRKSRC}/lib/Xcursor/xcursor.pc \
		${PREFIX}/libdata/pkgconfig

.include "${.CURDIR}/../../x11-servers/xorg-server/Makefile.inc"
.include <bsd.port.pre.mk>

.if ${X_WINDOW_SYSTEM:L} != xorg
IGNORE=	is part of X.Org and you have ${X_WINDOW_SYSTEM} set for X11\
	distribution. See The X Window System and Virtual Consoles chapter\
	of FAQ for more information
.endif


PLIST_SUB+=	OSMESA:=""
PLIST_SUB+=	XTHRSTUB:="@comment "

.include <bsd.port.post.mk>
