PORTNAME=	libstaroffice
PORTVERSION=	0.0.7
CATEGORIES=	textproc
MASTER_SITES=	LODEV
MASTER_SITE_SUBDIR=	#

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to build a filter for old StarOffice's documents
WWW=		https://github.com/fosnola/libstaroffice

LICENSE=	lgpl2.1+ MPL20
LICENSE_COMB=	dual

BUILD_DEPENDS=	${LOCALBASE}/include/boost/shared_ptr.hpp:devel/boost-libs
LIB_DEPENDS=	librevenge-0.0.so:textproc/librevenge

USES=		compiler:c++11-lib cpe libtool pathfix pkgconfig tar:xz
CPE_VENDOR=	${PORTNAME}_project
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

CONFIGURE_ARGS=	--without-docs
CPPFLAGS+=	-I${LOCALBASE}/include

LIBVERSION=	${PORTVERSION}
PLIST_SUB+=	LIBVERSION=${LIBVERSION}

.include <bsd.port.mk>
