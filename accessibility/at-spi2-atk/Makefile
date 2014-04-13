# $MidnightBSD$

PORTNAME=	at-spi2-atk
PORTVERSION=	2.6.2
CATEGORIES=	accessibility x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assisted Technology Provider module for GTK+
LICENSE=	gpl2

BUILD_DEPENDS=	at-spi2-core>=2.1.4:${PORTSDIR}/accessibility/at-spi2-core
LIB_DEPENDS=	dbus-1:${PORTSDIR}/devel/dbus
RUN_DEPENDS=	at-spi2-core>=2.1.4:${PORTSDIR}/accessibility/at-spi2-core

USES=		gmake pkgconfig tar:xz
USE_GNOME=	gnomehack gnomehier intlhack glib20 atk
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--enable-p2p
GLIB_SCHEMAS=	org.a11y.atspi.gschema.xml

.include <bsd.port.mk>
