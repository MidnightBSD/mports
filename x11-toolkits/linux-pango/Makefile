# New ports collection makefile for:	linux-pango
# Date created:				2003-07-05
# Whom:					trevor
#
# $MidnightBSD: mports/x11-toolkits/linux-pango/Makefile,v 1.3 2007/05/01 18:26:13 ctriv Exp $
# $FreeBSD: ports/x11-toolkits/linux-pango/Makefile,v 1.13 2006/07/09 21:01:45 bsam Exp $
#

PORTNAME=	pango
PORTVERSION=	1.8.1
CATEGORIES=	x11-toolkits linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux pango binary

# these libraries are required by pango-querymodules
RUN_DEPENDS=	${LINUXBASE}/usr/lib/libglib-2.0.so.0:${PORTSDIR}/devel/linux-glib2 \
		${LINUXBASE}/usr/lib/libfontconfig.so.1:${PORTSDIR}/x11-fonts/linux-fontconfig \
		${LINUXBASE}/usr/lib/libexpat.so.0:${PORTSDIR}/textproc/linux-expat

SUBFILES=	pkg-install

USE_GCPIO=	yes
USE_XLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST_SUB+=	LIBVERSION="800.1" PORTVERSION="${PORTVERSION}"


.include <bsd.port.mk>
