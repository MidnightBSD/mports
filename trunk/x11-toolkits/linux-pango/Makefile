# $MidnightBSD: mports/x11-toolkits/linux-pango/Makefile,v 1.5 2008/06/18 04:29:41 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/linux-pango/Makefile,v 1.13 2006/07/09 21:01:45 bsam Exp $

PORTNAME=	pango
PORTVERSION=	1.10.2
PORTREVISION=	1
DISTVERSIONSUFFIX=	-1.gst.1.4
MASTER_SITES= http://gstreamer.freedesktop.org/pkg/%SUBDIR%/ CENKES/myports
MASTER_SITE_SUBDIR=   ${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/RPMS.gst010
MASTER_SITE_SRC_SUBDIR=       ${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/SRPMS.gst010
CATEGORIES=	x11-toolkits linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux pango binary
LICENSE=	gpl2

CONFLICTS=	linux-f8-pango-[0-9]* linux-f10-pango-[0-9]*

SUBFILES=	pkg-install

USE_GCPIO=	yes
USE_XLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	cairo expat fontconfig xorglibs
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST_SUB+=	LIBVERSION="1001.1" PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
