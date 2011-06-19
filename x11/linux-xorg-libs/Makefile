# New ports collection makefile for:	linux-xorg-libs
#
# $MidnightBSD: mports/x11/linux-xorg-libs/Makefile,v 1.3 2008/10/03 19:25:48 laffer1 Exp $
# $FreeBSD: ports/x11/linux-xorg-libs/Makefile,v 1.6 2006/06/28 19:25:49 netchild Exp $
#

PORTNAME=	xorg-libs
PORTVERSION=	6.8.2
PORTREVISION=	6
CATEGORIES=	x11 linux
DISTFILES=	xorg-x11-libs-${PORTVERSION}-37.FC4.49.2.1.${LINUX_RPM_ARCH}.rpm \
		xorg-x11-deprecated-libs-6.8.2-31.${LINUX_RPM_ARCH}.rpm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Xorg libraries, linux binaries
LICENSE=	x11

CONFLICTS=            linux-XFree86-libs-[0-9]* linux-f10-xorg-libs-[0-9]*

USE_GCPIO=	yes
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	fontconfig
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes

SRC_DISTFILES=	xorg-x11-6.8.2-37.FC4.49.2.1.src.rpm

.include <bsd.port.mk>
