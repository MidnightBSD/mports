# Created by: Koop Mast <kwm@FreeBSD.org>

PORTNAME=	libunique
PORTVERSION=	3.0.2
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for single instance applications

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libdbus-glib-1.so:devel/dbus-glib

USES=		gettext gmake gnome libtool pathfix pkgconfig tar:xz xorg
USE_XORG=	ice x11
USE_LDCONFIG=	yes
USE_GNOME=	gtk30 gnomeprefix introspection:build
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-maintainer-flags --enable-gtk-doc-html=no
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} \
		-e 's|unique tests doc|unique tests|g' \
		${WRKSRC}/configure ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
