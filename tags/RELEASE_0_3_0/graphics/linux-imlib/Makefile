# $MidnightBSD: mports/graphics/linux-imlib/Makefile,v 1.1 2006/09/23 22:21:45 laffer1 Exp $

PORTNAME=	imlib
PORTVERSION=	1.9.13
PORTREVISION=	2
CATEGORIES=	graphics linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-24

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of imlib
LICENSE=	lgpl

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
