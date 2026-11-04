PORTNAME=	libmatroska
DISTVERSION=	1.7.1
CATEGORIES=	multimedia audio
MASTER_SITES=	https://dl.matroska.org/downloads/libmatroska/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensible Multimedia Container Format
WWW=		https://www.matroska.org/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE.LGPL

LIB_DEPENDS=	libebml.so:textproc/libebml

USES=		cmake compiler:c++11-lang cpe pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
CPE_VENDOR=	matroska

CMAKE_ARGS=	-DBUILD_SHARED_LIBS=YES

.include <bsd.port.mk>
