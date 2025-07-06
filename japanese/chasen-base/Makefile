PORTNAME=	chasen
PORTVERSION=	2.4.5
PORTREVISION=	3
CATEGORIES=	japanese textproc
MASTER_SITES=	OSDN/chasen-legacy
PKGNAMESUFFIX=	-base

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese Morphological Analysis System

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/include/darts.h:devel/darts

USES=		cpe iconv libtool localbase
CPE_VENDOR=	naist.jp
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	${ICONV_CONFIGURE_BASE}

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} \
		-e 's/iconv ()/libiconv ()/' \
		-e 's/-liconv/${ICONV_LIB}/' ${WRKSRC}/configure

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/share/chasen/dic

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/manual* ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
