# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-arts/Makefile,v 1.25 2011/03/03 09:26:35 ehaupt Exp $

PORTNAME=		arts
PORTVERSION=		1.5.10
CATEGORIES=		audio kde linux
MASTER_SITES=		CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=		linux-f10-
DISTNAME=		${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Audio system for the KDE integrated X11 desktop (Linux Fedora 10)
LICENSE=		gpl2

CONFLICTS=		linux-arts-[0-9]*

ONLY_FOR_ARCHS=		i386 amd64
USE_LINUX_RPM=		yes
LINUX_DIST_VER=		10
RPMVERSION=		1.fc10
BRANDELF_DIRS=		usr/bin
USE_LDCONFIG=		yes
DESCR=			${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
