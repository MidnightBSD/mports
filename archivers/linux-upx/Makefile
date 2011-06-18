# $MidnightBSD$
# $FreeBSD: ports/archivers/linux-upx/Makefile,v 1.5 2011/03/07 14:54:14 ehaupt Exp $

PORTNAME=		upx
PORTVERSION=		1.25
CATEGORIES=		archivers linux
MASTER_SITES=		CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=		${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		RPM of UPX, a high-performance executable packer
LICENSE=		gpl2

CONFLICTS=		linux-f10-upx-[0-9]*

USE_LINUX_RPM=		yes
USE_LINUX_APPS=		ucl
RPMVERSION=		4
LINUX_DIST_VER=		4
BRANDELF_FILES=		usr/bin/upx
MASTER_SITE_SRC_SUBDIR=	../extras/${LINUX_DIST_VER}/SRPMS
DESCR=			${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
