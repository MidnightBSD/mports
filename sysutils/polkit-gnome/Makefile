

PORTNAME=	polkit-gnome
PORTVERSION=	0.105
PORTREVISION=	1
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME frontend to the PolicyKit framework

LICENSE=	lgpl

LIB_DEPENDS=	libpolkit-gobject-1.so:${PORTSDIR}/sysutils/polkit

USES=		gettext gmake pathfix pkgconfig tar:xz
USE_GNOME=	gnomeprefix gtk20 gtk30 intlhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-gtk=2.0 \
		--localstatedir=/var
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
