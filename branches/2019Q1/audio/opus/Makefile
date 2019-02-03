# $FreeBSD: head/audio/opus/Makefile 388939 2015-06-09 14:24:41Z jbeich $

PORTNAME=	opus
PORTVERSION=	1.1
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/opus/ \
		MOZILLA/opus

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IETF audio codec

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe gmake libtool pathfix
CPE_VENDOR=	opus-codec
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-custom-modes \
		--disable-maintainer-mode \
		--disable-doc   # requires doxygen

regression-test: build
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} check

.include <bsd.mport.options.mk>

.include <bsd.port.mk>
