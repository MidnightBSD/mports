# $MidnightBSD: mports/graphics/linux-gdk-pixbuf/Makefile,v 1.2 2009/03/04 00:30:21 laffer1 Exp $

PORTNAME=	gdk-pixbuf
PORTVERSION=	0.22.0.18.fc4.2
PORTREVISION=	1
CATEGORIES=	graphics linux
DISTNAME=	${PORTNAME}-${PORTVERSION:C/^([^\.]+\.[^\.]+\.[^\.]+)\./\1-/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux version of the graphic library for GTK+
LICENSE=	lgpl

CONFLICTS=	linux-f10-gdk-pixbuf-[0-9]*

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
ONLY_FOR_ARCHS=	i386 amd64
USE_LDCONFIG=	yes
PLIST_SUB=	VERSION=${PORTVERSION:C/^([^\.]+\.[^\.]+\.[^\.]+).+/\1/}
HASH_FILE?=	${PKGDIR}/distinfo

.include <bsd.port.mk>
