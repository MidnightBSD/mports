PORTNAME=	pangox-compat
PORTVERSION=	0.0.2
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Deprecated pangoX support

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	pango>=1.34.0:x11-toolkits/pango

USES=		gmake gnome libtool pathfix pkgconfig tar:xz xorg
USE_XORG=	x11 ice
USE_LDCONFIG=	yes
USE_GNOME=	glib20 pango
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
