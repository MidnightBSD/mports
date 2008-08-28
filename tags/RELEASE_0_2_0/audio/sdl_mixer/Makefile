# New ports collection makefile for:	sdl_mixer
# Date created:				24 April 2000
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/audio/sdl_mixer/Makefile,v 1.3 2007/10/20 05:24:59 laffer1 Exp $
# $FreeBSD: ports/audio/sdl_mixer/Makefile,v 1.38 2006/09/01 21:34:13 shaun Exp $
#

PORTNAME=	sdl_mixer
PORTVERSION=	1.2.7
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://www.libsdl.org/projects/SDL_mixer/release/
DISTNAME=	SDL_mixer-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A sample multi-channel audio mixer library
LICENSE=	lgpl

USE_SDL=	sdl
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -I${X11BASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -L${X11BASE}/lib"
USE_LDCONFIG=	yes

OPTIONS=	MIKMOD "Enable MOD music via libMikMod" on \
		VORBIS "Enable Ogg Vorbis music" on \
		SMPEG "Enable MP3 music via SMPEG" on

.include <bsd.port.pre.mk>

.if defined(WITHOUT_MIKMOD)
CONFIGURE_ARGS+=	--disable-music-libmikmod
.else
LIB_DEPENDS=	mikmod.2:${PORTSDIR}/audio/libmikmod
.endif

.if defined(WITHOUT_VORBIS)
CONFIGURE_ARGS+=	--disable-music-ogg
.else
LIB_DEPENDS+=	vorbis.4:${PORTSDIR}/audio/libvorbis
.endif

.if defined(WITHOUT_SMPEG)
CONFIGURE_ARGS+=	--disable-music-mp3
.else
LIB_DEPENDS+=	smpeg.1:${PORTSDIR}/multimedia/smpeg
.endif

.include <bsd.port.post.mk>
