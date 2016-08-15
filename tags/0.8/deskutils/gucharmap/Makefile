# $MidnightBSD$

PORTNAME=	gucharmap
PORTVERSION=	3.16.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unicode/ISO10646 character map and font viewer

LICENSE=	gpl2

BUILD_DEPENDS=	itstool:${PORTSDIR}/textproc/itstool

USES=		desktop-file-utils gettext gmake libtool pathfix \
		pkgconfig tar:xz
USE_GNOME=	gnomeprefix gtk30 intlhack introspection:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.Charmap.enums.xml \
		org.gnome.Charmap.gschema.xml

.include <bsd.mport.options.mk>

CONFIGURE_ARGS+=	--disable-Bsymbolic

.include <bsd.port.mk>
