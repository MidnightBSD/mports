PORTNAME=	liba52
PORTVERSION=	0.7.4
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	https://liba52.sourceforge.net/files/
DISTNAME=	a52dec-${PORTVERSION:S/.b/b/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free library for decoding ATSC A/52 streams, aka AC-3
WWW=		https://liba52.sourceforge.net/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-oss --enable-shared
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DJBFFT OPTIMIZED_CFLAGS DOCS
DJBFFT_DESC=	djb fft support

DJBFFT_BUILD_DEPENDS=	${LOCALBASE}/lib/libdjbfft.a:math/djbfft
DJBFFT_RUN_DEPENDS=	${LOCALBASE}/lib/libdjbfft.a:math/djbfft
DJBFFT_CFLAGS=		-I${LOCALBASE}/include
DJBFFT_LDFLAGS=		-L${LOCALBASE}/lib
DJBFFT_CONFIGURE_ON=	--enable-djbfft

.include <bsd.port.pre.mk>

HEADER_FILES=	liba52/a52_internal.h

post-patch:
	@${REINPLACE_CMD} '/-prefer-non-pic/d' ${WRKSRC}/configure

post-patch-OPTIMIZED_CFLAGS-off:
	@${REINPLACE_CMD} -E -e 's!-O3!${CFLAGS}!' -e 's!-mcpu=[^"]+"!"!' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

post-patch-DJBFFT-on:
	@${REINPLACE_CMD} -E -e 's|(fftc4.h)|djbfft/\1|' ${WRKSRC}/liba52/imdct.c

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/liba52.txt ${DOCSDIR}
.for file in ${HEADER_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/include/a52dec
.endfor

.include <bsd.port.post.mk>
