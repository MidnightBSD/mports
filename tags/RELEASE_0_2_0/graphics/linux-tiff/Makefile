# New ports collection makefile for: linux-tiff
# Date created:		2001.02.08
# Whom:                 taoka@FreeBSD.org
#
# $MidnightBSD: mports/graphics/linux-tiff/Makefile,v 1.1 2006/09/23 22:21:45 laffer1 Exp $
# $FreeBSD: ports/graphics/linux-tiff/Makefile,v 1.16 2006/07/09 21:01:44 bsam Exp $
#

PORTNAME=	tiff
PORTVERSION=	3.7.1
CATEGORIES=	graphics linux
DISTNAME=	libtiff-${PORTVERSION}-6.fc4.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TIFF library, Linux/i386 binary

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libjpeg.so.62:${PORTSDIR}/graphics/linux-jpeg

ONLY_FOR_ARCHS=	amd64 i386
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
