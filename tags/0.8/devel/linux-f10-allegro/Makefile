# $MidnightBSD$
# $FreeBSD: ports/devel/linux-f10-allegro/Makefile,v 1.16 2011/03/07 15:08:17 ehaupt Exp $

PORTNAME=	allegro
PORTVERSION=	4.2.2
PORTREVISION=	1
CATEGORIES=	devel linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform game programming library (Linux Fedora 10)

LICENSE=	other

CONFLICTS=	linux-allegro-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=		yes
USE_LINUX_APPS=		xorglibs

RPMVERSION=		10.fc10
USE_LDCONFIG=		yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
