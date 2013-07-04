# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-libaudiofile/Makefile,v 1.21 2011/03/07 15:08:16 ehaupt Exp $

PORTNAME=	lib${LINUX_NAME}
PORTVERSION=	0.2.6
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An implementation of the Audio File Library from SGI (Linux Fedora 10)
LICENSE=	gpl2

CONTFLICTS=	linux-libaudiofile-[0-9]*

USE_LINUX_RPM=	yes
LINUX_NAME=	audiofile
LINUX_DIST_VER=	10
RPMVERSION=	9.fc10
BRANDELF_DIRS=	usr/bin
USE_LDCONFIG=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
