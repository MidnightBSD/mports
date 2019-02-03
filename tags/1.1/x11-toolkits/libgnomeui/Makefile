# $MidnightBSD$

PORTNAME=	libgnomeui
PORTVERSION=	2.24.4
PORTREVISION?=	3
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for the GNOME GUI, a GNU desktop environment
LICENSE=	gpl2

USES=		tar:bzip2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS+=	libgnome-keyring.so:${PORTSDIR}/security/libgnome-keyring \
		libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification
RUN_DEPENDS=	${LOCALBASE}/share/icons/gnome/index.theme:${PORTSDIR}/misc/gnome-icon-theme

USES+=		bison gettext gmake libtool:keepla pathfix pkgconfig
USE_GNOME=	gnomeprefix intltool libbonoboui referencehack gvfs intltool
USE_XORG=	sm
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>

.endif
