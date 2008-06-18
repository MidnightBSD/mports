# New ports collection makefile for:	linux-pango
# Date created:				2003-07-05
# Whom:					trevor
#
# $MidnightBSD: mports/x11-toolkits/linux-pango/Makefile,v 1.4 2007/10/17 13:57:36 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/linux-pango/Makefile,v 1.13 2006/07/09 21:01:45 bsam Exp $
#

PORTNAME=	pango
PORTVERSION=	1.10.2
DISTVERSIONSUFFIX=	-1.gst.1.4
MASTER_SITES= http://gstreamer.freedesktop.org/pkg/%SUBDIR%/ CENKES/myports
MASTER_SITE_SUBDIR=   ${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/RPMS.gst010
MASTER_SITE_SRC_SUBDIR=       ${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/SRPMS.gst010
CATEGORIES=	x11-toolkits linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux pango binary
LICENSE=	gpl2

# these libraries are required by pango-querymodules
RUN_DEPENDS=	${LINUXBASE}/usr/lib/libglib-2.0.so.0:${PORTSDIR}/devel/linux-glib2 \
		${LINUXBASE}/usr/lib/libfontconfig.so.1:${PORTSDIR}/x11-fonts/linux-fontconfig \
		${LINUXBASE}/usr/lib/libcairo.so.2.2.3:${PORTSDIR}/graphics/linux-cairo \
		${LINUXBASE}/usr/lib/libexpat.so.0:${PORTSDIR}/textproc/linux-expat

SUBFILES=	pkg-install

USE_GCPIO=	yes
USE_XLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST_SUB+=	LIBVERSION="1001.1" PORTVERSION="${PORTVERSION}"


.include <bsd.port.mk>
