PORTNAME=	libvorbis
PORTVERSION=	1.3.7
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	https://downloads.xiph.org/releases/vorbis/ \
		https://download.videolan.org/videolan/testing/contrib/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libogg.so:audio/libogg

USES=		libtool pathfix tar:xz
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE}
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

OPTIONS_DEFINE=	DOCS

post-install:
	cd ${STAGEDIR}${PREFIX}/share/doc && ${MV} ${DISTNAME} libvorbis

.include <bsd.port.mk>
