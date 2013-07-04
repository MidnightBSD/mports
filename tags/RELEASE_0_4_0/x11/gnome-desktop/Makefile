# $MidnightBSD: mports/x11/gnome-desktop/Makefile,v 1.9 2011/05/28 06:23:34 laffer1 Exp $

PORTNAME=	gnome-desktop
PORTVERSION=	2.32.1
PORTREVISION?=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME 2
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	startup-notification-1.0:${PORTSDIR}/x11/startup-notification

USE_XORG=	xpm
USE_GNOME=	gnomeprefix gnomehack intlhack gnomedocutils gconf2 pygtk2 \
		ltverhack referencehack
GNOME_DESKTOP_VERSION=2
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_BISON=	build
USE_PYTHON=	yes
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--with-gnome-distributor="MidnightBSD"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=	gnome-about.1

post-patch:
	@${REINPLACE_CMD} -e 's|xsltproc -o| xsltproc --nonet -o|g' \
		${WRKSRC}/desktop-docs/fdl/Makefile.in \
		${WRKSRC}/desktop-docs/gpl/Makefile.in \
		${WRKSRC}/desktop-docs/lgpl/Makefile.in

.include <bsd.port.mk>

.endif
