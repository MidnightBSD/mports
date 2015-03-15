# $MidnightBSD$

PORTNAME=	libvorbis
PORTVERSION=	1.3.5
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library

LICENSE=	bsd3

LIB_DEPENDS=	libogg.so:${PORTSDIR}/audio/libogg

USES=		libtool pathfix tar:xz
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE}
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

post-install:
#	cd ${PREFIX}/share/doc && ${MV} ${DISTNAME} libvorbis
	${LN} -s libvorbis.so.0 ${PREFIX}/lib/libvorbis.so.4
	${LN} -s libvorbisfile.so.3 ${PREFIX}/lib/libvorbisfile.so.6

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.port.mk>
