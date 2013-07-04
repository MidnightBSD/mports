# $MidnightBSD: mports/x11-toolkits/linux-gtk/Makefile,v 1.3 2008/06/18 04:52:06 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/linux-gtk/Makefile,v 1.38 2006/07/14 22:08:21 bsam Exp $

PORTNAME=	gtk
PORTVERSION=	1.2.10
PORTREVISION=	5
CATEGORIES=	x11-toolkits linux
MASTER_SITES= CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=	gtk+-${PORTVERSION}-39

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the Gtk lib
LICENSE=	lgpl

CONFLICTS=	linux-f10-gtk-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	xorglibs
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}

.include <bsd.port.mk>
