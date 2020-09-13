PORTNAME=	luajit
DISTVERSION=	2.0.5
CATEGORIES=	lang
MASTER_SITES=	https://luajit.org/download/
DISTNAME=	LuaJIT-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Just-In-Time Compiler for Lua

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

FAKE_OPTS=	trueprefix

CONFLICTS_INSTALL=    luajit-openresty

WRKSRC=		${WRKDIR}/LuaJIT-${DISTVERSION}
USES=		gmake
USE_LDCONFIG=	yes

PLIST_SUB+=	VERSION=${DISTVERSION}

post-install:
	${LN} -sf ${PREFIX}/bin/${PORTNAME}-${DISTVERSION} \
		${PREFIX}/bin/${PORTNAME}
	@${INSTALL_MAN} ${WRKSRC}/etc/luajit.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
