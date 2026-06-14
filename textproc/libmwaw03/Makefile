PORTNAME=	libmwaw
PORTVERSION=	0.3.22
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	03

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Import library for some old mac text documents
WWW=		https://libmwaw.sourceforge.net/

LICENSE=	lgpl2.1+ MPL20
LICENSE_COMB=	dual

LIB_DEPENDS=	librevenge-0.0.so:textproc/librevenge

USES=		compiler:c++11-lib cpe libtool pathfix pkgconfig tar:xz
CONFIGURE_ARGS=	--disable-werror --without-docs
CPPFLAGS+=	-I${LOCALBASE}/include

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CPE_VENDOR=	libmwaw_project

PLIST_SUB=	VERSION=${PORTVERSION:E}

.include <bsd.port.mk>
