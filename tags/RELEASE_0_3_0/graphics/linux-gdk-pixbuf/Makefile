# $MidnightBSD: mports/graphics/linux-gdk-pixbuf/Makefile,v 1.1 2006/09/23 22:21:44 laffer1 Exp $

PORTNAME=	gdk-pixbuf
PORTVERSION=	0.22.0.18.fc4.2
CATEGORIES=	graphics linux
DISTNAME=	${PORTNAME}-${PORTVERSION:C/^([^\.]+\.[^\.]+\.[^\.]+)\./\1-/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux version of the graphic library for GTK+
LICENSE=	lgpl

USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
ONLY_FOR_ARCHS=	i386 amd64
USE_LDCONFIG=	yes
PLIST_SUB=	VERSION=${PORTVERSION:C/^([^\.]+\.[^\.]+\.[^\.]+).+/\1/}
MD5_FILE?=	${PKGDIR}/distinfo

.include <bsd.port.mk>
