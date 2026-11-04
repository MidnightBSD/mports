PORTNAME=	pulseaudio-qt
DISTVERSION=	1.8.1
CATEGORIES=	audio kde
MASTER_SITES=	KDE/stable/${PORTNAME}
PKGNAMESUFFIX=	6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pulseaudio bindings for Qt
WWW=		https://invent.kde.org/libraries/pulseaudio-qt

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

LIB_DEPENDS=	libpulse.so:audio/pulseaudio

USES=		cmake compiler:c++20-lang gettext gl gnome kde:6 \
		pkgconfig qt:6 shebangfix tar:xz
USE_GL=		gl opengl # GLX
USE_GNOME=	glib20
USE_KDE=	ecm:build
USE_QT=		base
USE_LDCONFIG=	yes

PLIST_SUB=	SOVERSION=${DISTVERSION}

.include <bsd.port.mk>
