PORTNAME=	libs-base
DISTVERSION=	20260129
CATEGORIES=	lang devel gnustep
PKGNAMEPREFIX=	gershwin-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Foundation library
WWW=		http://www.gnustep.org/

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	multi

LIB_DEPENDS=	libffi.so:devel/libffi \
		libcurl.so:ftp/curl \
		libgmp.so:math/gmp

RUN_DEPENDS=	${GNUSTEP_PREFIX}System/Library/Makefiles/GNUstep.sh:devel/gershwin-tools-make

USES=		gershwin gnome iconv pkgconfig
USE_GERSHWIN=	build
USE_GITHUB=	yes
GH_ACCOUNT=	gnustep
GH_TAGNAME=	6307e47
USE_GNOME=	libxml2 libxslt
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

CONFLICTS=	gnustep-base

GNU_CONFIGURE=	yes

# configure links libbfd (GPL) whenever it is found, even with bfd disabled
CONFIGURE_ARGS+=	ac_cv_header_bfd_h=no \
			ac_cv_lib_bfd_bfd_openr=no \
			ac_cv_lib_zstd_ZSTD_compress=no \
			--with-dispatch-include=/System/Library/Headers \
			--with-dispatch-library=/System/Library/Libraries

OPTIONS_DEFINE=		ICU GNUTLS
OPTIONS_RADIO=		ZEROCONF
OPTIONS_RADIO_ZEROCONF=	AVAHI MDNS
OPTIONS_DEFAULT=	ICU GNUTLS AVAHI
OPTIONS_SUB=		yes

ZEROCONF_DESC=	Zeroconf (Bonjour) support
AVAHI_DESC=	Zeroconf via Avahi (preferred)
MDNS_DESC=	Zeroconf via mDNSResponder

ICU_LIB_DEPENDS=	libicui18n.so:devel/icu
ICU_CONFIGURE_OFF=	--disable-icu

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_CONFIGURE_OFF=	--disable-tls

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MAVAHI}
LIB_DEPENDS+=	libavahi-client.so:net/avahi-app
CONFIGURE_ARGS+=	--with-zeroconf-api=avahi
.elif ${PORT_OPTIONS:MMDNS}
LIB_DEPENDS+=	libdns_sd.so:net/mDNSResponder
CONFIGURE_ARGS+=	--with-zeroconf-api=mdns
.else
CONFIGURE_ARGS+=	--disable-zeroconf
.endif

.include <bsd.port.mk>
