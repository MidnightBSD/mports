# $MidnightBSD$

PORTNAME=	libxul
DISTVERSION=	45.6.0
CATEGORIES?=	www devel
MASTER_SITES=	MOZILLA/firefox/releases/${DISTVERSION}esr/source \
		MOZILLA/firefox/candidates/${DISTVERSION}esr-candidates/build2/source
DISTNAME=	firefox-${DISTVERSION}esr.source

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Mozilla runtime package that can be used to bootstrap XUL+XPCOM apps

LICENSE=	mpl

MAKE_JOBS_UNSAFE=	yes
#USE_GCC=	4.8+

BUILD_DEPENDS=	nspr>=4.12:${PORTSDIR}/devel/nspr \
		nss>=3.21.1:${PORTSDIR}/security/nss \
		libevent>=2.0.21_2:${PORTSDIR}/devel/libevent \
		soundtouch>=1.9.0:${PORTSDIR}/audio/soundtouch \
		harfbuzz>=1.1.0:${PORTSDIR}/print/harfbuzz \
		graphite2>=1.3.6:${PORTSDIR}/graphics/graphite2 \
		png>=1.6.19:${PORTSDIR}/graphics/png \
		libvorbis>=1.3.5,3:${PORTSDIR}/audio/libvorbis \
		libvpx>=1.5.0:${PORTSDIR}/multimedia/libvpx \
		sqlite3>=3.9.1:${PORTSDIR}/databases/sqlite3 \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3 \
		v4l_compat>0:${PORTSDIR}/multimedia/v4l_compat \
		autoconf-2.13:${PORTSDIR}/devel/autoconf213 \
		yasm:${PORTSDIR}/devel/yasm \
		zip:${PORTSDIR}/archivers/zip

LIB_DEPENDS=	libv4l2.so:${PORTSDIR}/multimedia/libv4l

WRKSRC:=	${WRKDIR}/firefox-${DISTVERSION}esr
CONFLICTS_INSTALL=	libxul-1.9.*

USE_GL=		gl
USES=		pathfix tar:xz
MAKE_ENV=	SKIP_GRE_REGISTRATION=1 mozappdir=${PREFIX}/lib/${MOZILLA} \
		__FreeBSD__=9
LDFLAGS+=	-Wl,-rpath,${PREFIX}/lib/${MOZ_RPATH}
USE_LDCONFIG=	${PREFIX}/lib/${MOZILLA}

MOZ_OPTIONS?=	--enable-application=xulrunner --disable-webrtc \
		--disable-sandbox --disable-pie
USE_GECKO=	gecko
CPE_PRODUCT=	firefox_esr
MOZILLA_EXEC_NAME=xulrunner
USE_MOZILLA=	# empty
MOZILLA_PLIST_DIRS=	bin include lib share/idl libdata
MOZ_PKGCONFIG_FILES=	libxul-embedding libxul mozilla-js \
			mozilla-plugin

OPTIONS_EXCLUDE=	GSTREAMER LOGGING
OPTIONS_DEFINE=		RUST
OPTIONS_DEFAULT=	BUNDLED_CAIRO GTK2

OPTIONS_SINGLE+=	TOOLKIT
OPTIONS_SINGLE_TOOLKIT=	GTK2 GTK3

.include "${.CURDIR}/../../www/browser/Makefile.options"

.if ${USE_MOZILLA:M-nss}
MOZ_PKGCONFIG_FILES+=	mozilla-nss
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/xulrunner/stub/nsXULStub.cpp

pre-configure:
	(cd ${WRKSRC} && ${LOCALBASE}/bin/autoconf-2.13)
	(cd ${WRKSRC}/js/src/ && ${LOCALBASE}/bin/autoconf-2.13)

post-build:
	@${REINPLACE_CMD} -e "s|\(Libs:.*\)\($$\)|\1 -Wl,-rpath,${PREFIX}/lib/${MOZ_RPATH}\2| ; \
		s|%sdkdir%|%sdkdir%/sdk|g ; \
		s|%%MOZ_LIBDIR%%|${PREFIX}/lib/${MOZILLA}|g" \
		${WRKSRC}/xulrunner/installer/*.pc.in || ${TRUE}

.include <bsd.port.mk>
