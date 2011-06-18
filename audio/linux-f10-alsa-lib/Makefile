# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-alsa-lib/Makefile,v 1.16 2011/03/03 09:26:34 ehaupt Exp $

PORTNAME=	alsa-lib
PORTVERSION=	1.0.21
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Advanced Linux Sound Architecture libraries (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-alsa-lib-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	10
RPMVERSION=	2.fc10
BRANDELF_FILES=	usr/bin/aserver
USE_LDCONFIG=	yes

.include <bsd.port.mk>
