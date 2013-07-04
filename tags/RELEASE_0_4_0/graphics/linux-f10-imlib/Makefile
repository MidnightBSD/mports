# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-imlib/Makefile,v 1.19 2011/03/07 15:08:19 ehaupt Exp $

PORTNAME=	imlib
PORTVERSION=	1.9.15
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of imlib (Linux Fedora 10)
LICENSE=	gpl2

CONFLICTS=	linux-imlib-[0-9]*

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	9.fc10
BRANDELF_FILES=	usr/bin/imlib_config
USE_LDCONFIG=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}

.include <bsd.port.mk>
