PORTNAME=	nvidia-texture-tools
PORTVERSION=	2.1.2
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Texture Tools with support for DirectX 10 texture formats
WWW=		https://github.com/castano/nvidia-texture-tools

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

# see src/nvcore/nvcore.h
ONLY_FOR_ARCHS=		amd64 i386 powerpc powerpc64

LIB_DEPENDS=	libpng.so:graphics/png \
		libtiff.so:graphics/tiff \
		libOpenEXR.so:graphics/openexr

USE_GITHUB=	yes
GH_ACCOUNT=	castano

USES=		cmake compiler:c++11-lang jpeg
CMAKE_ARGS=	-DNVTT_SHARED=TRUE

CFLAGS+=	-fPIC
CXXFLAGS+=	-fPIC

PORTDOCS=	README.md ChangeLog

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

post-patch:
	${REINPLACE_CMD} -e 's|#include <alloca.h>|#include <stdlib.h>|' ${WRKSRC}/src/nvmath/Matrix.cpp

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
