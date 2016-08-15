# MidnightBSD$

PORTNAME=	graphite2
PORTVERSION=	1.3.5
CATEGORIES=	graphics print
MASTER_SITES=	SF/silgraphite/${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rendering capabilities for complex non-Roman writing systems

LICENSE=	lgpl2.1

USES=		cmake iconv
USE_LDCONFIG=	yes
LDFLAGS+=	-L${LOCALBASE}/lib ${ICONV_LIB}

post-patch:
	@${REINPLACE_CMD} -e 's,/pkgconfig,data/pkgconfig,g' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
