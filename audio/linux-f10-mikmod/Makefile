# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-mikmod/Makefile,v 1.9 2011/03/03 09:26:35 ehaupt Exp $

PORTNAME=	mikmod
PORTVERSION=	3.2.0
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MikMod Sound Library (Linux Fedora 10)
LICENSE=	gpl2

CONFLICTS=	linux-mikmod-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	3.beta2.fc9
LINUX_NAME=	lib${PORTNAME}
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libmikmod.so.3 usr/lib/libmikmod.so.3.0.0
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUX_NAME}-${PORTVERSION}
PORTDOCS=	AUTHORS COPYING.LESSER COPYING.LIB NEWS README TODO
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
