# New ports collection makefile for:	linux-sdl
# Date created:				8 October 2001
# Whom:                         Martin Matuska <martin@tradex.sk>
# Based on:		emulators/linux_base by marcel@FreeBSD.org
#
# $MidnightBSD: mports/devel/linux-sdl12/Makefile,v 1.1 2006/10/01 16:33:52 laffer1 Exp $
# $FreeBSD: ports/devel/linux-sdl12/Makefile,v 1.15 2006/07/02 13:10:05 bsam Exp $
#

PORTNAME=	sdl
PORTVERSION=	1.2.10
PORTREVISION=	1
CATEGORIES=	devel linux
MASTER_SITES=	http://www.libsdl.org/release/ \
		ftp://ftp.icm.edu.pl/vol/rzm9/linux-pld/pool/s/SDL/
DISTNAME=	${PORTNAME:U}-${PORTVERSION:S/.1$/-1/}-1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform multi-media development API (linux version)
LICENSE=	lgpl

USE_LINUX_RPM=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes

ONLY_FOR_ARCHS=	i386 amd64
DIST_SUBDIR=	rpm
PLIST=		${MASTERDIR}/pkg-plist.${LINUX_RPM_ARCH}
PLIST_SUB+=	SDLVER=${PORTVERSION}

.include <bsd.port.mk>
