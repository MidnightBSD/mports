PORTNAME=	libmspub
PORTVERSION=	0.1.4
PORTREVISION=	25
CATEGORIES=	print graphics devel
MASTER_SITES=	LODEV/${PORTNAME}
PKGNAMESUFFIX=	01

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and tools for parsing Microsoft Publisher file format
WWW=		https://wiki.documentfoundation.org/DLP/Libraries/libmspub

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/COPYING.MPL

BUILD_DEPENDS=	${LOCALBASE}/include/boost/cstdint.hpp:devel/boost-libs
LIB_DEPENDS=	libicui18n.so:devel/icu \
		librevenge-0.0.so:textproc/librevenge

USES=		compiler:c++11-lib libtool localbase pathfix pkgconfig tar:xz

CONFIGURE_ARGS=	--disable-werror --without-docs
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|icu-i18n|icu-i18n icu-uc|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
