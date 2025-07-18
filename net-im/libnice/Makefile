PORTNAME=	libnice
PORTVERSION=	0.1.21
PORTREVISION=	2
CATEGORIES=	net-im devel
MASTER_SITES=	http://nice.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and transmitter that implements ICE-19
WWW=		https://nice.freedesktop.org

LICENSE=	lgpl2.1 MPL11
LICENSE_COMB=	dual

LIB_DEPENDS?=	libgnutls.so:security/gnutls

USES=		gettext gmake gnome libtool localbase:ldflags meson pathfix \
		pkgconfig python ssl
USE_LDCONFIG=	yes
USE_GNOME=	glib20 introspection:build
CPPFLAGS+=	-DHAVE_GETIFADDRS
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	GUPNP
GUPNP_MESON_ENABLED=	gupnp
GUPNP_DESC=	UPnP IGD port mapping support
GUPNP_LIB_DEPENDS+=	libgupnp-igd-1.6.so:net/gupnp-igd

MESON_ARGS+=-Dtests=disabled -Dgtk_doc=disabled -Dcrypto-library=openssl

.if defined(LIBNICE_SLAVE)
USES+=		gstreamer
MESON_ARGS+=-Dgstreamer=enabled
.else
MESON_ARGS+=-Dgstreamer=disabled
.endif

post-patch-GUPNP-on:
	@${REINPLACE_CMD} -e 's|gupnp-igd-1.0|gupnp-igd-1.6|' ${WRKSRC}/meson.build

.include <bsd.port.mk>
