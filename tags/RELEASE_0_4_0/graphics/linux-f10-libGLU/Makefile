# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-libGLU/Makefile,v 1.10 2011/03/03 09:26:39 ehaupt Exp $

PORTNAME=	libGLU
PORTVERSION=	7.2
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mesa libGLU runtime library (Linux Fedora 10)
LICENSE=	x11

CONFLICTS=	linux_dri-[0-9]* linux-libGLU-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_NAME=	mesa-libGLU
LINUX_DIST_VER=	10
RPMVERSION=	0.15.fc10
USE_LDCONFIG=	yes
SRC_DISTFILES=	mesa-${PORTVERSION}-${RPMVERSION}.src.rpm

PLIST_FILES=	usr/lib/libGLU.so.1 usr/lib/libGLU.so.1.3.070300
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
