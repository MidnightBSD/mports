# $MidnightBSD$

PORTNAME=	gnome-desktop
PORTVERSION=	3.14.2
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME 3

LICENSE=	gpl2

USES=		tar:xz

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	iso-codes>=0:${PORTSDIR}/misc/iso-codes \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas \
		xkeyboard-config>=0:${PORTSDIR}/x11/xkeyboard-config \
		libxkbfile>=0:${PORTSDIR}/x11/libxkbfile \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification
RUN_DEPENDS=	iso-codes>=0:${PORTSDIR}/misc/iso-codes \
		gsettings-desktop-schemas>=0:${PORTSDIR}/devel/gsettings-desktop-schemas \
		xkeyboard-config>=0:${PORTSDIR}/x11/xkeyboard-config \
		libxkbfile>=0:${PORTSDIR}/x11/libxkbfile

USES+=		bison gettext gmake libtool pathfix pkgconfig python:3
USE_GNOME=	gnomeprefix gtk30 intlhack introspection:build \
		referencehack
USE_XORG=	x11 xrandr xext
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gnome-distributor="MidnightBSD"
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e 's|xsltproc -o| xsltproc --nonet -o|g' \
		${WRKSRC}/desktop-docs/fdl/Makefile.in \
		${WRKSRC}/desktop-docs/gpl/Makefile.in \
		${WRKSRC}/desktop-docs/lgpl/Makefile.in

.include <bsd.port.mk>

.endif
