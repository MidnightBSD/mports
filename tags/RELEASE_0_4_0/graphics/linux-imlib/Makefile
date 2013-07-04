# $MidnightBSD: mports/graphics/linux-imlib/Makefile,v 1.2 2009/03/04 00:31:20 laffer1 Exp $

PORTNAME=	imlib
PORTVERSION=	1.9.13
PORTREVISION=	3
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	${PORTNAME}-${PORTVERSION}-24

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of imlib
LICENSE=	lgpl

CONFLICTS=	linux-f10-imlib-[0-9]*

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
