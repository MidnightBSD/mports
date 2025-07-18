PORTNAME=	neovim
DISTVERSIONPREFIX=	v
DISTVERSION=	0.10.2
CATEGORIES=	editors

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Next-generation Vim
WWW=		https://neovim.io/

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${LUA_REFMODLIBDIR}/bit.so:devel/lua-bitop@${LUA_FLAVOR} \
		${LUA_REFMODLIBDIR}/lpeg.so:devel/lua-lpeg@${LUA_FLAVOR}
RUN_DEPENDS=	${LUA_REFMODLIBDIR}/bit.so:devel/lua-bitop@${LUA_FLAVOR} \
		${LUA_REFMODLIBDIR}/lpeg.so:devel/lua-lpeg@${LUA_FLAVOR}
LIB_DEPENDS=	libluv.so:devel/luv \
		libmsgpack-c.so:devel/msgpack-c \
		libtree-sitter.so:devel/tree-sitter \
		libunibilium.so:devel/unibilium \
		libuv.so:devel/libuv \
		libvterm.so:devel/libvterm

USES=		cmake cpe gettext iconv lua:51,build luajit \
		pathfix pkgconfig

USE_GITHUB=	yes
GH_TUPLE=	tree-sitter:tree-sitter-c:v0.23.1:treesitter_c \
		tree-sitter-grammars:tree-sitter-lua:v0.2.0:treesitter_lua \
		MDeiml:tree-sitter-markdown:v0.3.2:treesitter_markdown \
		tree-sitter-grammars:tree-sitter-query:v0.4.0:treesitter_query \
		neovim:tree-sitter-vim:v0.4.0:treesitter_vim \
		neovim:tree-sitter-vimdoc:v3.0.0:treesitter_vimdoc

CMAKE_ARGS=	-DLUA_PRG:FILEPATH="${LUA_CMD}" \
		-DCMAKE_INSTALL_MANDIR:PATH="${PREFIX}/share/man" \
		-DDEPS_PREFIX:PATH="${LOCALBASE}" \
		-DCMAKE_LIBRARY_PATH:PATH="${LOCALBASE}/lib/lua/${LUA_VER}"

CFLAGS+=	-I${LOCALBASE}/include

DATADIR=	${PREFIX}/share/nvim
PORTSCOUT=	limit:^[0-9\.v]+$$
PORTDATA=	runtime

OPTIONS_DEFINE=	NLS PYNVIM
OPTIONS_SUB=	yes

PYNVIM_DESC=	Enable support for plugins written in python

NLS_CMAKE_BOOL=		ENABLE_LIBINTL

PYNVIM_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pynvim>=0.3.0:editors/py-pynvim@${PY_FLAVOR}
PYNVIM_USES=		python:run

post-configure:
	${MKDIR} ${BUILD_WRKSRC}/.deps/build/src
	${MV} ${WRKSRC_treesitter_c} ${BUILD_WRKSRC}/.deps/build/src/treesitter_c
	${MV} ${WRKSRC_treesitter_lua} ${BUILD_WRKSRC}/.deps/build/src/treesitter_lua
	${MV} ${WRKSRC_treesitter_markdown} ${BUILD_WRKSRC}/.deps/build/src/treesitter_markdown
	${MV} ${WRKSRC_treesitter_query} ${BUILD_WRKSRC}/.deps/build/src/treesitter_query
	${MV} ${WRKSRC_treesitter_vim} ${BUILD_WRKSRC}/.deps/build/src/treesitter_vim
	${MV} ${WRKSRC_treesitter_vimdoc} ${BUILD_WRKSRC}/.deps/build/src/treesitter_vimdoc
	${MAKE_ENV} ${CMAKE_BIN} -S ${WRKSRC}/cmake.deps -B ${BUILD_WRKSRC}/.deps ${CMAKE_ARGS} \
		-DUSE_BUNDLED:BOOL=OFF -DUSE_BUNDLED_TS_PARSERS:BOOL=ON \
		-DUSE_EXISTING_SRC_DIR:BOOL=ON

post-build:
	${CMAKE_BIN} --build ${BUILD_WRKSRC}/.deps

post-fake:
	cd ${BUILD_WRKSRC}/.deps/usr/lib/nvim && ${COPYTREE_SHARE} parser ${FAKE_DESTDIR}${PREFIX}/lib/nvim
	${FIND} ${FAKE_DESTDIR}${PREFIX}/lib/nvim -name "*.so" -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
