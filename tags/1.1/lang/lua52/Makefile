# Created by: GreenDog <fiziologus@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/lang/lua52/Makefile 359938 2014-06-30 22:49:27Z bapt $

PORTNAME=	lua
PORTVERSION=	5.2.3
CATEGORIES=	lang
MASTER_SITES=	http://www.lua.org/ftp/
PKGNAMESUFFIX=	52

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small, compilable scripting language providing easy access to C code

LICENSE=	mit

FAKE_OPTS=	prefixhack
LUA_VER=	5.2
USES=		readline
USE_LDCONFIG=	yes

MAKE_ARGS=	__MAKE_CONF=${NONEXISTENT}
LDFLAGS+=	-lm -pthread
BUILD_WRKSRC=	${WRKSRC}/src
MAKE_ARGS+=	MYCFLAGS="${CFLAGS} ${CPPFLAGS} -DLUA_USE_LINUX" \
		MYLDFLAGS="${LDFLAGS} -Wl,-E -lreadline" \
		CC="${CC}" \
		LUA_T=lua52 \
		LUAC_T=luac52 \
		LUA_A=liblua-${LUA_VER}.a \
		LUA_SO=liblua-${LUA_VER}.so \
		LUA_SONAME=liblua-${LUA_VER}.so \
		TO_BIN="lua52 luac52" \
		TO_LIB="liblua-${LUA_VER}.a liblua-${LUA_VER}.so" \
		INSTALL_TOP=${PREFIX} \
		INSTALL_INC=${FAKE_DESTDIR}${TRUE_PREFIX}/include/lua52 \
		INSTALL_EXEC="${INSTALL_PROGRAM}"
FAKE_MAKEARGS+=	${MAKE_ARGS}

# Cope with the lack of support for Lua 5.2 in bsd.lua.mk.  These
# overrides, which are required below, should be removed once bsd.lua.mk
# understands this lua version.
LUA_PREFIX?=	${PREFIX}
LUA_SUBDIR?=	lua${PKGNAMESUFFIX}
LUA_INCDIR?=	${LUA_PREFIX}/include/${LUA_SUBDIR}
LUA_LIBDIR?=	${LUA_PREFIX}/lib

SUB_FILES=	lua-${LUA_VER}.pc
SUB_LIST=	version=${PORTVERSION} \
		includedir=${LUA_INCDIR} \
		libdir=${LUA_LIBDIR} \
		soname=lua-${LUA_VER}

CFLAGS_amd64=	-fPIC

post-patch:
	@${REINPLACE_CMD} -Ee \
		'/^INSTALL_.*=/s/INSTALL_TOP/prefix/ ; \
		s|/usr/local|${PREFIX}|' \
		${WRKSRC}/Makefile ${WRKSRC}/src/Makefile
	@${REINPLACE_CMD} -e 's,rand *(,random(,g' \
		${WRKSRC}/src/lmathlib.c
	@${REINPLACE_CMD} -e "/LUA_ROOT/s|/usr/local|${LUA_PREFIX}|" \
		${WRKSRC}/src/luaconf.h

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/liblua-${LUA_VER}.so
	@${MV} ${PREFIX}/man/man1/lua.1 \
		${PREFIX}/man/man1/lua52.1
	@${MV} ${PREFIX}/man/man1/luac.1 \
		${PREFIX}/man/man1/luac52.1
	${INSTALL_DATA} ${WRKDIR}/lua-${LUA_VER}.pc \
		${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
