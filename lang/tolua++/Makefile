PORTNAME=	tolua++
PORTVERSION=	1.0.93
CATEGORIES=	lang devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extended version of tolua, a tool to integrate C/C++ code with Lua
WWW=		https://github.com/LuaDist/toluapp

LICENSE=	mit

USES=		scons lua:51 tar:bzip2
USE_GITHUB=	yes
GH_ACCOUNT=	LuaDist
GH_PROJECT=	toluapp

MAKE_ARGS=	prefix=${PREFIX} SONAME="libtolua++-${LUA_VER}.so"

CCFLAGS+=	-I${LUA_INCDIR}
LDFLAGS+=	-L${LUA_LIBDIR}

TGT_INCDIR=	${LUA_INCDIR:C/^${LOCALBASE}/${PREFIX}/}
TGT_LIBDIR=	${LUA_LIBDIR:C/^${LOCALBASE}/${PREFIX}/}

post-patch:
	@${REINPLACE_CMD} -e "s|'lualib',||; s|lua|lua-${LUA_VER}|g" ${WRKSRC}/config_posix.py

do-install:
	@${MKDIR} ${TGT_INCDIR} ${TGT_LIBDIR}
	${INSTALL_PROGRAM} ${WRKSRC}/bin/tolua++ ${PREFIX}/bin
	${LN} -sf tolua++ ${PREFIX}/bin/tolua++-${LUA_VER}
	${INSTALL_DATA} ${WRKSRC}/include/tolua++.h ${TGT_INCDIR}
	${INSTALL_DATA} ${WRKSRC}/lib/libtolua++.a ${TGT_LIBDIR}
	${INSTALL_LIB} ${WRKSRC}/lib/libtolua++.so ${TGT_LIBDIR}
	${INSTALL_LIB} ${WRKSRC}/lib/libtolua++.so ${PREFIX}/lib/libtolua++-${LUA_VER}.so

.include <bsd.port.mk>
