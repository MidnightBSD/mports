PORTNAME=	silgraphite
PORTVERSION=	2.3.1
PORTREVISION=	1
CATEGORIES=	graphics devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Font engine for complex non-Roman writing systems
WWW=		https://silgraphite.sourceforge.net/

LICENSE=	CPL05 lgpl2.1+
LICENSE_COMB=	dual
LICENSE_FILE_CPL05=	${WRKSRC}/license/License_CPLv05.txt
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/license/License_LGPLv21.txt
LICENSE_NAME_CPL05=	Common Public License Version 0.5
LICENSE_PERMS_CPL05=	auto-accept dist-mirror dist-sell pkg-mirror pkg-sell

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
FREETYPE_USES=		iconv:wchar_t

.include <bsd.port.mk>
