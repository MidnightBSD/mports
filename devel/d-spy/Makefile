PORTNAME=	d-spy
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	D-Bus explorer
WWW=		https://gitlab.gnome.org/GNOME/d-spy

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libdex-1.so:devel/libdex

USES=		gettext gnome meson pkgconfig tar:xz
USE_GNOME=	gtk40 libadwaita
INSTALLS_ICONS=	yes
GLIB_SCHEMAS=	org.gnome.dspy.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e '/update_desktop_database/d' \
		${WRKSRC}/meson.build

.include <bsd.port.mk>
