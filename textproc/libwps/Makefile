PORTNAME=	libwps
PORTVERSION=	0.4.14
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft file word processor format import filter library
WWW=		https://libwps.sourceforge.net/

LICENSE=	lgpl2.1+ MPL20
LICENSE_COMB=	dual
LICENSE_FILE_lgpl2.1+ =	${WRKSRC}/COPYING.LGPL
LICENSE_FILE_MPL20=	${WRKSRC}/COPYING.MPL

LIB_DEPENDS=	librevenge-0.0.so:textproc/librevenge

USES=		compiler:c++11-lib libtool pathfix pkgconfig tar:xz
CONFIGURE_ARGS=	--disable-werror --without-docs
CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

LIBVERSION=	4.0.14
PLIST_SUB+=	LIBVERSION=${LIBVERSION}

.include <bsd.port.mk>
