# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/linux-f10-qt33/Makefile,v 1.9 2011/03/03 09:26:45 ehaupt Exp $

PORTNAME=	${LINUX_NAME}3
PORTVERSION=	3.3.8b
CATEGORIES=	x11-toolkits linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of QT3 (Linux Fedora 10)
LICENSE=	gpl2

CONFLICTS=	linux-qt33-[0-9]*

USE_LINUX_RPM=	yes
USE_LINUX_APPS=	fontconfig libmng png
LINUX_NAME=	qt3
LINUX_DIST_VER=	10
RPMVERSION=	17.fc10
USE_LDCONFIG=	yes
PLIST=		pkg-plist.${LINUX_RPM_ARCH}

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
