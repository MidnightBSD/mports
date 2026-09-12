PORTNAME=	gnome-console
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minimal terminal for GNOME
WWW=		https://apps.gnome.org/Console/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas
LIB_DEPENDS=	libgtop-2.0.so:devel/libgtop \
		libpcre2-8.so:devel/pcre2
RUN_DEPENDS=	gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas

USES=		compiler:c11 desktop-file-utils display:test gettext-tools gnome localbase \
		meson pkgconfig tar:xz
USE_CSTD=	c11
USE_GNOME=	glib20 gtk40 libadwaita pango vte3
# TEST_ENV is initialized before USES extensions append to MAKE_ENV.
.if defined(DISPLAY)
TEST_ENV+=	DISPLAY="${DISPLAY}"
.else
TEST_ENV+=	DISPLAY=":${XVFBPORT}"
.endif
GLIB_SCHEMAS=	org.gnome.Console.gschema.xml
INSTALLS_ICONS=	yes

PORTSCOUT=	limit:^50

.include <bsd.port.mk>
