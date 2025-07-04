PORTNAME=	ptlib
PORTVERSION=	2.10.11
PORTREVISION=	7
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross platform C++ library, used by OPAL
WWW=		http://www.opalvoip.org

LICENSE=	MPL20

LIB_DEPENDS=	libexpat.so:textproc/expat2

CONFLICTS=	pwlib-1.*

USES=		autoreconf:build bison compiler:c11 gmake localbase:ldflags \
		pathfix pkgconfig ssl tar:xz
BROKEN_SSL=	openssl openssl31
BROKEN_SSL_REASON=	Uses OpenSSL 3.0.0 deprecated BIO_s_file_internal

USE_LDCONFIG=	yes
CPPFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

NO_TEST=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-bsdvideo \
		--enable-audio \
		--disable-lua \
		--disable-sasl \
		--enable-ipv6 \
		--enable-exceptions \
		--enable-oss \
		--enable-plugins

# --with-expat-dir="${LOCALBASE}"
CONFIGURE_ENV+=	OPENSSL_CFLAGS="-I${OPENSSLINC}" \
		OPENSSL_LIBS="-L${OPENSSLLIB} -lssl" \
		OSRELEASE=${OSRELEASE}

.include <bsd.mport.options.mk>

.if ${OSVERSION} > 300000
OSRELEASE=1203507
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4
.else
OSRELEASE=1103509
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
.endif

.if (${SSL_DEFAULT} == base) || ${SSL_DEFAULT} == openssl
EXTRA_PATCHES+= ${FILESDIR}/extra-patch-src_ptclib_pssl.cxx-openssl111
.else
EXTRA_PATCHES+= ${FILESDIR}/extra-patch-src_ptclib_pssl.cxx
.endif

PLIST_SUB+=	PORTVERSION=${PORTVERSION} \
		PVERSION_MAJOR=${PVERSION_MAJOR} \
		PVERSION_MINOR=${PVERSION_MINOR}

OPTIONS_DEFINE=	ODBC ALSA JABBER V4L SDL LDAP PULSEAUDIO
OPTIONS_DEFAULT=SDL V4L JABBER
OPTIONS_SUB=	yes


PVERSION_MAJOR=	${PORTVERSION:C/.[0-9]+.[0-9]+.//}
PVERSION_MINOR=	${PORTVERSION:C/.[0-9]+$//g}

ALSA_LIB_DEPENDS=	libasound.so:audio/alsa-lib
ALSA_CONFIGURE_ENABLE=alsa
JABBER_CONFIGURE_ON=--enable-jabber
JABBER_VARS=	PTLIB_VIDEO=1
LDAP_USES=	ldap
LDAP_USE=	OPENLDAP=yes
LDAP_CONFIGURE_ENABLE=openldap

ODBC_LIB_DEPENDS=	libodbc.so:databases/unixODBC
ODBC_CONFIGURE_ENABLE=	odbc
PULSEAUDIO_LIB_DEPENDS=	libpulse.so:audio/pulseaudio
PULSEAUDIO_CONFIGURE_ENABLE=pulse
SDL_USES=		sdl
SDL_USE=	SDL=sdl
SDL_CONFIGURE_ENABLE=sdl
V4L_BUILD_DEPENDS=	v4l_compat>=0:multimedia/v4l_compat
V4L_LIB_DEPENDS=	libv4l2.so:multimedia/libv4l
V4L_CONFIGURE_ENABLE=	v4l v4l2
V4L_VARS=	PTLIB_VIDEO=1

.if defined(PTLIB_VIDEO)
CONFIGURE_ARGS+=--enable-video --enable-vidfile
PLIST_SUB+=	VIDEODIR=""
.else
CONFIGURE_ARGS+=--disable-video --disable-vidfile
PLIST_SUB+=	VIDEODIR="@comment "
.endif

CONFIGURE_ARGS+=	--disable-avc
PLIST_SUB+=	AVC1394="@comment "
CONFIGURE_ARGS+=	--disable-dc

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == clang && ${COMPILER_VERSION} >= 160
CPPFLAGS+=	-Dregister= -Wno-error=dynamic-exception-spec
.endif

post-patch:
	@${REINPLACE_CMD} -e 's/RTF_WASCLONED/0x20000/' ${WRKSRC}/src/ptlib/unix/socket.cxx
.if ${COMPILER_TYPE} == clang && ${COMPILER_VERSION} >= 160
	@${REINPLACE_CMD} -e 's|auto_ptr|unique_ptr|' \
		${WRKSRC}/include/ptlib/psharedptr.h
	@${REINPLACE_CMD} -e 's|public binary_function|public __binary_function|' \
		${WRKSRC}/include/ptlib/pprocess.h
.endif

pre-configure:
	(cd ${WRKSRC}/plugins/ && ${AUTORECONF} -fi)

post-install:
	${LN} -sf libpt.so.${PORTVERSION} ${STAGEDIR}${PREFIX}/lib/libpt.so.${PVERSION_MAJOR}
	${LN} -sf libpt.so.${PORTVERSION} ${STAGEDIR}${PREFIX}/lib/libpt.so.${PVERSION_MINOR}
	@${CHMOD} 0755 ${STAGEDIR}${PREFIX}/lib/libpt.so.${PORTVERSION} \
		${STAGEDIR}${PREFIX}/lib/ptlib-${PORTVERSION}/devices/*/*.so
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libpt.so.${PORTVERSION}
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/ptlib-${PORTVERSION}/devices/*/*.so

.include <bsd.port.post.mk>
