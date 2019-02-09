# $MidnightBSD$

PORTNAME=	glabels
PORTVERSION=	3.4.1
CATEGORIES=	deskutils
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to create labels and business cards

LICENSE=	gpl2

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libsecret-1.so:security/libsecret \
		libsoup-2.4.so:devel/libsoup

USES=		desktop-file-utils gettext gmake libtool pathfix pkgconfig \
		shared-mime-info tar:xz
USE_GNOME=	cairo gdkpixbuf2 gtk30 intltool librsvg2
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

GLIB_SCHEMAS=	org.gnome.glabels-3.gschema.xml

OPTIONS_DEFINE=	EVOLUTION
EVOLUTION_DESC=	Support evolution data server

EVOLUTION_USE=	GNOME=evolutiondataserver3
EVOLUTION_CONFIGURE_WITH=	libebook

.include <bsd.port.mk>
