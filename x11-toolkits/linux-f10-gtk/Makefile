# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/linux-f10-gtk/Makefile,v 1.46 2011/03/07 15:08:24 ehaupt Exp $
#

PORTNAME=	gtk
PORTVERSION=	1.2.10
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk library (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-gtk-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	xorglibs
LINUX_NAME=	${PORTNAME}+
LINUX_DIST_VER=	10
RPMVERSION=	66.fc10
USE_LDCONFIG=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}

.include <bsd.port.mk>
