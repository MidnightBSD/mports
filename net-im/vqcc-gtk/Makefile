PORTNAME=	vqcc-gtk
PORTVERSION=	0.5
PORTREVISION=	0
CATEGORIES?=	net-im
MASTER_SITES=	SF

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	LAN chat client compatible with quickChat and Vypress Chat (TM)
WWW=		https://vqcc-gtk.sourceforge.net/

LIB_DEPENDS=	libstartup-notification-1.so:x11/startup-notification

USES=		pathfix gmake gnome gettext pkgconfig xorg
USE_GNOME=	gnomeprefix gtk20
USE_XORG=	x11 xext xscrnsaver
GNU_CONFIGURE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

.include <bsd.port.mk>
