# Created by: Dennis Herrmann <adox@mcx2.org>

PORTNAME=	silgraphite
PORTVERSION=	2.3.1
CATEGORIES=	graphics devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font engine for complex non-Roman writing systems

LICENSE=	lgpl2.1

OPTIONS_DEFINE=	FREETYPE
OPTIONS_DEFAULT=FREETYPE
OPTIONS_SUB=	yes

CONFIGURE_ARGS=	--without-xft --without-pangographite
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_CXXSTD=	c++98
USE_LDCONFIG=	yes
USES=		libtool pathfix pkgconfig

FREETYPE_CONFIGURE_WITH=freetype
FREETYPE_LIB_DEPENDS=	libfreetype.so:print/freetype2
FREETYPE_USES=		iconv

.include <bsd.port.mk>
