# $MidnightBSD$

PORTNAME=	gnome-desktop
PORTVERSION=	2.32.1
PORTREVISION?=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME 2

LICENSE=	gpl2

USES=		tar:bzip2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	libstartup-notification-1.so:${PORTSDIR}/x11/startup-notification

USES+=		bison gettext gmake libtool:keepla pathfix pkgconfig python:2
USE_XORG=	xpm
USE_GNOME=	gnomeprefix intlhack gnomedocutils gconf2 pygtk2 \
		referencehack
INSTALLS_OMF=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gnome-distributor="MidnightBSD"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e 's|xsltproc -o| xsltproc --nonet -o|g' \
		${WRKSRC}/desktop-docs/fdl/Makefile.in \
		${WRKSRC}/desktop-docs/gpl/Makefile.in \
		${WRKSRC}/desktop-docs/lgpl/Makefile.in

.include <bsd.port.mk>

.endif
