# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-libogg/Makefile,v 1.15 2011/03/03 09:26:35 ehaupt Exp $

PORTNAME=	libogg
PORTVERSION=	1.1.3
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library (Linux Fedora 10)
LICENSE=	bsd3

CONFLICTS=	linux-libogg-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	9.fc9
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libogg.so.0 usr/lib/libogg.so.0.5.3
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	AUTHORS CHANGES COPYING README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
