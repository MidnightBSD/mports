# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-png10/Makefile,v 1.30 2011/03/07 15:08:20 ehaupt Exp $

PORTNAME=	png10
PORTVERSION=	1.0.43
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the PNG lib (old 1.0 version, Linux Fedora 10)
LICENSE=	other

CONFLICTS=	linux-png10-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_NAME=	lib${PORTNAME}
LINUX_DIST_VER=	10
RPMVERSION=	1.fc10
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libpng.so.2 \
		usr/lib/libpng.so.2.${PORTVERSION}
DOCSDIR=	${PREFIX}/usr/share/doc/libpng10-${PORTVERSION}
PORTDOCS=	ANNOUNCE CHANGES LICENSE README TODO Y2KINFO
DESCR=		${.CURDIR}/../png/pkg-descr

.include <bsd.port.mk>
