

PORTNAME=	giblib
PORTVERSION=	1.2.4
PORTREVISION=	7
CATEGORIES=	graphics devel
MASTER_SITES=	http://linuxbrit.co.uk/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility library that includes a wrapper for imlib2

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libImlib2.so:${PORTSDIR}/graphics/imlib2

USES=		pathfix pkgconfig libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_ARGS=	docsdir=${DOCSDIR}

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libgiblib.so

.include <bsd.port.mk>
