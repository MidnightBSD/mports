# $MidnightBSD$
# $FreeBSD: ports/devel/linux-f10-nspr/Makefile,v 1.6 2011/03/03 09:26:38 ehaupt Exp $

PORTNAME=	nspr
PORTVERSION=	4.7.6
CATEGORIES=	devel linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Netscape Portable Runtime (Linux Fedora 10)
LICENSE=	agg

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	1.fc10.1

PLIST_FILES=	lib/libnspr4.so lib/libplc4.so lib/libplds4.so
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
