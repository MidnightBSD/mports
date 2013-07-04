# $MidnightBSD: mports/graphics/linux-libmng/Makefile,v 1.2 2009/03/21 16:00:54 laffer1 Exp $

PORTNAME=	libmng
PORTVERSION=	1.0.9
CATEGORIES=	graphics linux
DISTNAME=	${PORTNAME}-${PORTVERSION}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of libmng
LICENSE=	bsd3

CONFLICTS=	linux-f10-libmng-[0-9]*

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
USE_LINUX_APPS=	jpeg
ONLY_FOR_ARCHS=	i386 amd64

PLIST?=		${PKGDIR}/pkg-plist.${LINUX_RPM_ARCH}

.include <bsd.port.mk>
