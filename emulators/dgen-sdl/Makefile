PORTNAME=	dgen-sdl
PORTVERSION=	1.33
PORTREVISION=	1
CATEGORIES=	emulators
MASTER_SITES=	SF/dgen/dgen/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wonderful Sega Genesis/MegaDrive emulator
LICENSE=	unknown

USE_SDL=	sdl
USE_GL=		glu
USES=		gl gmake libarchive sdl
GNU_CONFIGURE=	yes

PLIST_FILES=	bin/dgen \
		bin/dgen_tobin \
		share/man/man1/dgen.1.gz \
		share/man/man1/dgen_tobin.1.gz \
		share/man/man5/dgenrc.5.gz

.include <bsd.port.pre.mk>

.if ${ARCH} == i386
BUILD_DEPENDS+=	nasm:devel/nasm
.else
CONFIGURE_ARGS+=	--disable-asm
.endif

post-patch:
	@${REINPLACE_CMD} -e '/@NASM@/s/--//' \
		${WRKSRC}/Makefile.in \
		${WRKSRC}/mz80/Makefile.in \
		${WRKSRC}/star/Makefile.in

.include <bsd.port.post.mk>
