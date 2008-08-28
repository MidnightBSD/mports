# New ports collection makefile for: linux-gtk
# Date created:         8 April 2000
# Whom:                 sada@FreeBSD.org
# Based on:		emulators/linux_base by marcel@FreeBSD.org
#			& multimedia/xmovie by sanpei@sanpei.org
#
# $MidnightBSD: mports/x11-toolkits/linux-gtk/Makefile,v 1.2 2007/10/17 13:56:50 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/linux-gtk/Makefile,v 1.38 2006/07/14 22:08:21 bsam Exp $
#

PORTNAME=	gtk
PORTVERSION=	1.2.10
PORTREVISION=	4
CATEGORIES=	x11-toolkits linux
DISTNAME=	gtk+-${PORTVERSION}-39

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of the Gtk lib
LICENSE=	lgpl

ONLY_FOR_ARCHS=	i386 amd64
USE_GCPIO=	yes
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}
USE_XLIB=	yes

.include <bsd.port.mk>
