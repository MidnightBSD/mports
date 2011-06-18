# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-esound/Makefile,v 1.23 2011/03/07 15:08:16 ehaupt Exp $

PORTNAME=	esound
PORTVERSION=	0.2.41
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of esound (Linux Fedora 10)
LICENSE=	gpl2

CONFLICTS=	linux-esound-[0-9]*

USE_LINUX_RPM=	yes
USE_LINUX_APPS=	libaudiofile
LINUX_NAME=	${PORTNAME}-libs
LINUX_DIST_VER=	10
RPMVERSION=	1.fc10
USE_LDCONFIG=	yes
SRC_DISTFILES=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}${SRC_SUFX}

PLIST_FILES=	etc/esd.conf usr/lib/libesd.so.0 usr/lib/libesd.so.0.2.39 \
		usr/lib/libesddsp.so.0 usr/lib/libesddsp.so.0.2.39
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUX_NAME}-${PORTVERSION}
PORTDOCS=	AUTHORS COPYING.LIB ChangeLog NEWS README TIPS TODO esound.sgml
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
