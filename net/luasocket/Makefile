# Created by: Jan Hornyak <pav@oook.cz>

PORTNAME=	luasocket
DISTVERSIONPREFIX=	v
DISTVERSION=	3.0-rc1
PORTEPOCH=	1
CATEGORIES=	net
PKGNAMEPREFIX=	${LUA_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Socket support for the Lua language

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	diegonehab

MAKE_ARGS=	LUAV=${LUA_VER}
USES=		gmake lua:module pkgconfig
INSTALL_TARGET=	install-unix

CFLAGS+=	`pkgconf --cflags lua-${LUA_VER}` \
		-DLUA_COMPAT_APIINTCASTS
LDFLAGS+=	-shared  `pkgconf --libs lua-${LUA_VER}`

OPTIONS_DEFINE=	DOCS

DOCSDIR=	${LUA_DOCSDIR}

post-extract:
	@${MV} ${WRKSRC}/makefile ${WRKSRC}/Makefile
	@${MV} ${WRKSRC}/src/makefile ${WRKSRC}/src/Makefile
	@${REINPLACE_CMD} -e 's|gcc|${CC}|g' ${WRKSRC}/src/Makefile
	@${REINPLACE_CMD} -e 's|CFLAGS=|CFLAGS\+=|g' ${WRKSRC}/src/Makefile
	@${REINPLACE_CMD} -e 's|LDFLAGS=|LDFLAGS\+=|g' ${WRKSRC}/src/Makefile
	@${REINPLACE_CMD} -e 's/prefix/PREFIX/g' ${WRKSRC}/src/Makefile

#post-install:
#@${STRIP_CMD} ${STAGEDIR}${LUA_MODLIBDIR:S|^${LOCALBASE}|${TRUE_PREFIX}|}/*/*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}/${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/* ${FAKE_DESTDIR}/${DOCSDIR}

.include <bsd.port.mk>
