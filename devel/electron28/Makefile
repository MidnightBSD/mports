PORTNAME=	electron
PORTVERSION=	28.1.0
PORTREVISION=	0
PULSEMV=	16
PULSEV=		${PULSEMV}.1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/tagattie/FreeBSD-Electron/releases/download/v28.1.0/
PKGNAMESUFFIX=	${ELECTRON_VER_MAJOR}
DISTFILES=	electron28-28.1.0-freebsd12-amd64.pkg
EXTRACT_ONLY=	electron28-28.1.0-freebsd12-amd64.pkg

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build cross-platform desktop apps with JavaScript, HTML, and CSS
WWW=		https://electronjs.org/

LICENSE=	bsd3 lgpl2.1 mit MPL11
LICENSE_COMB=	multi

ONLY_FOR_ARCHS=	amd64

LIB_DEPENDS=	libatk-bridge-2.0.so:accessibility/at-spi2-core \
		libatspi.so:accessibility/at-spi2-core \
		libasound.so:audio/alsa-lib \
		libFLAC.so:audio/flac \
		libopus.so:audio/opus \
		libsndio.so:audio/sndio \
		libdbus-1.so:devel/dbus \
		libicuuc.so:devel/icu \
		libepoll-shim.so:devel/libepoll-shim \
		libevent.so:devel/libevent \
		libffi.so:devel/libffi \
		libnotify.so:devel/libnotify \
		libpci.so:devel/libpci \
		libnspr4.so:devel/nspr \
		libre2.so:devel/re2 \
		libdrm.so:graphics/libdrm \
		libpng.so:graphics/png \
		libwayland-client.so:graphics/wayland \
		libwebp.so:graphics/webp \
		libdav1d.so:multimedia/dav1d \
		libva.so:multimedia/libva \
		libopenh264.so:multimedia/openh264 \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz \
		libsecret-1.so:security/libsecret \
		libnss3.so:security/nss \
		libexpat.so:textproc/expat2 \
		libxkbcommon.so:x11/libxkbcommon \
		libxshmfence.so:x11/libxshmfence \
		libfontconfig.so:x11-fonts/fontconfig
RUN_DEPENDS=	xdg-open:devel/xdg-utils

USES=		bison compiler:c++17-lang cpe gettext-tools gl gmake gnome \
		iconv:wchar_t jpeg localbase:ldflags ninja nodejs:20,build \
		pkgconfig python:build,test shebangfix tar:xz xorg

CPE_VENDOR=	electronjs
USE_GL=		gbm gl glesv2
USE_GNOME=	atk cairo gdkpixbuf gtk30 libxml2 libxslt pango
USE_XORG=	x11 xcb xcomposite xcursor xdamage xext xfixes xi xrandr \
		xrender xscrnsaver xtst

DATADIR=	${PREFIX}/share/${PORTNAME}${PKGNAMESUFFIX}
NO_BUILD=	yes

.include <bsd.port.pre.mk>

BUILD_DEPENDS+=	nasm:devel/nasm
PLIST_SUB+=	AARCH64="@comment " \
		AMD64="" \
		I386="@comment " \
		NOT_AARCH64=""
FFMPEG_TARGET=	x64

do-install:
	${MKDIR} ${FAKE_DESTDIR}
	${CP} -R ${WRKDIR}/usr ${FAKE_DESTDIR}/

.include <bsd.port.post.mk>
