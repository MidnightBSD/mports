# $MidnightBSD$
# $FreeBSD: ports/audio/linux-f10-sdl_mixer/Makefile,v 1.8 2011/03/03 09:26:36 ehaupt Exp $

PORTNAME=	sdl_mixer
PORTVERSION=	1.2.8
CATEGORIES=	audio linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A sample multi-channel audio mixer library (Linux Fedora 10)
LICENSE=	lgpl

CONFLICTS=	linux-sdl_mixer-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
USE_LINUX_APPS=	sdl12
LINUX_NAME=	SDL_mixer
LINUX_DIST_VER=	10
RPMVERSION=	9.fc10
BRANDELF_FILES=	usr/bin/playmus usr/bin/playwave
USE_LDCONFIG=	yes

PLIST_FILES=	usr/bin/playmus usr/lib/libSDL_mixer-1.2.so.0 \
		usr/bin/playwave usr/lib/libSDL_mixer-1.2.so.0.2.6
DOCSDIR=	${PREFIX}/usr/share/doc/${LINUX_NAME}-${PORTVERSION}
PORTDOCS=	CHANGES COPYING README
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
