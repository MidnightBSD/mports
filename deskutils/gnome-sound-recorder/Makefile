PORTNAME=	gnome-sound-recorder
DISTVERSION=	42.0
PORTREVISION=	0
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME sound recorder application
WWW=		https://wiki.gnome.org/Apps/SoundRecorder

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext gnome gstreamer localbase meson pkgconfig python:build tar:xz

LIB_DEPENDS=	libadwaita-1.so:x11-toolkits/libadwaita \
		libgjs.so:lang/gjs \
		libhandy-1.so:x11-toolkits/libhandy

PORTSCOUT=	limitw:1,even

USE_GNOME=	gtk40 intlhack introspection
USE_GSTREAMER=	bad flac ogg pulse
BINARY_ALIAS=	python3=${PYTHON_CMD}
GLIB_SCHEMAS=	org.gnome.SoundRecorder.gschema.xml
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
