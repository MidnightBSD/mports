# New ports collection makefile for:	dgen-sdl
# Date created:				20 September 2000
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/emulators/dgen-sdl/Makefile,v 1.3 2008/05/29 21:07:25 laffer1 Exp $
# $FreeBSD: ports/emulators/dgen-sdl/Makefile,v 1.15 2006/09/20 11:20:42 stas Exp $
#

PORTNAME=	dgen-sdl
PORTVERSION=	1.23
PORTREVISION=	4
CATEGORIES=	emulators
MASTER_SITES=	ftp://ftp.gentoo.org.ua/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A wonderful Sega Genesis/MegaDrive emulator
LICENSE=	unknown

BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm

USE_SDL=	sdl
USE_GL=		yes
GNU_CONFIGURE=	yes

MAN1=		dgen.1 tobin.1
MAN5=		dgenrc.5

.include <bsd.port.mk>
