PORTNAME=	libaacs
DISTVERSION=	0.11.1
CATEGORIES=	multimedia
MASTER_SITES=	https://download.videolan.org/pub/videolan/${PORTNAME}/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Advanced Access Content System implementation
WWW=		https://www.videolan.org/developers/libaacs.html

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:textproc/flex
LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error

USES=		autoreconf bison libtool pathfix tar:bzip2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-optimizations

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
