# Created by: Martin Matuska <mm@FreeBSD.org>

PORTNAME=	luajit
DISTVERSIONPREFIX=	v
DISTVERSION=	2.1-20200102
CATEGORIES=	lang
PKGNAMESUFFIX=	-openresty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Just-In-Time Compiler for Lua (OpenResty branch)

LICENSE=	mit publicdom
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

FAKE_OPTS=    trueprefix

USES=		gmake

CONFLICTS_INSTALL=	luajit

USE_LDCONFIG=	yes
MAKE_ARGS=	CC=${CC}

USE_GITHUB=	yes
GH_ACCOUNT=	openresty
GH_PROJECT=	luajit2

LUAJIT_VERSION=	2.1.0-beta3
LUAJIT_SOVERSION=	2.1.0

PLIST_SUB+=	VERSION=${LUAJIT_VERSION} SOVERSION=${LUAJIT_SOVERSION}

.include <bsd.mport.options.mk>

.if ${ARCH:Mpowerpc*} || ${ARCH:Mmips*} || ${ARCH:Msparc*}
USE_GCC=yes
.endif

post-install:
	${LN} -sf ${PORTNAME}-${LUAJIT_VERSION} \
		${STAGEDIR}${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${WRKSRC}/etc/luajit.1 ${STAGEDIR}${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
