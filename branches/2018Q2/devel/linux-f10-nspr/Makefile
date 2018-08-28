# $MidnightBSD$
# $FreeBSD: ports/devel/linux-f10-nspr/Makefile,v 1.6 2011/03/03 09:26:38 ehaupt Exp $

PORTNAME=	nspr
PORTVERSION=	4.7.6
PORTREVISION=	1
CATEGORIES=	devel linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Netscape Portable Runtime (Linux Fedora 10)

LICENSE=	agg

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	1.fc10.1

PLIST_FILES=	lib/libnspr4.so lib/libplc4.so lib/libplds4.so
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
