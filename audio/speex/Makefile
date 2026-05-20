PORTNAME=	speex
DISTVERSION=	1.2.1
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	https://downloads.xiph.org/releases/speex/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source patent-free voice codec
WWW=		https://www.speex.org/

LICENSE=	bsd3

LIB_DEPENDS=	libogg.so:audio/libogg \
		libspeexdsp.so:audio/speexdsp

GNU_CONFIGURE=	yes
# required for magus to generate encoder
CONFIGURE_ARGS+=	--enable-binaries
INSTALL_TARGET=	install-strip
USES=		libtool pathfix pkgconfig cpe
CPE_VENDOR=	xiph
USE_LDCONFIG=	yes

.include <bsd.port.mk>
