PORTNAME=	advancemame
PORTVERSION=	1.5
PORTREVISION=	5
CATEGORIES=	emulators
MASTER_SITES=	https://github.com/amadvance/advancemame/releases/download/${DISTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SDL MAME port with advanced TV and monitor video support

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexpat.so:textproc/expat2

USES=		compiler:c11 gmake ncurses sdl
USE_SDL=	sdl
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-svgalib --disable-fb --disable-alsa --enable-oss \
		--disable-kevent

CFLAGS+=	-idirafter ${LOCALBASE}/include \
		-fcommon
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_JOBS_UNSAFE=	yes

DOCSDIR=	${PREFIX}/share/doc/advance
DATADIR=	${PREFIX}/share/advance

PORTDOCS=	*

OPTIONS_DEFINE=		DOCS FREETYPE SLANG
OPTIONS_DEFINE_i386=	ASM
OPTIONS_DEFAULT=	FREETYPE
OPTIONS_DEFAULT_i386=	ASM

ASM_BUILD_DEPENDS=	nasm:devel/nasm
ASM_USE=		gcc=8
ASM_CONFIGURE_ENABLE=	asm
FREETYPE_LIB_DEPENDS=	libfreetype.so:print/freetype2
FREETYPE_CONFIGURE_ENABLE=	freetype
SLANG_LIB_DEPENDS=	libslang.so:devel/libslang2
SLANG_CONFIGURE_ENABLE=	slang
SLANG_LDFLAGS=		-lncurses

post-patch:
	@${REINPLACE_CMD} -e \
		's|-lpthread|-pthread| ; \
		 /prefix/s|^\(docdir\)|#\1| ; \
		 /prefix/s|^\(mandir\)|#\1|' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		's|@@|@| ; \
		 /^INSTALL_PROGRAM /s|=.*|= @INSTALL_PROGRAM@| ; \
		 /^INSTALL_MAN /s|=.*|= @INSTALL_MAN@| ; \
		 /^INSTALL_DATA /s|=.*|= @INSTALL_DATA@|' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's|\([[:space:]]\)\($$(bindir)\)|\1$$(DESTDIR)\2| ; \
		 s|\([[:space:]]\)\($$(pkgdir)\)|\1$$(DESTDIR)\2| ; \
		 s|\([[:space:]]\)\($$(pkgdocdir)\)|\1$$(DESTDIR)\2| ; \
		 s|\([[:space:]]\)\($$(mandir)\)|\1$$(DESTDIR)\2| ; \
		 /WHOLE_CFLAGS_OPT/s|-O2|| ; \
		 /WHOLE_LDFLAGS/s|-s||' ${WRKSRC}/advance/advance.mak
	@${REINPLACE_CMD} -e \
		's|-lpthread|-pthread|' ${WRKSRC}/advance/emu.mak

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC} && ${INSTALL_DATA} HISTORY README RELEASE \
		${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
