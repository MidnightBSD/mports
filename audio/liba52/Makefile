PORTNAME=	liba52
DISTVERSION=	0.8.0
CATEGORIES=	audio
MASTER_SITES=	https://distfiles.adelielinux.org/source/a52dec/
DISTNAME=	a52dec-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free library for decoding ATSC A/52 streams, aka AC-3
WWW=		https://git.adelielinux.org/community/a52dec/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf libtool pathfix
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

CONFIGURE_ARGS=	--disable-oss --enable-shared

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/liba52.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/liba52/a52_internal.h ${PREFIX}/include/a52dec

.include <bsd.port.mk>
