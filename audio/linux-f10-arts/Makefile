# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-arts/Makefile,v 1.25 2011/03/03 09:26:35 ehaupt Exp $

PORTNAME=		arts
PORTVERSION=		1.5.10
PORTREVISION=		2
CATEGORIES=		audio linux
MASTER_SITES=		FREEBSD_LOCAL/ehaupt/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Audio system for the KDE integrated X11 desktop (Linux Fedora 10)

LICENSE=		gpl2

CONFLICTS=		linux-arts-[0-9]*

ONLY_FOR_ARCHS=		i386 amd64
USE_LINUX=	f10
USE_LINUX_RPM=		yes

RPMVERSION=		1.fc10
BRANDELF_DIRS=		usr/bin
USE_LDCONFIG=		yes

post-install:
	${RM} ${STAGEDIR}${PREFIX}/usr/lib/*.la

.include <bsd.port.mk>
