# $MidnightBSD$
# $FreeBSD: ports/multimedia/linux-f10-libtheora/Makefile,v 1.7 2011/03/03 09:26:42 ehaupt Exp $

PORTNAME=	libtheora
PORTVERSION=	1.0rc1
CATEGORIES=	multimedia linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Theora Video Compression Codec (Linux Fedora 10)
LICENSE=	bsd3

CONFLICTS=	linux-libtheora-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	2.fc10
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libtheora.so.0 usr/lib/libtheora.so.0.3.3 \
		usr/lib/libtheoradec.so.1 usr/lib/libtheoradec.so.1.0.0 \
		usr/lib/libtheoraenc.so.1 usr/lib/libtheoraenc.so.1.0.0
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	COPYING README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
