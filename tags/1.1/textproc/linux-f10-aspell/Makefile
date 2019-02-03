# $MidnightBSD$
# $FreeBSD: ports/textproc/linux-f10-aspell/Makefile,v 1.18 2011/03/03 09:26:43 ehaupt Exp $

PORTNAME=	aspell
PORTVERSION=	0.60.6
PORTREVISION=	1
CATEGORIES=	textproc linux
MASTER_SITES=	FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spelling checker with better logic than ispell (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-aspell-[0-9]* 

USE_LINUX=	f10
USE_LINUX_RPM=	yes

RPMVERSION=	3.fc10
BRANDELF_DIRS=	usr/bin
USE_LDCONFIG=	yes

DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
