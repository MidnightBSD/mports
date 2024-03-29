PORTNAME=	protobuf
PORTVERSION=	3.19.6
DISTVERSIONPREFIX=	cpp-
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/protocolbuffers/protobuf/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Data interchange format library

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_sparc64=	fails to compile: no atomic ops available

USES=		compiler:c++11-lang cpe gmake libtool localbase pathfix pkgconfig

CFLAGS+=	-D_THREAD_SAFE -DGOOGLE_PROTOBUF_NO_RTTI -I${WRKSRC}/src
CONFIGURE_ENV=	CC_FOR_BUILD="${CC}" \
		CFLAGS_FOR_BUILD="${CFLAGS}" \
		CPPFLAGS_FOR_BUILD="${CPPFLAGS}" \
		CXX_FOR_BUILD="${CXX}" \
		CXXFLAGS_FOR_BUILD="${CXXFLAGS}" \
		LDFLAGS_FOR_BUILD="${LDFLAGS}"
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_CXXSTD=	c++11
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
CPE_VENDOR=	google
NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|^check-local:|disabled-&|' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -Ee 's,[^ 	]*lib(gtest|gmock.*)\.la,-l\1,' ${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
