PORTNAME=	libgnomeui
PORTVERSION=	2.24.5
PORTREVISION?=	0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for the GNOME GUI, a GNU desktop environment

LICENSE=	gpl2

USES=		tar:bzip2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS+=	libgnome-keyring.so:security/libgnome-keyring \
		libstartup-notification-1.so:x11/startup-notification
RUN_DEPENDS=	${LOCALBASE}/share/icons/gnome/index.theme:misc/gnome-icon-theme

USES+=		bison gettext gmake gnome localbase libtool:keepla pathfix pkgconfig xorg
USE_GNOME=	gnomeprefix intltool libbonoboui referencehack gvfs
USE_XORG=	sm
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
LIBS=		-lm

.include <bsd.port.mk>

.endif
