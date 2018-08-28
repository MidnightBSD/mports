# $MidnightBSD$
# $FreeBSD: ports/devel/linux-f10-dbus-libs/Makefile,v 1.2 2011/03/03 09:26:37 ehaupt Exp $

PORTNAME=	dbus-libs
PORTVERSION=	1.2.4
PORTREVISION=	1
CATEGORIES=	devel linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for accessing D-BUS (Linux Fedora 10)
LICENSE=	gpl2

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	4.fc10
USE_LDCONFIG=	yes
SRC_DISTFILES=	dbus-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}
DESCR=		${.CURDIR}/../dbus/pkg-descr

PLIST_FILES=	lib/libdbus-1.so.3 lib/libdbus-1.so.3.4.0

.include <bsd.port.mk>
