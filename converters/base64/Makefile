PORTNAME=	base64
PORTVERSION=	1.5
CATEGORIES=	converters
MASTER_SITES=	https://www.fourmilab.ch/webtools/base64/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to encode and decode base64 files
WWW=		https://www.fourmilab.ch/webtools/base64/

LICENSE=	publicdom
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
ALL_TARGET=	prog
PLIST_FILES=	bin/base64 \
		share/man/man1/base64.1.gz

.include <bsd.port.mk>
