PORTNAME=	utf8proc
DISTVERSION=	2.10.0
CATEGORIES=	textproc devel
MASTER_SITES=	https://github.com/JuliaStrings/${PORTNAME}/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UTF-8 processing library
WWW=		https://juliastrings.github.io/utf8proc/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		cmake
USE_LDCONFIG=	yes

CMAKE_ON=	BUILD_SHARED_LIBS

PLIST_FILES=	include/utf8proc.h \
		lib/libutf8proc.so \
		lib/libutf8proc.so.3 \
		lib/libutf8proc.so.3.1.0 \
		libdata/pkgconfig/libutf8proc.pc
PORTDOCS=	NEWS.md README.md

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && \
	    ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
