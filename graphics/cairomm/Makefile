PORTNAME=	cairomm
PORTVERSION=	1.12.2
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interface to cairo
WWW=		https://cairographics.org

LICENSE=	lgpl

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libpng.so:graphics/png

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		gmake gnome libtool pathfix pkgconfig compiler:c++11-lang xorg
USE_CXXSTD=	c++11
USE_GNOME=	cairo libxml++26
USE_XORG=	x11 xext xrender
CONFIGURE_ENV=	AUTOMAKE="${TRUE}" AUTOCONF="${TRUE}" DOXYGEN="${TRUE}"

OPTIONS_DEFINE=	DOCS

DOCS_CONFIGURE_OFF=	--disable-documentation

post-configure-DOCS-off:
	@${TOUCH} -f ${WRKSRC}/docs/reference/html/index.html

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libcairomm-1.0.so.1.4.0

.include <bsd.port.mk>
