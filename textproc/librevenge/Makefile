PORTNAME=	librevenge
PORTVERSION=	0.0.5
CATEGORIES=	textproc
MASTER_SITES=	SF/libwpd/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Base library for writing document import filters
WWW=		https://libwpd.sourceforge.net

LICENSE=	lgpl2.1 MPL20
LICENSE_COMB=	dual

USES=		compiler:c++11-lib gmake libtool pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

BUILD_DEPENDS=	${LOCALBASE}/include/boost/algorithm/string.hpp:devel/boost-libs

OPTIONS_DEFINE=	DOXYGEN DOCS

CPPFLAGS=	-I${LOCALBASE}/include
CONFIGURE_ARGS=	-disable-werror --disable-tests

PORTDOCS=	*
DOXYGEN_IMPLIES=	DOCS
DOXYGEN_BUILD_DEPENDS=	doxygen:devel/doxygen
DOXYGEN_CONFIGURE_OFF=	--without-docs

PLIST_SUB=	API_VER=${PORTVERSION:R} SHLIB_VER=${PORTVERSION}

.include <bsd.port.mk>
