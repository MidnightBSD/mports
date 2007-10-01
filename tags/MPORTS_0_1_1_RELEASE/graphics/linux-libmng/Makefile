# New ports collection makefile for: linux-libmng
# Date created:		01/09/18
# Whom:                 mranner@inode.at
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-libmng/Makefile,v 1.9 2006/08/03 23:29:12 bsam Exp $
#

PORTNAME=		libmng
PORTVERSION=		1.0.9
CATEGORIES=		graphics linux
DISTNAME=		${PORTNAME}-${PORTVERSION}-1

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		RPM of libmng

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libjpeg.so.62:${PORTSDIR}/graphics/linux-jpeg

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
INSTALLS_SHLIB=	yes
ONLY_FOR_ARCHS=	i386 amd64

PLIST?=		${PKGDIR}/pkg-plist.${LINUX_RPM_ARCH}

.include <bsd.port.mk>
