# Created by: Joe Marcus Clarke <marcus@FreeBSD.org>

PORTNAME=	mate-menus
PORTVERSION=	1.24.0
CATEGORIES=	x11 mate
MASTER_SITES=	MATE
DIST_SUBDIR=	mate

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the FreeDesktop Desktop Menu Spec

LICENSE=	gpl2 lgpl
LICENSE_COMB=	dual

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome libtool localbase pathfix pkgconfig \
		python tar:xz
USE_GNOME=	glib20 intltool introspection:buid
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
