# $MidnightBSD: mports/graphics/linux-cairo/Makefile,v 1.1 2008/06/18 04:31:51 laffer1 Exp $
# $FreeBSD: ports/graphics/linux-cairo/Makefile,v 1.3 2008/04/19 17:50:24 miwi Exp $

PORTNAME=	cairo
PORTVERSION=	1.0.2
PORTREVISION=	1
DISTVERSIONSUFFIX=	-2.gst.1.4
CATEGORIES=	graphics linux
MASTER_SITES=	http://gstreamer.freedesktop.org/pkg/%SUBDIR%/ CENKES/myports
MASTER_SITE_SUBDIR=	${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/RPMS.deps
MASTER_SITE_SRC_SUBDIR=	${LINUX_DIST}/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/SRPMS.deps

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux cairo binary
LICENSE=	gpl2

CONFLICTS=	linux-f10-cairo-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	fontconfig png xorglibs
PLIST_SUB=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
