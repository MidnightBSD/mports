# $MidnightBSD$

PORTNAME=	sound-juicer
PORTVERSION=	2.32.0
PORTREVISION=	2
CATEGORIES=	audio gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clean, mean and lean CD ripper for GNOME2

LICENSE=	gpl2

LIB_DEPENDS=	libmusicbrainz3.so:${PORTSDIR}/audio/libmusicbrainz3 \
		libgnome-media-profiles.so:${PORTSDIR}/audio/gnome-media \
		libcdio.so:${PORTSDIR}/sysutils/libcdio \
    		libtag.so:${PORTSDIR}/audio/taglib \
		libcanberra-gtk.so:${PORTSDIR}/audio/libcanberra \
		libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib \
		libbrasero-media.so:${PORTSDIR}/sysutils/brasero

USES=		gettext gmake pathfix pkgconfig tar:bzip2 desktop-file-utils
INSTALLS_OMF=	yes
USE_GNOME=	intlhack gnomeprefix gconf2 libglade2 gnomedocutils
USE_GSTREAMER=	cdparanoia vorbis flac gconf good gio
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-ignore-missing-cd
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GCONF_SCHEMAS=	sound-juicer.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|^\(SUBDIRS = .*\)tests\(.*\)|\1\2|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|" == "|" = "|g' ${WRKSRC}/configure

.include <bsd.port.mk>
