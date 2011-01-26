# $MidnightBSD: mports/graphics/linux-libmng/Makefile,v 1.1 2006/09/23 22:21:45 laffer1 Exp $

PORTNAME=	libmng
PORTVERSION=	1.0.9
CATEGORIES=	graphics linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of libmng
LICENSE=	bsd3
RUN_DEPENDS=	${LINUXBASE}/usr/lib/libjpeg.so.62:${PORTSDIR}/graphics/linux-jpeg

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
ONLY_FOR_ARCHS=	i386 amd64

PLIST?=		${PKGDIR}/pkg-plist.${LINUX_RPM_ARCH}

.include <bsd.port.mk>
