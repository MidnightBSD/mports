PORTNAME=	svgpp
PORTVERSION=	1.3.1
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ header-only parsers for various SVG syntaxes
WWW=		http://svgpp.org/

LICENSE=	BSL-1.0
LICENSE_FILE=	${WRKSRC}/LICENSE_1_0.txt

USE_GITHUB=	yes
NO_BUILD=	yes
NO_ARCH=	yes

do-install:
	@${MKDIR} ${PREFIX}/include
	${CP} -a ${WRKSRC}/include/ ${PREFIX}/include

.include <bsd.port.mk>
