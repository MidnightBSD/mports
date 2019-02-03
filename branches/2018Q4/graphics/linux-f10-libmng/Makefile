# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-libmng/Makefile,v 1.17 2011/03/03 09:26:39 ehaupt Exp $

PORTNAME=	libmng
PORTVERSION=	1.0.9
PORTREVISION=	1
CATEGORIES=	graphics linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of libmng (Linux Fedora 10)
LICENSE=	bsd3

CONFLICTS=	linux-libmng-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	jpeg

RPMVERSION=	7
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libmng.so.1 usr/lib/libmng.so.1.0.0

.include <bsd.port.mk>
