PORTNAME=	luajit
DISTVERSION=	2.1.0.20230104
CATEGORIES=	lang
PKGNAMESUFFIX=	-devel
DISTNAME=	LuaJIT-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Just-In-Time Compiler for Lua
WWW=		https://luajit.org/luajit.html

LICENSE=	mit publicdom
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

CONFLICTS_INSTALL=	luajit luajit-openresty

USES=		compiler cpe gmake
USE_LDCONFIG=	yes
MAKE_ARGS=	CC=${CC} CCOPT= CCOPT_x86= Q=

USE_GITHUB=	yes
GH_TUPLE=	LuaJIT:LuaJIT:d0e8893

LUAJIT_VERSION=	2.1.0-beta3
LUAJIT_SOVERSION=	2.1.0

PLIST_SUB+=	VERSION=${LUAJIT_VERSION} SOVERSION=${LUAJIT_SOVERSION}

.include <bsd.port.pre.mk>

.if ${ARCH:Mpowerpc*} && ${COMPILER_VERSION} < 140
BUILD_DEPENDS+=	as:devel/binutils
CFLAGS+=	-fno-integrated-as
.endif

post-install:
	${LN} -sf ${PORTNAME}-${LUAJIT_VERSION} \
		${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${WRKSRC}/etc/luajit.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include <bsd.port.post.mk>