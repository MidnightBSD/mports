PORTNAME=	palemoon
PORTVERSION=	32.1.0
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	https://archive.palemoon.org/palemoon/32.x/${PORTVERSION}/FreeBSD/
DISTFILES=	palemoon-32.0.1.freebsd12.3-x86_64-gtk3.tar.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pale Moon for FreeBSD
WWW=		https://www.palemoon.org/

LICENSE=	MPL20
LICENSE_FILE=	${FAKE_DESTDIR}/${LOCALBASE}/${PORTNAME}/license.txt

LIB_DEPENDS+=	libicui18n.so:devel/icu \
		libvpx.so:multimedia/libvpx \
		libevent.so:devel/libevent \
		libstartup-notification-1.so:x11/startup-notification \
		libnspr4.so:devel/nspr \
		libnss3.so:security/nss \
		libicui18n.so.67:devel/icu \
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

USES=		compiler:c++17-lang cpe gl gettext gmake gnome iconv jpeg localbase perl5 pkgconfig \
		desktop-file-utils tar:bz2
CPE_VENDOR=	palemoon
USE_GL=         gl
USE_GNOME=      cairo gdkpixbuf2 gtk20 gtk30
USE_XORG=       x11 xcb xcomposite xdamage xext xfixes xrender xt

ONLY_FOR_ARCHS=	amd64

NO_BUILD=	yes

.include <bsd.port.pre.mk>

do-extract:
	${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}
	cd ${FAKE_DESTDIR}/usr/local && tar -xzf ${DISTDIR}/${DISTFILES}

do-install:
	${NOOP}

.include <bsd.port.post.mk>
