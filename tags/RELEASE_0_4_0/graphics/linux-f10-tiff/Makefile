# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-tiff/Makefile,v 1.24 2011/03/07 15:08:20 ehaupt Exp $

PORTNAME=	tiff
PORTVERSION=	3.8.2
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The TIFF library, Linux/i386 binary (Linux Fedora 10)
LICENSE=	bsd2

CONFLICTS=	linux-tiff-[0-9]*

ONLY_FOR_ARCHS=	amd64 i386
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	jpeg
LINUX_NAME=	lib${PORTNAME}
LINUX_DIST_VER=	10
RPMVERSION=	11.fc10
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
USE_LDCONFIG=	yes

PLIST_SUB+=	PORTVERSION="${PORTVERSION}"
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
