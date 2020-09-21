PORTNAME=	chromium-bin
PORTVERSION=	84.0.4147.135
PORTREVISION=	0
CATEGORIES=	www
MASTER_SITES=	https://www.midnightbsd.org/ftp/MidnightBSD/distfiles/
DISTFILES=      chromium-84.0.4147.135.txz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Chromium for FreeBSD

LICENSE=        bsd3 lgpl2.1 mpl
LICENSE_COMB=   multi

CONFLICTS=	chromium-8*

LIB_DEPENDS=    libatk-bridge-2.0.so:accessibility/at-spi2-atk \
                libatspi.so:accessibility/at-spi2-core \
                libspeechd.so:accessibility/speech-dispatcher \
                libsnappy.so:archivers/snappy \
                libFLAC.so:audio/flac \
                libopus.so:audio/opus \
                libspeex.so:audio/speex \
                libdbus-1.so:devel/dbus \
                libdbus-glib-1.so:devel/dbus-glib \
                libicuuc.so:devel/icu \
                libjsoncpp.so:devel/jsoncpp \
                libpci.so:devel/libpci \
                libnspr4.so:devel/nspr \
                libre2.so:devel/re2 \
                libcairo.so:graphics/cairo \
                libdrm.so:graphics/libdrm \
                libexif.so:graphics/libexif \
                libpng.so:graphics/png \
                libwebp.so:graphics/webp \
                libavcodec.so:multimedia/ffmpeg \
                libopenh264.so:multimedia/openh264 \
                libfreetype.so:print/freetype2 \
                libharfbuzz.so:print/harfbuzz \
                libharfbuzz-icu.so:print/harfbuzz-icu \
                libgcrypt.so:security/libgcrypt \
                libsecret-1.so:security/libsecret \
                libnss3.so:security/nss \
                libexpat.so:textproc/expat2 \
                libfontconfig.so:x11-fonts/fontconfig

RUN_DEPENDS=    xdg-open:devel/xdg-utils \
                noto-basic>0:x11-fonts/noto-basic

USES=	tar:xz

ONLY_FOR_ARCHS=	amd64

DATADIR=	/usr/local/share/chromium

NO_BUILD=	yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 200000
IGNORE=         is for MidnightBSD 2.0 and newer
.endif

do-extract:
	${MKDIR} ${FAKE_DESTDIR}/usr/local
	cd ${FAKE_DESTDIR} && tar -xzf ${DISTDIR}/${DISTFILES}

do-install:
	${NOOP}

.include <bsd.port.post.mk>
