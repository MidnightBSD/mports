PORTNAME=	faust
DISTVERSION=	2.85.5
PORTREVISION=	1
CATEGORIES=	audio devel
MASTER_SITES=	https://github.com/grame-cncm/faust/releases/download/${DISTVERSION}/

PATCH_SITES=	https://github.com/grame-cncm/faust/commit/
PATCHFILES+=	e4e9e51a1a12ef0806fc7c8439fa817a98ec57ce.patch:-p1 # https://github.com/grame-cncm/faust/pull/1170: Fix compilation flags for generated projects: use c++17 instead of c++14

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Functional programming language for realtime audio signal processing
WWW=		https://faust.grame.fr/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING.txt

LLVM_VER=	19

LIB_DEPENDS=	libLLVM-${LLVM_VERSION}.so:devel/llvm${LLVM_VERSION} \
		libzstd.so:archivers/zstd
RUN_DEPENDS=	bash:shells/bash

USES=		compiler:c++17-lang cmake localbase:ldflags llvm:min=${LLVM_VER},lib ncurses python pkgconfig shebangfix # llvm: versions <11 lacked dump() function(s) that cause unresolved symbols in libfaust.so
USE_LDCONFIG=	yes

USE_GITHUB=	nodefault
GH_ACCOUNT=	grame-cncm

SHEBANG_FILES=	tools/faust-config \
		tools/faust2appls/* \
		tools/faust2clap/faust2clap.py \
		tools/benchmark/faustbench \
		tools/sound2faust/sound2reader

CMAKE_SOURCE_PATH=	${WRKSRC}/build
CMAKE_ON=	INCLUDE_DYNAMIC # only installs headers and not libs without INCLUDE_DYNAMIC or INCLUDE_STATIC: https://github.com/grame-cncm/faust/issues/553
CMAKE_ARGS=	-C ${FILESDIR}/backends.cmake -DLLVM_CONFIG=${LOCALBASE}/bin/llvm-config${LLVM_VERSION} \

CXXFLAGS+=	-I${WRKSRC}/compiler/generator/cpp # fatal error: 'cpp_code_container.hh' file not found WHEN INCLUDE_STATIC=TRUE
CXXFLAGS+=	`llvm-config${LLVM_VERSION} --cflags` -DLLVM_${LLVM_VERSION}0 # for the llvm backend
CXXFLAGS_riscv64=	-fPIC # attempt to fix failure: can't create dynamic relocation R_RISCV_HI20 against symbol: vtable for LV2UI in readonly segment; recompile object files with -fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
LDFLAGS+=	-lexecinfo

OPTIONS_DEFINE=		EXAMPLES HIGHLIGHT HTTPD_LIB
OPTIONS_DEFAULT=	HIGHLIGHT HTTPD_LIB
OPTIONS_SUB=		yes

EXAMPLES_CMAKE_BOOL=	FREEBSD_INSTALL_EXAMPLES

HIGHLIGHT_DESC=		Syntax highlighting in Kate, gedit, Highlight, vim
HTTPD_LIB_DESC=		Build httpd support library

HTTPD_LIB_CMAKE_BOOL=	INCLUDE_HTTP HTTPDYNAMIC
HTTPD_LIB_LIB_DEPENDS=	libmicrohttpd.so:www/libmicrohttpd

PORTEXAMPLES=		*

post-patch:
	@${FIND} ${WRKSRC} -name "*.orig" -delete
	# change qmake (5) -> qmake6
	@cd ${WRKSRC} && \
		${REINPLACE_CMD} -i '' -e 's|echo qmake)|echo qmake6)|; s|echo qmake-qt5)|echo qmake6)|' \
			tools/faust2appls/faust2*

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/faust
	@${RM} -r ${PREFIX}/lib/faust
	@${FIND} ${PREFIX} -name android | ${XARGS} ${RM} -r
	${REINPLACE_CMD} -i '' -e 's| printsupport||g' ${PREFIX}/bin/faust2*

post-install-HIGHLIGHT-on:
	# 1) kate
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/apps/katepart/syntax
	${INSTALL_DATA} ${WRKSRC}/syntax-highlighting/faust.xml ${FAKE_DESTDIR}${PREFIX}/share/apps/katepart/syntax/
	# 2) gedit
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/gtksourceview-2.0/language-specs ${FAKE_DESTDIR}${PREFIX}/share/gtksourceview-3.0/language-specs
	${INSTALL_DATA} ${WRKSRC}/syntax-highlighting/faust.lang ${FAKE_DESTDIR}${PREFIX}/share/gtksourceview-2.0/language-specs/
	${INSTALL_DATA} ${WRKSRC}/syntax-highlighting/faust.lang ${FAKE_DESTDIR}${PREFIX}/share/gtksourceview-3.0/language-specs/
	# 4) Highlight
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/highlight/langDefs
	${INSTALL_DATA} ${WRKSRC}/syntax-highlighting/dsp.lang ${FAKE_DESTDIR}${PREFIX}/share/highlight/langDefs/
	# 5) VIM
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/vim/vimfiles/syntax
	${INSTALL_DATA} ${WRKSRC}/syntax-highlighting/faust.vim ${FAKE_DESTDIR}${PREFIX}/share/vim/vimfiles/syntax/
	# 6) EMACS TODO

.include <bsd.port.mk>
