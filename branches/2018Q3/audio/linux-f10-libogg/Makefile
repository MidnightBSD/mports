# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-libogg/Makefile,v 1.15 2011/03/03 09:26:35 ehaupt Exp $

PORTNAME=	libogg
PORTVERSION=	1.1.3
PORTREVISION=	1
CATEGORIES=	audio linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library (Linux Fedora 10)

LICENSE=	bsd3

CONFLICTS=	linux-libogg-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	9.fc9
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libogg.so.0 usr/lib/libogg.so.0.5.3
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	AUTHORS CHANGES COPYING README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
