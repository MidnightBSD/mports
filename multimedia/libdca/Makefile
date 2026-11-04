PORTNAME=	libdca
PORTVERSION=	0.0.7
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	https://get.videolan.org/${PORTNAME}/${DISTVERSION}/ \
		https://download.videolan.org/pub/videolan/${PORTNAME}/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free DTS Coherent Acoustics decoder
WWW=		https://www.videolan.org/developers/libdca.html

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf libtool pathfix pkgconfig tar:bzip2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
