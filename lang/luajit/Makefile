PORTNAME=	luajit
DISTVERSION=	2.0.5
PORTREVISION=	1
CATEGORIES=	lang
MASTER_SITES=	https://luajit.org/download/
DISTNAME=	LuaJIT-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Just-In-Time Compiler for Lua
WWW=		https://luajit.org/luajit.html

LICENSE=	mit publicdom
LICENSE_FILE=	${WRKSRC}/COPYRIGHT
LICENSE_COMB=	multi

FAKE_OPTS=	trueprefix

OPTIONS_DEFINE=	PTHREAD
PTHREAD_DESC=	with pthread support

CONFLICTS_INSTALL=    luajit-openresty

WRKSRC=		${WRKDIR}/LuaJIT-${DISTVERSION}
USES=		cpe gmake
USE_LDCONFIG=	yes

MAKE_ARGS=	CC=${CC} CCOPT= CCOPT_x86=

PLIST_SUB+=	VERSION=${DISTVERSION}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPTHREAD}
LDFLAGS+=	-lm -pthread
.endif

post-install:
	${LN} -sf ${PREFIX}/bin/${PORTNAME}-${DISTVERSION} \
		${PREFIX}/bin/${PORTNAME}
	@${INSTALL_MAN} ${WRKSRC}/etc/luajit.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
