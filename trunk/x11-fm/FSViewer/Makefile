# New ports collection makefile for:   FSViewer.app
# Date created:                6. Sept. 2003
# Whom:                        Fritz Heinrichmeyer@fernuni-hagen.de
#
# $MidnightBSD: mports/x11-fm/FSViewer/Makefile,v 1.1 2007/05/21 01:41:26 laffer1 Exp $
# $FreeBSD: ports/x11-fm/FSViewer/Makefile,v 1.6 2005/04/12 03:26:52 obrien Exp $
#

PORTNAME=	FSViewer.app
PORTVERSION=	0.2.5
PORTREVISION=	3
CATEGORIES=	x11-fm windowmaker
MASTER_SITES=	http://www.bayernline.de/~gscholz/linux/fsviewer/

PATCH_SITES=	${MASTER_SITES}
PATCHFILES=	${PORTNAME}-${PORTVERSION}-WM-0.81.0.patch.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	Fritz.Heinrichmeyer@fernuni-hagen.de
COMMENT=	X11 file manager using WINGS library. Dockable in WindowMaker
LICENSE=	gpl2

LIB_DEPENDS=	wraster.4:${PORTSDIR}/x11-wm/windowmaker

USE_XORG=	x11 xmu
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"

CPPFLAGS=	`pkg-config --cflags WINGs`
LDFLAGS=	`pkg-config --libs WINGs`

post-install:
	${MKDIR} ${PREFIX}/share/doc/FSViewer
	${INSTALL_DATA} ${WRKSRC}/docs/* ${PREFIX}/share/doc/FSViewer

.include <bsd.port.mk>
