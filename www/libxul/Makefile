# Created by: Michael Johnson <ahze@FreeBSD.org>
# $FreeBSD: head/www/libxul/Makefile 394871 2015-08-20 13:16:12Z jbeich $
# $MidnightBSD$

PORTNAME=	libxul
DISTVERSION=	38.2.0
PORTREVISION=	0
CATEGORIES?=	www devel
MASTER_SITES=	MOZILLA/firefox/releases/${DISTVERSION}esr/source \
		MOZILLA/firefox/candidates/${DISTVERSION}esr-candidates/build2/source
DISTNAME=	firefox-${DISTVERSION}esr.source

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Mozilla runtime package that can be used to bootstrap XUL+XPCOM apps

LICENSE=	gpl2 mpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	nspr>=4.10.8:${PORTSDIR}/devel/nspr \
		nss>=3.19.2:${PORTSDIR}/security/nss \
		libevent2>=2.0.21_2:${PORTSDIR}/devel/libevent2 \
		soundtouch>=1.8.0:${PORTSDIR}/audio/soundtouch \
		harfbuzz>=0.9.34:${PORTSDIR}/print/harfbuzz \
		graphite2>=1.2.4:${PORTSDIR}/graphics/graphite2 \
		libvorbis>=1.3.5:${PORTSDIR}/audio/libvorbis \
		libvpx>=1.3.0:${PORTSDIR}/multimedia/libvpx \
		sqlite3>=3.8.9:${PORTSDIR}/databases/sqlite3 \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3 \
		v4l_compat>0:${PORTSDIR}/multimedia/v4l_compat \
		autoconf-2.13:${PORTSDIR}/devel/autoconf213 \
		zip:${PORTSDIR}/archivers/zip \
		unzip:${PORTSDIR}/archivers/unzip
#		opus>=1.1:${PORTSDIR}/audio/opus \

LIB_DEPENDS=	libv4l2.so:${PORTSDIR}/multimedia/libv4l

WRKSRC=		${WRKDIR}/mozilla-esr38
CONFLICTS_INSTALL=	libxul-1.9.*

USE_QT5=	# empty
QT_NONSTANDARD=	yes
USE_GL=		gl
USE_DOS2UNIX=	yes
USES=		dos2unix pathfix tar:bzip2
DOS2UNIX_FILES=	media/webrtc/trunk/webrtc/system_wrappers/source/spreadsortlib/spreadsort.hpp
MAKE_ENV=	SKIP_GRE_REGISTRATION=1 mozappdir=${PREFIX}/lib/${MOZILLA} \
		__FreeBSD__=9 __FreeBSD__version=90004
LDFLAGS+=	-Wl,-rpath,${PREFIX}/lib/${MOZ_RPATH}
USE_LDCONFIG=	${PREFIX}/lib/${MOZILLA}

MOZ_OPTIONS?=	--enable-application=xulrunner
USE_GECKO=	gecko
CPE_PRODUCT=	firefox_esr
MOZILLA_EXEC_NAME=xulrunner
USE_MOZILLA=	-opus
MOZILLA_PLIST_DIRS=	bin include lib share/idl libdata
MOZ_PKGCONFIG_FILES=	libxul-embedding libxul mozilla-js \
			mozilla-plugin

OPTIONS_DEFAULT=	GTK2

OPTIONS_SINGLE+=	TOOLKIT
OPTIONS_SINGLE_TOOLKIT=	GTK2 GTK3

.include "${.CURDIR}/../../www/browser/Makefile.options"
.include <bsd.port.pre.mk>

.if ${USE_MOZILLA:M-nss}
MOZ_PKGCONFIG_FILES+=	mozilla-nss
.endif

.if ${PORT_OPTIONS:MALSA}
RUN_DEPENDS+=	alsa-lib>=1.0.27.2_1:${PORTSDIR}/audio/alsa-lib
.endif

.if ! ${PORT_OPTIONS:MBUNDLED_CAIRO}
BUILD_DEPENDS+=	cairo>=1.12.16_1,2:${PORTSDIR}/graphics/cairo
.endif

.if ${PORT_OPTIONS:MGSTREAMER}
RUN_DEPENDS+=	gstreamer1-libav>=1.2.4_1:${PORTSDIR}/multimedia/gstreamer1-libav
BUILD_DEPENDS+=	gstreamer1-libav>=1.2.4_1:${PORTSDIR}/multimedia/gstreamer1-libav 
LIB_DEPENDS+=	libgstreamer-1.0.so:${PORTSDIR}/multimedia/gstreamer1
.endif

.if ${PORT_OPTIONS:MGTK3}
BUILD_DEPENDS+=	gtk3>=3.14.6:${PORTSDIR}/x11-toolkits/gtk30
.endif

.if ${PORT_OPTIONS:MTEST}
BROKEN=		stage-package fails with ValueError: no path specified
.endif

pre-patch: dos2unix

post-patch:
	${REINPLACE_CMD} -e 's|GNU/kFreeBSD|MidnightBSD|g'  \
		${WRKSRC}/build/gyp.mozbuild
	@${REINPLACE_CMD} -e '/MOZPNG/s/=[0-9]*/=10511/' \
		${WRKSRC}/configure.in
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/xulrunner/stub/nsXULStub.cpp
	( cd ${WRKSRC}/xpcom/reflect/xptcall/md/unix && \
          ${LN} -s xptcstubs_asm_amd64_openbsd.s xptcstubs_asm_amd64_midnightbsd.s && \
          ${LN} -s xptcstubs_amd64_openbsd.cpp xptcstubs_amd64_midnightbsd.cpp && \
          ${LN} -s xptcinvoke_amd64_openbsd.cpp xptcinvoke_amd64_midnightbsd.cpp && \
          ${LN} -s xptcinvoke_asm_amd64_openbsd.s xptcinvoke_asm_amd64_midnightbsd.s \
	)
#	${LN} -s ${WRKSRC}/security/coreconf/MidnightBSD.mk ${WRKSRC}/security/coreconf/MidnightBSD${OSREL}.mk

pre-configure:
	(cd ${WRKSRC} && ${LOCALBASE}/bin/autoconf-2.13)
	(cd ${WRKSRC}/js/src/ && ${LOCALBASE}/bin/autoconf-2.13)

post-build:
	@${REINPLACE_CMD} -e "s|\(Libs:.*\)\($$\)|\1 -Wl,-rpath,${PREFIX}/lib/${MOZ_RPATH}\2| ; \
		s|%sdkdir%|%sdkdir%/sdk|g ; \
		s|%%MOZ_LIBDIR%%|${PREFIX}/lib/${MOZILLA}|g" \
		${WRKSRC}/xulrunner/installer/*.pc.in || ${TRUE}

.include <bsd.port.post.mk>
