PORTNAME=	libzmq4
DISTVERSIONPREFIX=	v
DISTVERSION=	4.3.5
CATEGORIES=	net
MASTER_SITES=	https://github.com/zeromq/libzmq/releases/download/${DISTVERSIONFULL}/
DISTNAME=	zeromq-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZeroMQ core library (Version 4)
WWW=		https://www.zeromq.org/

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gmake libtool pkgconfig
USE_LDCONFIG=	yes

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--disable-silent-rules \
			--disable-Werror \
			--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig \
			--mandir=${PREFIX}/share/man
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

INSTALL_TARGET=	install-strip
NO_TEST=	yes

CFLAGS+=	-Wno-long-long

CONFLICTS=	libzmq[^4] zmq

OPTIONS_DEFINE=			LIBUNWIND MANPAGES STATIC
OPTIONS_DEFAULT=		MANPAGES NORM PGM STATIC
OPTIONS_GROUP=			MULTICAST
OPTIONS_GROUP_MULTICAST=	NORM PGM
OPTIONS_RADIO=			CURVE
OPTIONS_RADIO_CURVE=		SODIUM
OPTIONS_SUB=			yes

CURVE_DESC=	CURVE security backend
LIBUNWIND_DESC=	Use libunwind to print stack trace in case of error
MULTICAST_DESC=	Reliable Multicast Transports
NORM_DESC=	Enable NORM via NRL
PGM_DESC=	Enable PGM transport via OpenPGM
SODIUM_DESC=	Use libsodium

LIBUNWIND_LIB_DEPENDS=		libunwind.so:devel/libunwind
LIBUNWIND_CONFIGURE_ENABLE=	libunwind
MANPAGES_BUILD_DEPENDS=		asciidoc:textproc/asciidoc \
				xmlto:textproc/xmlto
MANPAGES_CONFIGURE_WITH=	docs
NORM_LIB_DEPENDS=		libnorm.so:net/norm
NORM_CONFIGURE_WITH=		norm=${PREFIX}
PGM_LIB_DEPENDS=		libpgm.so:net/openpgm
PGM_CONFIGURE_WITH=		pgm
SODIUM_LIB_DEPENDS=		libsodium.so:security/libsodium
SODIUM_CONFIGURE_WITH=		libsodium
SODIUM_PLIST_FILES=		bin/curve_keygen
STATIC_CONFIGURE_OFF=		--disable-static

.include <bsd.mport.options.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if !${PORT_OPTIONS:MSODIUM}
CONFIGURE_ARGS+=	--disable-curve
.endif

.include <bsd.port.mk>
