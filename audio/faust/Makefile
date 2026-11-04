PORTNAME=	faust
DISTVERSION=	2.85.5
PORTREVISION=	4
CATEGORIES=	audio devel
MASTER_SITES=	https://github.com/grame-cncm/faust/releases/download/${DISTVERSION}/

PATCH_SITES=	https://github.com/grame-cncm/faust/commit/
PATCHFILES+=	e4e9e51a1a12ef0806fc7c8439fa817a98ec57ce.patch:-p1 # https://github.com/grame-cncm/faust/pull/1170: Fix compilation flags for generated projects: use c++17 instead of c++14

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Functional programming language for realtime audio signal processing
WWW=		https://faust.grame.fr/

# Covers the compiler and bundled source/templates, not every generated DSP.
# Original notices and additional Faust/Bison permissions are in DOCSDIR/NOTICE.
LICENSE=	Apache-2.0 CC-BY-4.0 agpl bsd bsd0 bsd3 gpl2+ gpl3 gpl3+ \
		iscl lgpl+ lgpl2.1+ lgpl3 lgpl3+ mit publicdom unlicense \
		AppleSample Espressif FaustArchitecture
LICENSE_COMB=	multi
LICENSE_NAME_AppleSample=	Apple sample code license
LICENSE_NAME_Espressif=	Espressif MIT license (Espressif products only)
LICENSE_NAME_FaustArchitecture=	Faust permissive sample architecture license
LICENSE_FILE_Apache-2.0=	${FILESDIR}/LICENSE.Apache-2.0
LICENSE_FILE_CC-BY-4.0=	${FILESDIR}/LICENSE.CC-BY-4.0
LICENSE_FILE_agpl=	${PORTSDIR}/Templates/Licenses/agpl
LICENSE_FILE_bsd=	${FILESDIR}/LICENSE.BSD
LICENSE_FILE_bsd0=	${FILESDIR}/LICENSE.0BSD
LICENSE_FILE_bsd3=	${FILESDIR}/LICENSE.BSD3
LICENSE_FILE_gpl2+ =	${PORTSDIR}/Templates/Licenses/gpl2
LICENSE_FILE_gpl3=	${PORTSDIR}/Templates/Licenses/gpl3
LICENSE_FILE_gpl3+ =	${PORTSDIR}/Templates/Licenses/gpl3
LICENSE_FILE_iscl=	${FILESDIR}/LICENSE.ISC
LICENSE_FILE_lgpl+ =	${PORTSDIR}/Templates/Licenses/lgpl
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING.txt
LICENSE_FILE_lgpl3=	${PORTSDIR}/Templates/Licenses/lgpl3
LICENSE_FILE_lgpl3+ =	${PORTSDIR}/Templates/Licenses/lgpl3
LICENSE_FILE_mit=	${WRKSRC}/architecture/osclib/oscpack/LICENSE
LICENSE_FILE_publicdom=	${FILESDIR}/LICENSE.PublicDomain
LICENSE_FILE_unlicense=	${FILESDIR}/LICENSE.Unlicense
LICENSE_FILE_AppleSample=	${FILESDIR}/LICENSE.AppleSample
LICENSE_FILE_Espressif=	${FILESDIR}/LICENSE.Espressif
LICENSE_FILE_FaustArchitecture=	${FILESDIR}/LICENSE.FaustArchitecture
LICENSE_PERMS_AppleSample=dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_Espressif=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_FaustArchitecture=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

LLVM_VER=	19

LIB_DEPENDS=	libLLVM-${LLVM_VERSION}.so:devel/llvm${LLVM_VERSION} \
		libzstd.so:archivers/zstd
RUN_DEPENDS=	bash:shells/bash

USES=		compiler:c++17-lang cmake localbase:ldflags llvm:min=${LLVM_VER},lib ncurses python pkgconfig shebangfix # llvm: versions <11 lacked dump() function(s) that cause unresolved symbols in libfaust.so
USES+=	cpe
CPE_VENDOR=		grame
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
CMAKE_OFF=	LINK_LLVM_STATIC # avoid LLVM static initializer crashes; use the shared dependency
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
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${FILESDIR}/NOTICE ${DOCSDIR}/NOTICE

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
