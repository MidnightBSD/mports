# $MidnightBSD$
# $FreeBSD: ports/archivers/linux-ucl/Makefile,v 1.5 2011/03/07 14:54:14 ehaupt Exp $

PORTNAME=		ucl
PORTVERSION=		1.03
CATEGORIES=		archivers linux
MASTER_SITES=		CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
DISTNAME=		${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		RPM of UCL, a lossless data compression library
LICENSE=		gpl2

CONFLICTS=		linux-f10-ucl-[0-9]*

USE_LINUX_RPM=		yes
RPMVERSION=		3
LINUX_DIST_VER=		4
USE_LDCONFIG=		yes
MASTER_SITE_SRC_SUBDIR=	../extras/${LINUX_DIST_VER}/SRPMS
DESCR=			${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
