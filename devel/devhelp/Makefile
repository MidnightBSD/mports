

PORTNAME=	devhelp
PORTVERSION=	3.16.1
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Developer help browser for GNOME 3

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libwebkit2gtk-4.0.so:${PORTSDIR}/www/webkit2-gtk3

USES=		compiler:c++11-lib gettext gmake libtool pathfix \
		pkgconfig tar:xz
USE_GNOME=	gtk30 intlhack libxslt
USE_XORG=	x11
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GLIB_SCHEMAS=	org.gnome.devhelp.gschema.xml

post-patch:
	@${REINPLACE_CMD} -e 's|gedit-plugin||g' ${WRKSRC}/misc/Makefile.in

.include <bsd.port.mk>
