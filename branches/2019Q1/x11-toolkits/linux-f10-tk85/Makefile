# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/linux-f10-tk85/Makefile,v 1.5 2011/03/03 09:26:45 ehaupt Exp $

PORTNAME=	tk
PORTVERSION=	8.5.3
PORTREVISION=	1
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

PKGNAMESUFFIX=	85

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical toolkit for TCL (Linux Fedora 10)
LICENSE=	other

USE_LINUX=	f10
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	xorglibs

RPMVERSION=	5.fc10
BRANELF_FILES=	usr/bin/wish8.5
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION="${PORTVERSION}"

.include <bsd.port.mk>
