# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-libmng/Makefile,v 1.17 2011/03/03 09:26:39 ehaupt Exp $

PORTNAME=		libmng
PORTVERSION=		1.0.9
CATEGORIES=		graphics linux
MASTER_SITES=		CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=		linux-f10-
DISTNAME=		${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		RPM of libmng (Linux Fedora 10)
LICENSE=		bsd3

CONFLICTS=		linux-libmng-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	jpeg
LINUX_DIST_VER=	10
RPMVERSION=	7
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libmng.so.1 usr/lib/libmng.so.1.0.0

.include <bsd.port.mk>
