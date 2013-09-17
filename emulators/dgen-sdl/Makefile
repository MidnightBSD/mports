# $MidnightBSD$

PORTNAME=	dgen-sdl
PORTVERSION=	1.32
CATEGORIES=	emulators
MASTER_SITES=	SF/dgen/dgen/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wonderful Sega Genesis/MegaDrive emulator
LICENSE=	unknown

USE_SDL=	sdl
USE_GL=		yes
GNU_CONFIGURE=	yes

MAN1=		dgen.1 dgen_tobin.1
MAN5=		dgenrc.5

.include <bsd.port.pre.mk>

.if ${ARCH} == i386
BUILD_DEPENDS+=	nasm:${PORTSDIR}/devel/nasm
.else
CONFIGURE_ARGS+=	--disable-asm
.endif

.include <bsd.port.post.mk>
