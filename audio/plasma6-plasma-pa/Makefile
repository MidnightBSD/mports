PORTNAME=	plasma-pa
DISTVERSION=	${KDE_PLASMA_VERSION}
CATEGORIES=	audio kde kde-plasma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plasma applet for audio volume management using PulseAudio

LIB_DEPENDS=	libcanberra.so:audio/libcanberra \
		libpulse.so:audio/pulseaudio \
		libKF6PulseAudioQt.so:audio/pulseaudio-qt
RUN_DEPENDS=	${LOCALBASE}/share/sounds/freedesktop/index.theme:audio/freedesktop-sound-theme

USES=		cmake compiler:c++17-lang gettext gl gnome kde:6 pkgconfig \
		qt:6 tar:xz
USE_KDE=	config coreaddons dbusaddons doctools globalaccel i18n \
		kcmutils kdeclarative kirigami-addons libplasma \
		statusnotifieritem svg \
		ecm:build
USE_GL=		gl opengl
USE_GNOME=	glib20
USE_QT=		base declarative

.include <bsd.port.mk>
