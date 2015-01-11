# $MidnightBSD$

PORTNAME=	libogg
PORTVERSION=	1.3.2
PORTREVISION=	1
PORTEPOCH=	4
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/ogg/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ogg bitstream library

LICENSE=	bsd3

USES=		libtool pathfix tar:xz
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

OPTIONS_DEFINE=	DOCS

post-install:
	cd ${PREFIX} && ${LN} -s lib/libogg.so.0 lib/libogg.so.8

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.port.mk>
