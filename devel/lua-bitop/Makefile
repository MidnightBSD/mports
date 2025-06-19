PORTNAME=	bitop
PORTVERSION=	1.0.3
CATEGORIES=	devel
MASTER_SITES=	http://bitop.luajit.org/download/ \
		FREEBSD_LOCAL/sunpoet
PKGNAMEPREFIX=	${LUA_PKGNAMEPREFIX}
DISTNAME=	LuaBitOp-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bitwise operations on numbers
WWW=		https://bitop.luajit.org/

LICENSE=	mit

CFLAGS+=	-I${LUA_INCDIR}
MAKE_ARGS=	CC=${CC} LUA=${LUA_CMD}
TEST_TARGET=	test
USES=		gmake lua:module

PLIST_FILES=	${LUA_MODLIBDIR}/bit.so

.include <bsd.port.pre.mk>

.if ${LUA_VER_STR} >= 53
CFLAGS+=	-DLUA_NUMBER_DOUBLE
EXTRA_PATCHES+=	${PATCHDIR}/extra-patch-bittest.lua
.endif

do-install:
	${MKDIR} ${LUA_MODLIBDIR}/
	${INSTALL_LIB} ${WRKSRC}/bit.so ${LUA_MODLIBDIR}/

.include <bsd.port.post.mk>
