PORTNAME=	jansson
DISTVERSION=	2.14
CATEGORIES=	devel
MASTER_SITES=	https://github.com/akheron/${PORTNAME}/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for encoding, decoding, and manipulating JSON data
WWW=		https://github.com/akheron/jansson

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cpe pathfix pkgconfig gmake tar:bzip2 libtool shebangfix
SHEBANG_FILES=	scripts/clang-format scripts/clang-format-check
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CPE_VENDOR=	jansson_project

.include <bsd.port.mk>
