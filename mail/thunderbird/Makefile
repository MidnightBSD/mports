PORTNAME=	thunderbird
PORTVERSION=	147.0.2
PORTREVISION=	0
CATEGORIES=	mail
MASTER_SITES=	http://www.midnightbsd.org/ftp/MidnightBSD/mports/distfiles/
DISTFILES=	thunderbird-147.0.2.pkg

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mozilla Thunderbird for FreeBSD
WWW=		https://www.mozilla.com/thunderbird/

LICENSE=	MPL20 gpl2
LICENSE_COMB=	dual

LIB_DEPENDS+=	libicui18n.so:devel/icu \
		libjson-c.so:devel/json-c \
		libvpx.so:multimedia/libvpx \
                libevent.so:devel/libevent \
                libstartup-notification-1.so:x11/startup-notification \
                libnspr4.so:devel/nspr \
                libnss3.so:security/nss \
                libharfbuzz.so:print/harfbuzz \
                libgraphite2.so.3:graphics/graphite2 \
                libpng16.so:graphics/png \
                libavcodec.so:multimedia/ffmpeg \
                libffi.so:devel/libffi \
                libpixman-1.so:x11/pixman \
                libwebp.so:graphics/webp \
                libfontconfig.so:x11-fonts/fontconfig \
                libfreetype.so:print/freetype2 \
                libpci.so:devel/libpci \
                libdbus-1.so:devel/dbus \
                libdbus-glib-1.so:devel/dbus-glib \
                libatk-1.0.so:accessibility/at-spi2-core \
                libaom.so:multimedia/aom \
                libdav1d.so:multimedia/dav1d


USES=           compiler:c++17-lang cpe gl gettext gmake gnome iconv jpeg localbase perl5 pkgconfig \
                python desktop-file-utils tar:xz
CPE_VENDOR=     mozilla
USE_GL=         gl
USE_GNOME=      cairo gdkpixbuf gtk30
USE_XORG=       x11 xcb xcomposite xdamage xext xfixes xrandr xrender xt ice sm

ONLY_FOR_ARCHS=	amd64

NO_BUILD=	yes

do-extract:
	${MKDIR} ${FAKE_DESTDIR}/usr/local
.for d in ${DISTFILES}
	cd ${FAKE_DESTDIR} && tar -xzf ${DISTDIR}/${d}
.endfor

do-install:
	${NOOP}

.include <bsd.port.mk>
