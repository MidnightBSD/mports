PORTNAME=	openbox
PORTVERSION=	3.5.2
PORTREVISION=	1
CATEGORIES=	x11-wm
MASTER_SITES=	http://openbox.org/dist/openbox/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small, fast, standards compliant, extensible window manager
WWW=		http://openbox.org/

LICENSE=        gpl2

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

GNU_CONFIGURE=	yes
USES=		gmake libtool pathfix pkgconfig
USE_GNOME=	glib20 libxml2
USE_XORG=	xext xft
USE_LDCONFIG=	yes

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lXext

PLIST_SUB=	VERSION=${PORTVERSION:C/.[0-9]+\$//}

OPTIONS_DEFINE=	NLS IMLIB PANGO SVG NOTIFY
OPTIONS_DEFAULT=	IMLIB PANGO NOTIFY SVG
OPTIONS_SUB=	yes

NLS_USES=		gettext
NLS_CONFIGURE_OFF=	--disable-nls

PANGO_USE=		GNOME=pango
PANG_CONFIGURE_OFF=	--disable-pango

NOTIFY_LIB_DEPENDS=	libstartup-notification-1.so:x11/startup-notification
NOTIFY_CONFIGURE_OFF=	--disable-startup-notification

IMLIB_CONFIGURE_ENABLE=	imlib2
IMLIB_LIB_DEPENDS=    libImlib2.so:graphics/imlib2

SVG_USE=	GNOME=librsvg2
SVG_CONFIGURE_ENABLE=	librsvg

post-configure:
	@${CHMOD} +x ${WRKSRC}/install-sh

.include <bsd.port.mk>
