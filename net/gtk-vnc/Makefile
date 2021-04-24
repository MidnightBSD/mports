# $MidnightBSD$

PORTNAME=	gtk-vnc
PORTVERSION=	0.7.2
PORTREVISION=	0
CATEGORIES=	net gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC viewer widget for GTK+

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS=	vapigen:lang/vala
LIB_DEPENDS=	libgnutls.so:security/gnutls \
		libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error \
		libsasl2.so:security/cyrus-sasl2

USES=		gettext gmake gnome libtool localbase pathfix pkgconfig python \
		tar:xz xorg
USE_GNOME=	cairo gdkpixbuf2 gtk30 intltool introspection:build
USE_XORG=	x11
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-introspection \
		--disable-plugin --without-python
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	PULSEAUDIO
OPTIONS_DEFAULT=PULSEAUDIO
OPTIONS_SUB=	yes

PULSEAUDIO_DESC=	use PulseAudio for audio playback
PULSEAUDIO_CONFIGURE_WITH=	pulseaudio
PULSEAUDIO_LIB_DEPENDS=	libpulse.so:audio/pulseaudio

.include <bsd.port.mk>
