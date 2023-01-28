PORTNAME=	libbs2b
PORTVERSION=	3.1.0
CATEGORIES=	audio
MASTER_SITES=	SF/bs2b/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bauer Stereophonic-to-Binaural DSP
WWW=		http://bs2b.sourceforge.net/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libsndfile.so:audio/libsndfile

USES=		gmake libtool localbase pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
