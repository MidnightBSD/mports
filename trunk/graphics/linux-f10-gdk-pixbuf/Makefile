# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-gdk-pixbuf/Makefile,v 1.17 2011/03/03 09:26:39 ehaupt Exp $

PORTNAME=	gdk-pixbuf
PORTVERSION=	0.22.0
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Image loading library for GTK+ (Linux Fedora 10)
LICENSE=	gpl2

CONFLICTS=	linux-gdk-pixbuf-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	36.fc9
USE_LDCONFIG=	yes

.include <bsd.port.mk>
