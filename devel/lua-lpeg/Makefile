PORTNAME=	lpeg
PORTVERSION=	1.1.0
CATEGORIES=	devel
MASTER_SITES=	https://www.inf.puc-rio.br/~roberto/lpeg/ \
		FREEBSD_LOCAL/sunpoet
PKGNAMEPREFIX=	${LUA_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PEG-based pattern-matching library for Lua
WWW=		https://www.inf.puc-rio.br/~roberto/lpeg/ \
		https://github.com/roberto-ieru/LPeg

LICENSE=	mit

USES=		lua:module

ALL_TARGET=	linux
MAKE_ARGS=	CC=${CC} LUADIR=${LUA_INCDIR}
MAKEFILE=	${WRKSRC}/makefile

PLIST_FILES=	${LUA_MODLIBDIR}/lpeg.so \
		${LUA_MODSHAREDIR}/re.lua

do-install:
	@${MKDIR} ${STAGEDIR}${LUA_MODLIBDIR} ${STAGEDIR}${LUA_MODSHAREDIR}
	${INSTALL_LIB} ${WRKSRC}/${PORTNAME}.so ${STAGEDIR}${LUA_MODLIBDIR}
	${INSTALL_DATA} ${WRKSRC}/re.lua ${STAGEDIR}${LUA_MODSHAREDIR}

.include <bsd.port.mk>
