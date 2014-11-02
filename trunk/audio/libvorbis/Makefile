# $MidnightBSD$

PORTNAME=	libvorbis
PORTVERSION=	1.3.4
PORTREVISION=	1
PORTEPOCH=	3
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/vorbis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio compression codec library

LICENSE=	bsd3

LIB_DEPENDS=	libogg.so:${PORTSDIR}/audio/libogg

USES=		libtool:oldver pathfix tar:xz
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ogg=${LOCALBASE} \
		--disable-docs		# don't rebuild

OPTIONS_DEFINE=	DOCS

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.port.mk>
