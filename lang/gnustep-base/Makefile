PORTNAME=	gnustep-base
DISTVERSION=	1.29.0
PORTREVISION=	1
CATEGORIES=	lang devel gnustep
MASTER_SITES=	https://github.com/gnustep/libs-base/releases/download/base-${DISTVERSION:S,.,_,g}/

PATCH_SITES=	https://github.com/gnustep/libs-base/commit/
PATCHFILES=	37913d006d96a6bdcb963f4ca4889888dcce6094.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Foundation library
WWW=		http://www.gnustep.org/

LICENSE=	gpl lgpl
LICENSE_COMB=	multi

LIB_DEPENDS+=	libunwind.so:devel/libunwind
LIB_DEPENDS+=	libffi.so:devel/libffi
LIB_DEPENDS+=	libgmp.so:math/gmp
LIB_DEPENDS+=	libgcrypt.so:security/libgcrypt

RUN_DEPENDS+=	${LOCALBASE}/GNUstep/System/Library/Makefiles/GNUstep.sh:devel/gnustep-make

USES=		pkgconfig iconv gnome gnustep
USE_GNOME=	libxml2 libxslt
USE_GNUSTEP=	build
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-procfs --disable-mixedabi --with-installation-domain=SYSTEM
CONFIGURE_ENV=	OBJCFLAGS='-fobjc-runtime=gnustep-2.0 -fblocks'

MAKE_FLAGS=	OPTFLAG="${CFLAGS}"

ETCDIR=		${LOCALBASE}/etc
STAGEHEADER=	${STAGEDIR}${PREFIX}/GNUstep/System/Library/Headers

PLIST_SUB+=	BASEVERSION=${PORTVERSION:R}

OPTIONS_DEFINE=		ICU GNUTLS
OPTIONS_RADIO=		ZEROCONF
OPTIONS_RADIO_ZEROCONF=	AVAHI MDNS
OPTIONS_DEFAULT=	ICU GNUTLS MDNS
OPTIONS_SUB=		yes

ZEROCONF_DESC=		Zeroconf (Bonjour) support
AVAHI_DESC=		Zeroconf via Avahi (preferred)
MDNS_DESC=		Zeroconf via mDNSResponder

ICU_LIB_DEPENDS=	libicuuc.so:devel/icu
ICU_CONFIGURE_OFF=	--disable-icu

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls
GNUTLS_CONFIGURE_OFF=	--disable-tls

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MAVAHI}
CONFIGURE_ARGS+=	--with-zeroconf-api=avahi
LIB_DEPENDS+=		libavahi-client.so:net/avahi-app
.elif ${PORT_OPTIONS:MMDNS}
CONFIGURE_ARGS+=	--with-zeroconf-api=mdns
#LIB_DEPENDS+=		libdns_sd.so:net/mDNSResponder
.else
CONFIGURE_ARGS+=	--disable-zeroconf
.endif

post-extract:
	@${REINPLACE_CMD} -e "s|/usr/local/|${LOCALBASE}/| ; \
		s|HAVE_TLS|HAVE_GNUTLS|" ${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${FILESDIR}/gdomap_if ${FAKE_DESTDIR}${ETCDIR}

.include <bsd.port.mk>
