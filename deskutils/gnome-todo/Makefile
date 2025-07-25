PORTNAME=	gnome-todo
PORTVERSION=	41.0
PORTREVISION=	4
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small application to manage your personal tasks
WWW=		https://wiki.gnome.org/Apps/Todo

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-util:devel/appstream-glib \
		itstool>0:textproc/itstool
LIB_DEPENDS=	libgoa-1.0.so:net/gnome-online-accounts \
		libgraphene-1.0.so:graphics/graphene \
		libical.so:devel/libical \
		libpeas-1.0.so:devel/libpeas \
		libsecret-1.so:security/libsecret \
		libsoup-2.4.so:devel/libsoup

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome localbase meson pkgconfig \
		python:build shebangfix tar:xz
USE_GNOME=	cairo evolutiondataserver3 gnomedesktop3 gtk40 introspection \
		libadwaita
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.todo.gschema.xml

NO_TEST=	yes

.include <bsd.port.mk>
