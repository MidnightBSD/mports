PORTNAME=	libopusenc
PORTVERSION=	0.2.1
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	MOZILLA/opus

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level API for encoding .opus files
WWW=		https://opus-codec.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libopus.so:audio/opus

USES=		gmake libtool pathfix pkgconfig
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-maintainer-mode	# avoid autotools cascade
CONFIGURE_ARGS+=--disable-doc			# requires doxygen
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
