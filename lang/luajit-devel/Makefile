PORTNAME=	luajit
DISTVERSION=	2.1.0.20240310
CATEGORIES=	lang
PKGNAMESUFFIX=	-devel
DISTNAME=	LuaJIT-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Just-In-Time Compiler for Lua
WWW=		https://luajit.org/luajit.html

LICENSE=	mit publicdom
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

IGNORE_riscv64=		fails to compile: lj_arch.h:73:2: No support for this architecture (yet)

CONFLICTS_INSTALL=	luajit luajit-openresty

FAKE_OPTS=	trueprefix

USES=		compiler cpe gmake
USE_LDCONFIG=	yes
MAKE_ARGS=	CC=${CC} CCOPT= CCOPT_x86= Q=

USE_GITHUB=	yes
GH_TUPLE=	LuaJIT:LuaJIT:d06beb0

LUAJIT_VERSION=	2.1
LUAJIT_SOVERSION=	2.1.1710088188

PLIST_SUB+=	VERSION=${LUAJIT_VERSION} SOVERSION=${LUAJIT_SOVERSION}

post-install:
	${LN} -sf ${PORTNAME}-${LUAJIT_SOVERSION} \
		${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${WRKSRC}/etc/luajit.1 ${STAGEDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
