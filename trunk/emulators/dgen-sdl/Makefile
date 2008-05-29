# New ports collection makefile for:	dgen-sdl
# Date created:				20 September 2000
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/emulators/dgen-sdl/Makefile,v 1.2 2007/10/25 04:26:09 laffer1 Exp $
# $FreeBSD: ports/emulators/dgen-sdl/Makefile,v 1.15 2006/09/20 11:20:42 stas Exp $
#

PORTNAME=	dgen-sdl
PORTVERSION=	1.23
PORTREVISION=	4
CATEGORIES=	emulators
MASTER_SITES=	http://pknet.com/~joe/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A wonderful Sega Genesis/MegaDrive emulator
LICENSE=	unknown

BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm

BROKEN=	Not fetchable as of May 28, 2008

USE_SDL=	sdl
USE_GL=		yes
GNU_CONFIGURE=	yes

MAN1=		dgen.1 tobin.1
MAN5=		dgenrc.5

.include <bsd.port.mk>
