PORTNAME=	librist
DISTVERSION=	0.2.10
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for Reliable Internet Stream Transport (RIST) protocol
WWW=		https://code.videolan.org/rist/librist

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcjson.so:devel/libcjson \
		libmbedcrypto.so:security/mbedtls \
		libmicrohttpd.so:www/libmicrohttpd

USES=		localbase:ldflags meson pkgconfig
USE_GITLAB=	yes
USE_LDCONFIG=	yes

GL_SITE=	https://code.videolan.org
GL_ACCOUNT=	rist
GL_TAGNAME=	1e805500dc14a507598cebdd49557c32e514899f

MESON_ARGS=	-Dtest=false
NO_TEST=	yes

.include <bsd.port.mk>
