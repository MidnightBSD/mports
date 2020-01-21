PORTNAME=		protobuf-c
PORTVERSION=		1.3.2
DISTVERSIONPREFIX=	v
CATEGORIES=		devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Code generator and libraries to use Protocol Buffers from pure C

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libprotobuf.so:devel/protobuf

USES=		autoreconf compiler:c++11-lang gmake libtool pkgconfig
GNU_CONFIGURE=	yes
USE_GITHUB=	yes
USE_LDCONFIG=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	DOCS

PORTDOCS=	*

ALL_TARGET=	all
INSTALL_TARGET=	install-strip

tests: build
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check)

.include <bsd.port.mk>
