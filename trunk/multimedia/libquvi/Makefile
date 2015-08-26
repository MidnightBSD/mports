# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $MidnightBSD$

PORTNAME=	libquvi
PORTVERSION=	0.4.1
CATEGORIES=	multimedia devel
MASTER_SITES=	SF/quvi/${PORTVERSION:R}/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform library for parsing flash media stream URLs

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

BUILD_DEPENDS=	libquvi-scripts>=0.4.0:${PORTSDIR}/multimedia/libquvi-scripts
LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	DOCS LUAJIT
LUAJIT_DESC=	Use LuaJIT instead of Lua

CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		iconv libtool pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes

PORTDOCS=	*

LUAJIT_LIB_DEPENDS=	libluajit-5.1.so:${PORTSDIR}/lang/luajit
LUAJIT_USES_OFF=	lua

post-patch-LUAJIT-off:
	@${REINPLACE_CMD} 's|lua-5.1|lua-${LUA_VER}|g' ${WRKSRC}/configure

post-patch-LUAJIT-on:
	@${REINPLACE_CMD} 's|lua >= 5.1|luajit|g' ${WRKSRC}/configure

post-install:
	${MKDIR} ${DOCSDIR}/
	cd ${WRKSRC}/doc/nd/ && ${COPYTREE_SHARE} . ${DOCSDIR}/

.include <bsd.port.mk>
