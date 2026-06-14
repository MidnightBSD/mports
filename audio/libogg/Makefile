PORTNAME=	libogg
PORTVERSION=	1.3.6
PORTEPOCH=	4
CATEGORIES=	audio
MASTER_SITES=	https://downloads.xiph.org/releases/ogg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library
WWW=		https://www.xiph.org/ogg/

LICENSE=	bsd3

USES=		libtool pathfix tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

post-install:
	cd ${PREFIX}/lib && ${LN} -s libogg.so.0.8.6 libogg.so.8

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.port.mk>
