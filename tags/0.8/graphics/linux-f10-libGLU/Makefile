# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-libGLU/Makefile,v 1.10 2011/03/03 09:26:39 ehaupt Exp $

PORTNAME=	libGLU
PORTVERSION=	7.2
CATEGORIES=	graphics linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	mesa-${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mesa libGLU runtime library (Linux Fedora 10)

LICENSE=	mit

CONFLICTS=	linux_dri-[0-9]* linux-libGLU-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
LINUX_NAME=	mesa-libGLU

RPMVERSION=	0.15.fc10
USE_LDCONFIG=	yes
SRC_DISTFILES=	mesa-${PORTVERSION}-${RPMVERSION}.src.rpm

PLIST_FILES=	usr/lib/libGLU.so.1 usr/lib/libGLU.so.1.3.070300
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

SRC_DISTFILE=	mesa-${PORTVERSION}-${RPMVERSION}.src.rpm

.include <bsd.port.mk>
