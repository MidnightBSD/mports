PORTNAME=	shairplay
PORTVERSION=	0.9.0.20150921
CATEGORIES=	audio

MAINTAINER=	mickael.maillot@gmail.com
COMMENT=	Portable AirPlay server implementation
WWW=		https://github.com/juhovh/shairplay

LICENSE=	bsd3 lgpl2.1 mit
LICENSE_COMB=	multi

LIB_DEPENDS=	libao.so:audio/libao

USES=		autoreconf gmake libtool pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	juhovh
GH_TAGNAME=	498bc5b

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFAULT=	MDNSRESPONDER
OPTIONS_SINGLE=		ZEROCONF
OPTIONS_SINGLE_ZEROCONF=	AVAHI MDNSRESPONDER
AVAHI_LIB_DEPENDS=		libdns_sd.so:net/avahi-libdns

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMDNSRESPONDER}
LIBS+=		-ldns_sd
.endif

.include <bsd.port.mk>
