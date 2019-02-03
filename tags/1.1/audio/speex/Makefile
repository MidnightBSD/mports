# $MidnightBSD$

PORTNAME=	speex
DISTVERSION=	1.2.0
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	http://downloads.us.xiph.org/releases/speex/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	open-source patent-free voice codec

LICENSE=	bsd3

LIB_DEPENDS=	libogg.so:${PORTSDIR}/audio/libogg \
		libspeexdsp.so:${PORTSDIR}/audio/speexdsp

GNU_CONFIGURE=	yes
# required for magus to generate encoder
CONFIGURE_ARGS+=	--enable-binaries
INSTALL_TARGET=	install-strip
USES=		libtool pathfix pkgconfig
USE_LDCONFIG=	yes

.include <bsd.port.mk>
