PORTNAME=	libbdplus
DISTVERSION=	0.2.0
CATEGORIES=	multimedia
MASTER_SITES=	https://download.videolan.org/pub/videolan/${PORTNAME}/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BD+ System research implementation
WWW=		https://www.videolan.org/developers/libbdplus.html

LICENSE=	lgpl2.1

LIB_DEPENDS=	libaacs.so:multimedia/libaacs \
		libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error

USES=		autoreconf libtool pkgconfig tar:bzip2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-optimizations

.include <bsd.port.mk>
