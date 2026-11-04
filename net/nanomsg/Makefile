PORTNAME=	nanomsg
PORTVERSION=	1.1.5
CATEGORIES=	net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Socket library that provides several common communication patterns

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GITHUB=	yes
GH_ACCOUNT=	nanomsg

USES=		cmake pathfix
USE_LDCONFIG=	yes

OPTIONS_DEFINE=                       DOCS
OPTIONS_SUB=                  yes

DOCS_DESC=                    Build and/or install HTML and manpages

DOCS_BUILD_DEPENDS=           asciidoctor:textproc/rubygem-asciidoctor
DOCS_CMAKE_BOOL=              NN_ENABLE_DOC

PORTDOCS=                     *

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig/
	-${MV} ${PREFIX}/lib/pkgconfig/nanomsg.pc ${PREFIX}/libdata/pkgconfig/nanomsg.pc

.include <bsd.port.mk>
