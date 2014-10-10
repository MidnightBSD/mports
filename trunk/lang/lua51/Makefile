# Created by: GreenDog <fiziologus@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/lang/lua51/Makefile 359939 2014-06-30 22:49:52Z bapt $

PORTNAME=	lua
PORTVERSION=	5.1.5
PORTREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	http://www.lua.org/ftp/
PKGNAMESUFFIX=	51

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small, compilable scripting language providing easy access to C code

LICENSE=	mit

FAKE_OPTS=	prefixhack
LUA_VER=	5.1
USES=		readline
USE_LDCONFIG=	yes

MAKE_ARGS=	__MAKE_CONF=${NONEXISTENT}
LDFLAGS+=	-lm -pthread
BUILD_WRKSRC=	${WRKSRC}/src
MAKE_ARGS+=	MYCFLAGS="${CFLAGS} ${CPPFLAGS} -DLUA_USE_LINUX" \
		MYLDFLAGS="${LDFLAGS} -Wl,-E -lreadline" \
		CC="${CC}" \
		LUA_T=lua51 \
		LUAC_T=luac51 \
		LUA_A=liblua-${LUA_VER}.a \
		LUA_SO=liblua-${LUA_VER}.so \
		LUA_SONAME=liblua-${LUA_VER}.so \
		TO_BIN="lua51 luac51" \
		TO_LIB="liblua-${LUA_VER}.a liblua-${LUA_VER}.so" \
		INSTALL_TOP=${PREFIX} \
		INSTALL_INC=${FAKE_DESTDIR}${TRUE_PREFIX}/include/lua51 \
		INSTALL_EXEC="${INSTALL_PROGRAM}"
FAKE_MAKEARGS+= ${MAKE_ARGS}

# Cope with the lack of support for Lua 5.2 in bsd.lua.mk.  These
# overrides, which are required below, should be removed once bsd.lua.mk
# understands this lua version.
LUA_PREFIX?=	${PREFIX}
LUA_SUBDIR?=	lua${PKGNAMESUFFIX}
LUA_INCDIR?=	${LUA_PREFIX}/include/${LUA_SUBDIR}
LUA_LIBDIR?=	${LUA_PREFIX}/lib

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
	@${REINPLACE_CMD} -i '' -Ee \
		's|^(prefix=).*|\1 ${PREFIX}| ; \
		s|^(libdir=).*|\1 ${LUA_LIBDIR}| ; \
		s|^(includedir=).*|\1 ${LUA_INCDIR}| ; \
		s|^(INSTALL_BIN=).*|\1 ${LUA_BINDIR}| ; \
		s|^(INSTALL_INC=).*|\1 ${LUA_INCDIR}| ; \
		s|^(INSTALL_LIB=).*|\1 ${LUA_LIBDIR}| ; \
		s|^(INSTALL_CMOD=).*|\1 ${LUA_MODLIBDIR}| ; \
		s|^(INSTALL_LMOD=).*|\1 ${LUA_MODSHAREDIR}| ; \
		s|llua|llua-${LUA_VER}|' \
		${WRKSRC}/etc/lua.pc

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/liblua-${LUA_VER}.so
	@${MV} ${PREFIX}/man/man1/lua.1 \
		${PREFIX}/man/man1/lua51.1
	@${MV} ${PREFIX}/man/man1/luac.1 \
		${PREFIX}/man/man1/luac51.1
	${INSTALL_DATA} ${WRKSRC}/etc/lua.pc \
		${PREFIX}/libdata/pkgconfig/lua-${LUA_VER}.pc

.include <bsd.port.mk>
