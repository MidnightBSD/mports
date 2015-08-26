# $MidnightBSD$

PORTNAME=	cheese
PORTVERSION=	3.16.1
CATEGORIES=	multimedia gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Photobooth-inspired app for taking pictures and videos from webcam

LICENSE=	gpl2

BUILD_DEPENDS=	v4l_compat>=0:${PORTSDIR}/multimedia/v4l_compat \
		gnome-video-effects>=0:${PORTSDIR}/graphics/gnome-video-effects \
		vala>=0.14.0:${PORTSDIR}/lang/vala \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libcanberra-gtk3.so:${PORTSDIR}/audio/libcanberra-gtk3 \
		libhal.so:${PORTSDIR}/sysutils/hal \
		libclutter-gtk-1.0.so:${PORTSDIR}/graphics/clutter-gtk3 \
		libclutter-gst-2.0.so:${PORTSDIR}/multimedia/clutter-gst
RUN_DEPENDS=	gnome-video-effects>=0:${PORTSDIR}/graphics/gnome-video-effects

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	intlhack evolutiondataserver3 librsvg2 \
		gnomedesktop3 libxml2:build introspection:build
USE_XORG=	xxf86vm x11
USE_GSTREAMER1=	bad good jpeg ogg theora v4l2 vorbis vpx
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include -Wno-format-nonliteral
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

DOCS=		AUTHORS COPYING ChangeLog NEWS README
GLIB_SCHEMAS=	org.gnome.Cheese.gschema.xml

OPTIONS_DEFINE=	MANPAGES
OPTIONS_DEFAULT=MANPAGES

MANPAGES_CONFIGURE_ENABLE=	man
MANPAGES_BUILD_DEPENDS=	docbook-xml>=0:${PORTSDIR}/textproc/docbook-xml \
			docbook-xsl>=0:${PORTSDIR}/textproc/docbook-xsl
MANPAGES_USE=	GNOME=libxslt:build

post-install:
	@${MKDIR} ${DOCSDIR}
.for i in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
