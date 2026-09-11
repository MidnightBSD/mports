PORTNAME=	gnome-music
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME music playing application
WWW=		https://wiki.gnome.org/Apps/Music

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	appstream-util:devel/appstream-glib \
		grilo-plugins>0:net/grilo-plugins \
		itstool:textproc/itstool
LIB_DEPENDS=	libgoa-1.0.so:net/gnome-online-accounts \
		libgrilo-0.3.so:net/grilo \
		libmediaart-2.0.so:multimedia/libmediaart \
		libsoup-3.0.so:devel/libsoup3 \
		libtinysparql-3.0.so:devel/tinysparql
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cairo>0:graphics/py-cairo@${PY_FLAVOR} \
		grilo-plugins>0:net/grilo-plugins

PORTSCOUT=	limit:^50\.

USES=		desktop-file-utils gettext gnome gstreamer localbase meson pkgconfig \
		python shebangfix tar:xz
USE_GNOME=	cairo gtk40 gtk-update-icon-cache introspection libadwaita pygobject3
USE_GSTREAMER=	mpg123 ogg
SHEBANG_FILES=	gnome-music.in
BINARY_ALIAS=	python3=${PYTHON_VERSION}

GLIB_SCHEMAS=	org.gnome.Music.gschema.xml
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
