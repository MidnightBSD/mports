PORTNAME=	luajit
DISTVERSIONPREFIX=	v
DISTVERSION=	2.1-20230119
CATEGORIES=	lang
PKGNAMESUFFIX=	-openresty

PATCH_SITES=	https://github.com/openresty/luajit2/commit/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Just-In-Time Compiler for Lua (OpenResty branch)
WWW=		https://github.com/openresty/luajit2

LICENSE=	mit publicdom
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

FAKE_OPTS=	trueprefix

USES=		cpe gmake

CONFLICTS_INSTALL=	luajit luajit-devel

USE_LDCONFIG=	yes
MAKE_ARGS=	CC=${CC} Q=

USE_GITHUB=	yes
GH_ACCOUNT=	openresty
GH_PROJECT=	luajit2

LUAJIT_VERSION=	2.1.0-beta3
LUAJIT_SOVERSION=	2.1.0

PLIST_SUB+=	VERSION=${LUAJIT_VERSION} SOVERSION=${LUAJIT_SOVERSION}

.include <bsd.mport.options.mk>

post-install:
	${STRIP_CMD} ${PREFIX}/bin/${PORTNAME}-${LUAJIT_VERSION}
	${STRIP_CMD} ${PREFIX}/lib/libluajit-5.1.so.${LUAJIT_SOVERSION}
	${LN} -sf ${PORTNAME}-${LUAJIT_VERSION} \
		${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${WRKSRC}/etc/luajit.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
