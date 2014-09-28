# $MidnightBSD$

PORTNAME=	gnome-utils
PORTVERSION=	2.32.0
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 support utilities

LICENSE=	gpl2

LIB_DEPENDS=	libgtop-2.0.so:${PORTSDIR}/devel/libgtop \
		libcanberra-gtk.so:${PORTSDIR}/audio/libcanberra

CONFLICTS=	baobob-3.[0-9]* gnome-dictionary-3.[0-9]* \
		gnome-font-viewer-3.[0-9]* gnome-screenshot-3.[0-9]* \
		gnome-search-tool-3.[0-9]* gnome-system-log-3.[0-9]*

USES=		gettext gmake libtool pathfix pkgconfig tar:bzip2
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gnomeprefix intlhack gnomepanel
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-maintainer-flags=no
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

GCONF_SCHEMAS=	gnome-dictionary.schemas gnome-screenshot.schemas \
		gnome-search-tool.schemas baobab.schemas \
		gnome-system-log.schemas

post-patch:
	@${REINPLACE_CMD} -e 's|-DGTK_DISABLE_DEPRECATED||g' \
		${WRKSRC}/gsearchtool/libgnomeui-deprecated/Makefile.in
	@${REINPLACE_CMD} -e 's|-DG_DISABLE_DEPRECATED||g' \
		${WRKSRC}/gnome-dictionary/libgdict/Makefile.in \
		${WRKSRC}/gsearchtool/Makefile.in \
		${WRKSRC}/gsearchtool/libgnomeui-deprecated/Makefile.in \
		${WRKSRC}/libeggsmclient/Makefile.in

.include <bsd.port.mk>
