# $MidnightBSD: mports/graphics/linux-tiff/Makefile,v 1.2 2007/10/17 13:56:20 laffer1 Exp $

PORTNAME=	tiff
PORTVERSION=	3.7.1
CATEGORIES=	graphics linux
DISTNAME=	libtiff-${PORTVERSION}-6.fc4.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TIFF library, Linux/i386 binary
LICENSE=	mit

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libjpeg.so.62:${PORTSDIR}/graphics/linux-jpeg

ONLY_FOR_ARCHS=	amd64 i386
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
