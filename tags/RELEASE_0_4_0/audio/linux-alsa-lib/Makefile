# $MidnightBSD$
# $FreeBSD: ports/audio/linux-alsa-lib/Makefile,v 1.10 2009/06/02 21:15:33 bsam Exp $

PORTNAME=	alsa-lib
DISTVERSION=	1.0.10-3
CATEGORIES=	audio linux
DISTNAME=	${PORTNAME}-${DISTVERSION}.FC4

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Advanced Linux Sound Architecture libraries
LICENSE=	lgpl

CONFLICTS=	linux-f10-alsa-lib-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_DIST_VER=	4
USE_LDCONFIG=	yes
AUTOMATIC_PLIST=yes
BRANDELF_DIRS=	usr/bin

.include <bsd.port.mk>
