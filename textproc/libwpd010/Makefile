# Created by: reed@pugetsoundtechnology.com

PORTNAME=	libwpd
PORTVERSION=	0.10.3
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	010

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for importing and exporting WordPerfect(tm) documents

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${LOCALBASE}/include/boost/spirit/include/qi.hpp:devel/boost-libs
LIB_DEPENDS=	librevenge-0.0.so:textproc/librevenge

USES=		compiler:c++11-lang cpe gnome libtool pathfix pkgconfig tar:bzip2
CPE_VENDOR=	${PORTNAME}_project
GNU_CONFIGURE=	yes
USE_GNOME=	libgsf
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--disable-werror --without-docs
CPPFLAGS+=	-I ${LOCALBASE}/include
PLIST_SUB=	MAJVER=${PORTVERSION:R}

.include <bsd.port.mk>
