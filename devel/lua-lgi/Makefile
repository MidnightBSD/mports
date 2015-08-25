# $MidnightBSD$
# $FreeBSD: head/devel/lua-lgi/Makefile 386880 2015-05-20 19:11:35Z amdmi3 $

PORTNAME=	lgi
PORTVERSION=	0.9.0
CATEGORIES=	devel
PKGNAMEPREFIX=	${LUA_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lua bindings to libraries using GObject-Introspection

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	pavouk

USES=		gmake lua pkgconfig
USE_GNOME=	introspection:build,run
MAKE_ENV=	LUA_CFLAGS="-I${LUA_INCDIR}"
MAKE_ARGS=	PREFIX="${PREFIX}" LUA_LIBDIR="${LUA_MODLIBDIR}" \
		LUA_INCDIR="${LUA_INCDIR}" LUA_VERSION="${LUA_VER}" \
		CORE="corelgilua${LUA_VER_STR}.so"
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's/51/${LUA_VER_STR}/g' \
		${WRKSRC}/lgi/core.c \
		${WRKSRC}/lgi/core.lua

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${LUA_MODLIBDIR}/lgi/*.so

.include <bsd.port.mk>
