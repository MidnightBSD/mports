PORTNAME=	libodfgen
PORTVERSION=	0.1.8
CATEGORIES=	textproc
MASTER_SITES=	SF/libwpd/${PORTNAME}/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	01

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for generating documents in Open Document Format (ODF)
WWW=		https://sourceforge.net/p/libwpd/wiki/libodfgen

LICENSE=	lgpl2.1 MPL20
LICENSE_COMB=	dual

LIB_DEPENDS=	librevenge-0.0.so:textproc/librevenge

USES=		compiler:c++11-lib gnome libtool pathfix pkgconfig tar:xz
USE_GNOME=	libxml2
USE_LDCONFIG=	yes

CONFIGURE_ARGS=	--disable-werror --without-docs
CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
