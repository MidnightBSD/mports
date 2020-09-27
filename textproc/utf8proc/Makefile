PORTNAME=	utf8proc
PORTVERSION=	2.5.0
DISTVERSIONPREFIX=	v
CATEGORIES=	textproc devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UTF-8 processing library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		gmake
USE_GITHUB=	yes
GH_ACCOUNT=	JuliaStrings
USE_LDCONFIG=	yes
MAKE_ARGS=	prefix=${PREFIX}
PLIST_FILES=	include/utf8proc.h \
		lib/libutf8proc.a \
		lib/libutf8proc.so \
		lib/libutf8proc.so.2 \
		lib/libutf8proc.so.2.3.2 \
		libdata/pkgconfig/libutf8proc.pc
PORTDOCS=	NEWS.md README.md

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libutf8proc.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && \
	    ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
