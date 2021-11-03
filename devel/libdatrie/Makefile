PORTNAME=	libdatrie
PORTVERSION=	0.2.13
CATEGORIES=	devel
MASTER_SITES=	http://linux.thai.net/pub/thailinux/software/libthai/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Double-array trie implementation library

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		iconv libtool localbase:ldflags pathfix tar:xz
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

LDFLAGS+=	${ICONV_LIB}

INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
