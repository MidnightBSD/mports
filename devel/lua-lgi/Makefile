PORTNAME=	lgi
PORTVERSION=	0.9.2
PORTREVISION=	2
CATEGORIES=	devel
PKGNAMEPREFIX=	${LUA_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lua bindings to libraries using GObject-Introspection

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS+=	libffi.so:devel/libffi

USE_GITHUB=	yes
GH_ACCOUNT=	pavouk

USES=		gmake gnome lua:-53,module pkgconfig
USE_GNOME=	introspection:build,run
MAKE_ENV=	LUA_CFLAGS="-I${LUA_INCDIR}"
MAKE_ARGS=	PREFIX="${PREFIX}" LUA_LIBDIR="${LUA_MODLIBDIR}" \
		LUA_INCDIR="${LUA_INCDIR}" LUA_VERSION="${LUA_VER}" \
		CORE="corelgilua${LUA_VER_STR}.so" LUA="${LUA_CMD}"
#TEST_TARGET=	check
NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's/51/${LUA_VER_STR}/g' \
		${WRKSRC}/lgi/core.c \
		${WRKSRC}/lgi/core.lua

post-install:
	@${STRIP_CMD} ${LUA_MODLIBDIR}/lgi/*.so

.include <bsd.port.mk>
