# $MidnightBSD$
# $FreeBSD: ports/archivers/linux-f10-ucl/Makefile,v 1.7 2011/03/03 09:26:34 ehaupt Exp $

PORTNAME=		ucl
PORTVERSION=		1.03
CATEGORIES=		archivers linux
MASTER_SITES=		CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=		linux-f10-
DISTNAME=		${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		UCL, a lossless data compression library (Linux Fedora 10)
LICENSE=		gpl2

CONFLICTS=		linux-ucl-[0-9]* linux-f8-ucl-[0-9]*

USE_LINUX_RPM=		yes
LINUX_DIST_VER=		10
RPMVERSION=		8.fc9
USE_LDCONFIG=		yes

PLIST_FILES=		usr/lib/libucl.so.1 usr/lib/libucl.so.1.0.0
DOCSDIR=		${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=		COPYING NEWS README THANKS TODO
DESCR=			${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
