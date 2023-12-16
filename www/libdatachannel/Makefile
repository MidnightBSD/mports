PORTNAME=	libdatachannel
DISTVERSIONPREFIX=	v
DISTVERSION=	0.19.3
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WebRTC Data Channels, WebRTC Media Transport, and WebSockets library
WWW=		https://github.com/paullouisageneau/libdatachannel

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libsrtp2.so:net/libsrtp2

USES=		cmake compiler:c++17-lang ssl

USE_GITHUB=	yes
GH_ACCOUNT=	paullouisageneau
GH_TUPLE=	SergiusTheBest:plog:e21baec:SergiusTheBest_plog/deps/plog \
		sctplab:usrsctp:5ca29ac:sctplab_usrsctp/deps/usrsctp \
		paullouisageneau:libjuice:5f753ca:paullouisageneau_libjuice/deps/libjuice \
		nlohmann:json:bc889af:nlohmann_json/deps/json \
		cisco:libsrtp:a566a9cfcd619e8327784aa7cff4a1276dc1e895:cisco_libsrtp/deps/libsrtp

CMAKE_ON=	USE_SYSTEM_SRTP NO_EXAMPLES NO_TESTS

NO_TEST=	yes

.include <bsd.port.pre.mk>


.include <bsd.port.post.mk>
