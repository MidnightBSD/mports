# $MidnightBSD: mports/sysutils/gnome-system-tools/Makefile,v 1.4 2011/02/02 21:22:47 laffer1 Exp $
# $FreeBSD: ports/sysutils/gnome-system-tools/Makefile,v 1.30 2008/06/06 14:03:06 edwin Exp $

PORTNAME=	gnome-system-tools
PORTVERSION=	2.32.0
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to configure workstations
LICENSE=	gpl2

LIB_DEPENDS=	oobs-1.5:${PORTSDIR}/devel/liboobs \
		polkit-gtk-1.0:${PORTSDIR}/sysutils/polkit-gnome

USE_BZIP2=	yes
USE_GMAKE=	yes
INSTALLS_ICONS=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
GNOME_DESKTOP_VERSION=2
USE_GNOME=	gnomehack gnomeprefix intlhack nautilus2
USE_AUTOTOOLS=	libtool
INSTALLS_OMF=	yes
CONFIGURE_ARGS=	--enable-services
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

GLIB_SCHEMAS=	org.gnome.system-tools.gschema.xml

.include <bsd.port.mk>
