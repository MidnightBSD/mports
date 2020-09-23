# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	libquvi
PORTVERSION=	0.9.4
PORTREVISION=	2
CATEGORIES=	multimedia devel
MASTER_SITES=	SF/quvi/${PORTVERSION:R}/${PORTNAME}/ \
		FREEBSD_LOCAL/sunpoet
PKGNAMESUFFIX=	09

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform library for parsing flash media stream URLs

LICENSE=	agpl

BUILD_DEPENDS=	libquvi-scripts09>=0.9:multimedia/libquvi-scripts09
LIB_DEPENDS=	libcurl.so:ftp/curl \
		libproxy.so:net/libproxy \
		libgcrypt.so:security/libgcrypt
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	DOCS

CONFIGURE_ARGS=	--program-suffix=${PKGNAMESUFFIX}
CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_GNOME=	glib20
USES=		gnome iconv libtool lua pathfix pkgconfig tar:xz

PLIST_SUB=	PKGNAMESUFFIX=${PKGNAMESUFFIX} PORTVERSION=${PORTVERSION} QUVIVERSION=${PORTVERSION:R}

post-patch:
	@${REINPLACE_CMD} 's/lua-5.1/lua-${LUA_VER}/g' ${WRKSRC}/configure

.include <bsd.port.mk>
