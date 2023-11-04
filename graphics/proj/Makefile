PORTNAME=	proj
PORTVERSION=	9.2.1
CATEGORIES=	graphics geography
MASTER_SITES=	https://download.osgeo.org/proj/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cartographic Projections library
WWW=		https://github.com/OSGeo/PROJ

LICENSE=	mit

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libtiff.so:graphics/tiff
#RUN_DEPENDS=	proj-data>=0:graphics/proj-data

USES=		compiler:c++11-lang cmake cpe libtool pathfix pkgconfig sqlite
USE_LDCONFIG=	yes

CMAKE_OFF=	BUILD_TESTING

CPE_VENDOR=	proj_project

.include <bsd.port.mk>
