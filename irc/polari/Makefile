PORTNAME=	polari
PORTVERSION=	46.0
CATEGORIES=	irc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internet Relay Chat (IRC) client designed for GNOME
WWW=		https://apps.gnome.org/Polari/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-util:devel/appstream-glib \
		itstool:textproc/itstool
LIB_DEPENDS=	libgjs.so:lang/gjs \
		libtelepathy-glib.so:net-im/telepathy-glib \
		libtinysparql-3.0.so:devel/tinysparql
RUN_DEPENDS=	telepathy-idle>0:net-im/telepathy-idle \
		gspell>0:textproc/gspell

PORTSCOUT=	limit:^4[67]\.

USES=		desktop-file-utils gettext-tools gnome localbase meson \
		pkgconfig tar:xz
USE_GNOME=	introspection

GLIB_SCHEMAS=	org.gnome.Polari.gschema.xml
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
