# $MidnightBSD$

PORTNAME=	libgnomeprintui
PORTVERSION=	2.18.6
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome print support library
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme
RUN_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/gnome-icon-theme.pc:${PORTSDIR}/misc/gnome-icon-theme

USES=		bison gettext gmake libtool:keepla pathfix pkgconfig tar:bzip2
USE_XORG=	x11 xpm
USE_GNOME=	gnomeprefix libgnomeprint libgnomecanvas \
		intlhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
